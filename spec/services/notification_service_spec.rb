require 'rails_helper'

RSpec.describe NotificationService, type: :service do
  let(:user) { create(:user, reminder_channel: 'email', email: 'test@test.com') }
  let(:ticket) { create(:ticket, title: 'Test Ticket') }

  describe '#send_due_date_reminder' do
    it 'sends an email if reminder_channel is email' do
      mailer = double(deliver_later: true)
      expect(ReminderMailer).to receive(:due_date_reminder).with(user, ticket).and_return(mailer)
      expect(mailer).to receive(:deliver_later)

      described_class.new(user, ticket).send_due_date_reminder
    end
  end
end
