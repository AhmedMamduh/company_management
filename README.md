# CompanyManagement

A Ruby on Rails API-only app to send due date reminders for construction defect tickets.

## Features
- Users manage tickets with due dates.
- Users configure their preferred reminder time and time zone.
- Sends email reminders when a ticket is near its due date.
- Sidekiq & Sidekiq-Cron for background jobs.

⚙️ Setup & Installation

1. Clone the Repository
git clone https://github.com/AhmedMamduh/company_management.git
cd company_management

2. Install Dependencies
bundle install

3. Configure Database
Update config/database.yml with your PostgreSQL settings.
Then run:

rails db:create db:migrate

4. Start Redis & Sidekiq
Start Redis (for Sidekiq to work):

redis-server
Run Sidekiq:
bundle exec sidekiq

5. Start the Rails Server
rails s

7. Access the Sidekiq Dashboard
Sidekiq Web UI: http://localhost:3000/sidekiq
Cron jobs are visible in the “Cron” tab.


⏰ Due Date Reminders

Each user configures:

✅ Whether to receive reminders
✅ How many days before due date to notify
✅ The exact time of day to send notifications (their local timezone)
✅ Preferred notification channel (email for now)
A Sidekiq-Cron job is scheduled for each user, running daily at their chosen time.

✅ Running Tests

Run the full RSpec test suite:
bundle exec rspec

🔮 Future Improvements

 Setting up mail delivery
 Add user authentication (e.g., Devise + JWT)
 Add SMS & Push notifications
