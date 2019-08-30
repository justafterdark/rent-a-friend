class Job < ApplicationRecord
  belongs_to :crowd
  belongs_to :event
  belongs_to :mobfriend
  validates :event, presence: true
end
