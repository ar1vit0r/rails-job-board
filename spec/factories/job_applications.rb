FactoryBot.define do
  factory :job_application do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    message { Faker::Lorem.paragraph }
    job
  end
end
