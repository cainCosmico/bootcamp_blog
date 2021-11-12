FactoryBot.define do
  factory :user do
    id {1}
    email {"test@user.com"}
    password {"qwerty"}
    confirmed_at {Time.now}
  end
end