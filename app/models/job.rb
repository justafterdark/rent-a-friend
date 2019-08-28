class Job < ApplicationRecord
  belongs_to :event
  belongs_to :mobfriend
  validates :event, presence: true
  validates :mobfriend, presence: true
end
