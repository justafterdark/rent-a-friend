class Event < ApplicationRecord
  belongs_to :user
  has_one :crowd, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :mobfriends, through: :jobs
  geocoded_by :event_location
  after_validation :geocode, if: :will_save_change_to_event_location?
end
