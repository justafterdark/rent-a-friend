class Crowd < ApplicationRecord
  belongs_to :event
  has_many :jobs
  has_many :mobfriends, through: :jobs

  validates :size, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 5, less_than: 100 }
end
