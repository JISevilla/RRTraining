FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'qweqweqwe'
    password_confirmation 'qweqweqwe'
  end
end
