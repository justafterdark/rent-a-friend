class Job < ApplicationRecord
  belongs_to :event
  belongs_to :mobfriend
end
