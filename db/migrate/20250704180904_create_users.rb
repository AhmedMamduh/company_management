class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.boolean :send_due_date_reminder, default: true
      t.integer :due_date_reminder_interval, default: 0
      t.time :due_date_reminder_time
      t.string :time_zone, default: 'Europe/Vienna'
      t.integer :reminder_channel, default: 0
    end
  end
end
