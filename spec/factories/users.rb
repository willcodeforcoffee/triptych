FactoryBot.define do
  factory :user do
    display_name { "MyString" }
    email_address { "MyString" }
    tags { "MyString" }
    enabled { false }
  end
end
