FactoryBot.define do
  factory :password_credential do
    user { FactoryBot.create(:user) }
    scheme { "TestScheme v1.0" }
    data1 { 10 }
    data2 { 11 }
    valid_until { Time.now + 1.day }
    enabled { true }

    # Create traits for various schemes
  end
end
