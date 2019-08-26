class Mobfriend < ApplicationRecord
  belongs_to :user
  has_many :jobs
  has_many :events, through: :jobs
end
