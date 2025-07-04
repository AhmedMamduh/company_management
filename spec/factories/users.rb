FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    send_due_date_reminder { false }
    due_date_reminder_interval { 1 }
    due_date_reminder_time { "2025-07-04 21:09:04" }
    time_zone { "MyString" }
  end
end
