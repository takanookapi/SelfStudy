FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    # exp_point             { Faker::Number.number }
    # sum_time              { Faker::Number.number }
    # level                 { Faker::Number.number }
  end
end
