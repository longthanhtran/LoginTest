FactoryBot.define do
  factory :user do
    username { "user1" }
    password_digest { "password" }
  end

  factory :rule do
    cidr { "127.0.0.0/8" }
    permission { 0 }
    user
  end
end

