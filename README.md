# CompanyManagement

A Ruby on Rails API-only app to manage construction defect **tickets** and send due date reminders.

---

## 🚀 Features

* Users manage **tickets** with due dates.
* Users configure their preferred reminder time and time zone.
* Sends email reminders when a ticket is near its due date.
* Background jobs with **Sidekiq & Sidekiq-Cron**.

---

## ⚙️ Setup & Installation

### 1. Clone the Repository

```bash
git clone https://github.com/AhmedMamduh/company_management.git
cd company_management
```

### 2. Install Dependencies

```bash
bundle install
```

### 3. Configure Database

* Update `config/database.yml` with your PostgreSQL settings.
* Then run:

```bash
rails db:create db:migrate
```

### 4. Start Sidekiq

Run Sidekiq:

```bash
bundle exec sidekiq
```

### 5. Start the Rails Server

```bash
rails s
```

### 6. Access the Sidekiq Dashboard

* Sidekiq Web UI: [http://localhost:3000/sidekiq](http://localhost:3000/sidekiq)
* Cron jobs are visible in the **“Cron”** tab.

---

## ⏰ Due Date Reminders

Each user configures:

* ✅ Whether to receive reminders.
* ✅ How many days before the due date to notify.
* ✅ The exact time of day to send notifications (in their time zone).
* ✅ The preferred notification channel (**email** for now).

A **Sidekiq-Cron job** is scheduled for each user after saved, running daily at their configured reminder time.

---

## ✅ Running Tests

Run the full RSpec test suite:

```bash
bundle exec rspec
```

---

## 🔮 Future Improvements

* [ ] Setting up mail delivery.
* [ ] Add user authentication (**Devise + JWT**).
* [ ] Add SMS & Push notifications.

---
