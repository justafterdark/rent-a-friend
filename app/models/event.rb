class Event < ApplicationRecord
  belongs_to :user
  has_many :jobs
  geocoded_by :event_location
  after_validation :geocode, if: :will_save_change_to_event_location?
end
