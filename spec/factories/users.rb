FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    bio { "MyText" }
    telephone { "MyString" }
    password_digest { "MyString" }
  end
end
