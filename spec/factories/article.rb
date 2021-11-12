FactoryBot.define do
  factory :article do
    id {1}
    title {"Test article"}
    body {"some text with at least 10 chars"}
    status {"public"}
    user_id {1}
  end
end