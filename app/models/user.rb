class User < ApplicationRecord
  has_many :tickets, class_name: 'Ticket', dependent: :nullify, foreign_key: 'assigned_user_id'
end
