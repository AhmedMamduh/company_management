require 'rails_helper'

RSpec.describe UserReminderCronService, type: :service do
  let(:user) { create(:user, time_zone: 'Europe/Vienna', due_date_reminder_time: Time.parse('10:30')) }
  let(:service) { described_class.new(user) }

  describe '#schedule!' do
    context 'when the user is valid to send due date reminders' do
      before { allow(user).to receive(:valid_to_send_due_date_reminder?).and_return(true) }

      it 'creates a cron job with correct arguments' do
        expect(Sidekiq::Cron::Job).to receive(:create).with(
          hash_including(
            name: "user_#{user.id}_send_due_date_reminder",
            cron: kind_of(String),
            class: 'DueDateReminderWorker',
            args: [user.id]
          )
        )

        service.schedule!
      end
    end

    context 'when the user is not valid to send due date reminders' do
      before { allow(user).to receive(:valid_to_send_due_date_reminder?).and_return(false) }

      it 'removes the cron job' do
        expect(Sidekiq::Cron::Job).to receive(:destroy).with("user_#{user.id}_send_due_date_reminder")
        service.schedule!
      end
    end
  end

  describe '#remove!' do
    it 'destroys the cron job' do
      expect(Sidekiq::Cron::Job).to receive(:destroy).with("user_#{user.id}_send_due_date_reminder")
      service.remove!
    end
  end
end
