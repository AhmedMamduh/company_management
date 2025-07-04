class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.date :due_date, null: false
      t.integer :status_id
      t.integer :progress
      t.integer :assigned_user_id, foreign_key: true

      t.timestamps
    end
  end
end
