FactoryBot.define do
  factory :content_block, class: 'Content::Block' do
    key { "MyString" }
    link { "MyString" }
    title { "MyString" }
    summary { "MyText" }
    content { "MyText" }
    author { "MyString" }
    published_at { "2019-04-06 16:28:05" }
    version { 1 }
  end
end
