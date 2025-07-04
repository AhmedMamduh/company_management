class UserReminderCronService
  def initialize(user)
    @user = user
    @job_name = "user_#{@user.id}_send_due_date_reminder"
  end

  def schedule!
    return remove! unless @user.valid_to_send_due_date_reminder?

    cron_expression = build_cron_expression

    Sidekiq::Cron::Job.create(
      name: @job_name,
      cron: cron_expression,
      class: 'DueDateReminderWorker',
      args: [@user.id],
      description: "Due date reminders for user #{@user.id}"
    )
  end

  def remove!
    Sidekiq::Cron::Job.destroy(@job_name)
  end

  private

  def build_cron_expression
    time_zone = ActiveSupport::TimeZone.new(@user.time_zone)
    user_time = time_zone.parse(@user.due_date_reminder_time.strftime('%H:%M'))
    utc_time = user_time.utc

    "#{utc_time.min} #{utc_time.hour} * * *"
  end
end
