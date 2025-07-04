require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it "has a valid factory" do
    user = build(:user)
    expect(create(:ticket, assigned_user: user)).to be_valid
  end
end
