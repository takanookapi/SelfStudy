FactoryBot.define do
  factory :time_report do
    exp                        { '60' }
    study_date                 { Faker::Date.backward }
    study_time                 { Faker::Number.within(range: 0.5..18.0) }
    memo                       { Faker::Lorem.sentence }
    association :user 
  end
end
