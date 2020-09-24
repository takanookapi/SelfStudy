require 'rails_helper'

def visit_with_http_auth(path)
  username = ENV["STUDY"] 
  password = ENV["STUDY_password"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'コメント投稿', type: :system do
  before do
    @time_report = FactoryBot.create(:time_report)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーは自己学習投稿の詳細ページでコメントできる' do
    # ログインする
    visit_with_http_auth new_user_session_path
    fill_in 'Email', with: @time_report.user.email
    fill_in 'Password', with: @time_report.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # 投稿詳細ページに遷移する
    visit time_report_path(@time_report)
    # フォームに情報を入力する
    fill_in 'comment_content', with: @comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Comment.count }.by(1)
    # トップページにリダイレクトされることを確認する
    expect(current_path).to eq root_path
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    visit time_report_path(@time_report)
    expect(page).to have_content @comment
  end
end

# bundle exec rspec spec/system/comments_spec.rb