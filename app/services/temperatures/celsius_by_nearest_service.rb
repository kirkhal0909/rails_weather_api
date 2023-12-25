class Temperatures::CelsiusByNearestService < ApplicationService
  attr_reader :location_id, :timestamp

  def initialize(location_id, timestamp)
    @location_id = location_id
    @timestamp = timestamp
  end

  def call
    CACHE.fetch(cache_key, expires_in: 1.hour) do
      Temperature.where(location_id: location_id)
                 .order("ABS(timestamp - #{timestamp.to_i})").as_json(only: [:timestamp, :celsius]).first
    end
  end

  def cache_key
    "temperatures_nearest/#{location_id}/#{timestamp}"
  end
end
