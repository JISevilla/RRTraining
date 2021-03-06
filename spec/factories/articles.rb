FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.characters(5) }
    text { Faker::Lorem.words }
  end
  factory :article_title_nil do
    text { Faker::Lorem.words }
  end
  factory :article_title_short do
    title { Faker::Lorem.characters(4) }
  end
end
