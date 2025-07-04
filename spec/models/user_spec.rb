require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "can detect reminder time" do
    user = create(:user, send_due_date_reminder: true, due_date_reminder_time: "09:00", time_zone: "Europe/Vienna")
    expect(user.valid_to_send_due_date_reminder?).to be true
  end

  it "can not detect reminder time" do
    user = create(:user, send_due_date_reminder: false, due_date_reminder_time: "09:00", time_zone: "Europe/Vienna")
    expect(user.valid_to_send_due_date_reminder?).to be false
  end
end
