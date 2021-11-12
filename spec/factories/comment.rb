FactoryBot.define do
  factory :comment do
    id {1}
    commenter {"qwerty"}
    body {"some body with at least 10 chars"}
    status {"public"}
  end
end
