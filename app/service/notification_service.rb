class NotificationService
  def initialize(user, ticket)
    @user = user
    @ticket = ticket
  end

  def send_due_date_reminder
    case @user.reminder_channel
    when 'email'
      ReminderMailer.due_date_reminder(@user, @ticket).deliver_later
    end
  end
end
