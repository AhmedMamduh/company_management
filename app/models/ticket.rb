class Ticket < ApplicationRecord
  belongs_to :assigned_user, class_name: 'User'

  enum progress: { pending: 0, in_progress: 1, completed: 2 }
end
