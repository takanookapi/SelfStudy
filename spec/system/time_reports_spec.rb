require 'rails_helper'

def visit_with_http_auth(path)
  username = ENV["STUDY"] 
  password = ENV["STUDY_password"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe '自己学習投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @time_report_memo = Faker::Lorem.sentence
  end
  context '自己学習投稿ができるとき'do
  it 'ログインしたユーザーは新規投稿できる' do
    # ログインする
    visit_with_http_auth new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # 時間記録ページへのリンクがあることを確認する
    expect(
    find(".user_nav").find("span").hover
    ).to have_content('時間記録')
    # 時間記録ページに移動する
    visit new_time_report_path
    # フォームに情報を入力する
    find("option[value='0.5']").select_option
    find("option[value='30']").select_option
    fill_in 'item-image3', with: @time_report_memo
    # 送信するとTimeReportモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { TimeReport.count }.by(1)
    # 投稿完了ページに遷移することを確認する
    expect(current_path).to eq root_path
    # トップページには先ほど投稿した内容の自己学習が存在することを確認する（テキスト）
    expect(page).to have_content(@time_report_memo)
    # トップページには先ほど投稿した内容の自己学習が存在することを確認する（時間）
    expect(page).to have_content(@time_report_study_time)
    # トップページには先ほど投稿した内容の自己学習が存在することを確認する（日付）
    expect(page).to have_content(@time_report_study_date)
    end
  end
  context '自己学習投稿ができないとき'do
  it 'ログインしていないと新規投稿ページに遷移できない' do
    # トップページに遷移する
    visit root_path
    # 新規投稿ページへのリンクがない
    expect(page).to have_no_content('時間投稿')
    end
  end
end

RSpec.describe '自己学習編集', type: :system do
  before do
    @time_report1 = FactoryBot.create(:time_report)
    @time_report2 = FactoryBot.create(:time_report)
  end
  context '自己学習編集ができるとき' do
  it 'ログインしたユーザーは自分が投稿した自己学習の編集ができる' do
    #time_report1を投稿したユーザーでログインする
    visit new_user_session_path
    fill_in 'Email', with: @time_report1.user.email
    fill_in 'Password', with: @time_report1.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # time_report1に「編集」ボタンがあることを確認する
    expect(page).to have_content('編集')
    # 編集ページへ遷移する
    visit edit_time_report_path(@time_report1)
    # すでに投稿済みの内容がフォームに入っていることを確認する
    expect(
    find('#item-image3').value
    ).to eq @time_report1.memo
    # 投稿内容を編集する
    find("option[value='2.0']").select_option
    find("option[value='60']").select_option
    fill_in 'item-image3', with: @time_report_memo, with:"#{@time_report1.memo}+編集したmemo"
    # 編集してもTimeReportモデルのカウントは変わらないことを確認する
    expect{
    find('input[name="commit"]').click
    }.to change { TimeReport.count }.by(0)
    # トップページに遷移する
    visit root_path
    # トップページには先ほど変更した内容のmemoが存在することを確認する（テキスト）
    expect(page).to have_content("#{@time_report1.memo}+編集したmemo")
    # トップページには先ほど投稿した内容の自己学習が存在することを確認する（時間）
    expect(page).to have_content(@time_report1_study_time)
    # トップページには先ほど投稿した内容の自己学習が存在することを確認する（日付）
    expect(page).to have_content(@time_report1_study_date)
    end
  end
  context '自己学習編集ができないとき' do
  it 'ログインしたユーザーは自分以外が投稿した編集画面には遷移できない' do
    # time_report1を投稿したユーザーでログインする
    visit new_user_session_path
    fill_in 'Email', with: @time_report1.user.email
    fill_in 'Password', with: @time_report1.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # time_report2に「編集」ボタンがないことを確認する
    expect(
      all(".more_list")[0].hover
    ).to have_no_link '編集', href: edit_time_report_path(@time_report2)
    end
  end
end

RSpec.describe '自己学習削除', type: :system do
  before do
    @time_report1 = FactoryBot.create(:time_report)
    @time_report2 = FactoryBot.create(:time_report)
  end
  context '自己学習削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿した自己学習の削除ができる' do
    # time_report1を投稿したユーザーでログインする
    visit new_user_session_path
    fill_in 'Email', with: @time_report1.user.email
    fill_in 'Password', with: @time_report1.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # time_report1に「削除」ボタンがあることを確認する
    expect(page).to have_content('削除')
    # 投稿を削除するとレコードの数が1減ることを確認する
    expect{
      (page).find_link('削除', href: time_report_path(@time_report1)).click
    }.to change { TimeReport.count }.by(-1)
    # トップページに遷移する
    visit root_path
    # トップページにはtime_report1の内容が存在しないことを確認する（テキスト）
    expect(page).to have_no_content("#{@time_report1.memo}")
    # トップページには先ほど投稿した内容の自己学習が存在しないことを確認する（時間）
    expect(page).to have_no_content("#{@time_report1.study_time}")
    # トップページには先ほど投稿した内容の自己学習が存在しないことを確認する（日付）
    expect(page).to have_no_content("#{@time_report1.study_date}")
    end
  end
  context '自己学習削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した自己学習の削除ができない' do
      # time_report1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @time_report1.user.email
      fill_in 'Password', with: @time_report1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # time_report2に「削除」ボタンが無いことを確認する
      expect(
      all(".more_list")[0].hover
      ).to have_no_link '削除', href: time_report_path(@time_report2)
    end
  end
end

RSpec.describe '自己学習詳細', type: :system do
  before do
    @time_report = FactoryBot.create(:time_report)
  end
  it 'ログインしたユーザーは自己学習詳細ページに遷移してコメント投稿欄が表示される' do
    # ログインする
    visit new_user_session_path
    fill_in 'Email', with: @time_report.user.email
    fill_in 'Password', with: @time_report.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # 学習投稿に「詳細」ボタンがあることを確認する
    expect(page).to have_link '💬', href: time_report_path(@time_report)
    # 詳細ページに遷移する
    visit time_report_path(@time_report)
    # コメント用のフォームが存在する
    expect(page).to have_selector 'form'
  end
end

# bundle exec rspec spec/system/time_reports_spec.rb