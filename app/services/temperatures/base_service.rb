class Temperatures::BaseService < ApplicationService
  attr_reader :location_id

  def initialize(location_id)
    @location_id = location_id
  end

  def celsius
    temperatures.pluck('celsius')
  end

  def temperatures
    CACHE.fetch(cache_key, expires_in: 1.hour) do
      Temperature.where(location_id: location_id)
                 .order(timestamp: :desc).limit(24).as_json(only: [:timestamp, :celsius])
    end
  end

  def cache_key
    "temperatures_last_24/#{location_id}"
  end
end
