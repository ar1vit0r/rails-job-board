FactoryBot.define do
  factory :job do
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
    location { Faker::Address.city }
    remote { false }
    salary_min { rand(50000..100000) }
    salary_max { rand(100001..200000) }
    company
  end
end
