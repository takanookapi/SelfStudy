require 'rails_helper'

RSpec.describe "TimeReports", type: :request do
  before do
    @time_report = FactoryBot.create(:time_report)
  end


end

# bundle exec rspec spec/requests/time_reports_spec.rb