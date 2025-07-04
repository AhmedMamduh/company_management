FactoryBot.define do
  factory :ticket do
    title { Faker::Appliance.brand }
    description { Faker::Appliance.equipment }
    due_date { Faker::Date.forward }
    status_id { 0 }
    progress { 0 }
    association :assigned_user, factory: :user
  end
end
