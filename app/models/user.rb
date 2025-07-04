class User < ApplicationRecord
  has_many :tickets, class_name: 'Ticket', foreign_key: 'assigned_user_id'

  enum reminder_channel: { email: 0, sms: 1, push_message: 2 }

  after_commit :update_due_date_reminder_cron, if: proc { saved_change_to_due_date_reminder_time? }

  def valid_to_send_due_date_reminder?
    send_due_date_reminder && !due_date_reminder_time.blank?
  end

  def update_due_date_reminder_cron
    UserReminderCronService.new(self).schedule!
  end
end
