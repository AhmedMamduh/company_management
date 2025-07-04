# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2025_07_04_181301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tickets", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.date "due_date", null: false
    t.integer "status_id"
    t.integer "progress", default: 0
    t.integer "assigned_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.boolean "send_due_date_reminder", default: true
    t.integer "due_date_reminder_interval", default: 0
    t.time "due_date_reminder_time"
    t.string "time_zone", default: "Europe/Vienna"
    t.integer "reminder_channel", default: 0
  end

end
