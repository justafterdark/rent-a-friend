class Event < ApplicationRecord
  belongs_to :user
  has_one :crowd, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :mobfriends, through: :jobs
end
