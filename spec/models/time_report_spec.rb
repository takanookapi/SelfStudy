require 'rails_helper'

RSpec.describe TimeReport, type: :model do
  describe '#create' do
  before do
  @time_report = FactoryBot.build(:time_report)
end

  #投稿の保存
  #投稿がうまくいくとき

    it "全てが存在すれば投稿可能"do
    expect(@time_report).to be_valid
    end

  #投稿がうまくいかない時

    it "memoがないと保存できない"do
    @time_report.memo = ""
    @time_report.valid?
    expect(@time_report.errors.full_messages).to include("Memo can't be blank")
    end
  end
end

# bundle exec rspec spec/models/time_report_spec.rb
