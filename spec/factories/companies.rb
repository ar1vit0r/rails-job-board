FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    website { Faker::Internet.url }
    description { Faker::Company.catch_phrase }
  end
end
