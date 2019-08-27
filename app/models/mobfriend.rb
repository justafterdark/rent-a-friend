class Mobfriend < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy
  has_many :events, through: :jobs

  validates :tagline, length: { maximum: 140 }
end
