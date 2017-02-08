class Event < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :category
  belongs_to :user
  validates_presence_of :title, :content
end
