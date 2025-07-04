class ReminderMailer < ApplicationMailer
  def due_date_reminder(user, ticket)
    @user = user
    @ticket = ticket
    return if @user.email.blank?

    mail(to: @user.email, subject: "Reminder for Ticket: #{@ticket.title}.")
  end
end
