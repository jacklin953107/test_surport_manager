class Message < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates_presence_of :name
end
