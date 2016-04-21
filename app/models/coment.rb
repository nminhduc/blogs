class Coment < ActiveRecord::Base
  belongs_to :user
  belongs_to :entry
  default_scope -> { order(created_at: :desc) }
end
