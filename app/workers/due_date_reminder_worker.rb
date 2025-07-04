class DueDateReminderWorker
  include Sidekiq::Worker
  sidekiq_options queue: :medium, retry: 2

  def perform(user_id)
    user = User.find_by(id: user_id)
    return unless user&.valid_to_send_due_date_reminder?

    time_now = Time.current
    due_date = (time_now + user.due_date_reminder_interval.days).in_time_zone(user.time_zone).to_date

    user.tickets.pending.where(due_date: due_date).each do |ticket|
      NotificationService.new(user, ticket).send_due_date_reminder
    end
  end
end
