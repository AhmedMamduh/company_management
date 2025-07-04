FactoryBot.define do
  factory :user do
    name { Faker::Artist.name }
    email { Faker::Internet.email }
    send_due_date_reminder { true }
    due_date_reminder_interval { 0 }
    due_date_reminder_time { "09:00" }
    time_zone { "Europe/Vienna" }
  end
end
