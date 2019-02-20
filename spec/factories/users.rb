FactoryBot.define do
  factory :user do
    display_name { Faker::Name.unique.name  }
    email_address { Faker::Internet.email }
    tags { [] }
    enabled { true }

    trait(:disabled) { enabled { false } }
  end
end
