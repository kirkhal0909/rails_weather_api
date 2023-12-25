class Temperature < ApplicationRecord
  validates :location_id, presence: true
  validates :timestamp, presence: true
  validates :celsius, presence: true

  validates_uniqueness_of :location_id, scope: :timestamp
end
