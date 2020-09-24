FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    exp_point             { '60'}
    sum_time              { '20' }
    level                 { '10' }
  end
end
