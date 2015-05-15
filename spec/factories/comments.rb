FactoryGirl.define do
  factory :comment do
    commenter { Faker::Lorem.characters }
    body { Faker::Lorem.words }
  end
end
