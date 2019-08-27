class Mobfriend < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy
  has_many :events, through: :jobs

  validates :tagline, presence: true, length: { maximum: 140 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true, length: { maximum: 600 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 18, less_than: 100 }
  validates :gender, presence: true, inclusion: { in: %w[male female] }
  validates :language, presence: true
  validates :photo_url, presence: true
  validates :hourly_rate, presence: true, numericality: { only_integer: true }
end
