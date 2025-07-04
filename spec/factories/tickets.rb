FactoryBot.define do
  factory :ticket do
    title { "MyString" }
    description { "MyText" }
    due_date { "2025-07-04" }
    status_id { 1 }
    progress { 1 }
    user { nil }
  end
end
