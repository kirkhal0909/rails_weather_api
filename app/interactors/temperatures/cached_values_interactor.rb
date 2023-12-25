class Temperatures::CachedValuesInteractor < ApplicationInteractor
  def call
    context.temperatures = temperatures
  end

  def temperatures
    CACHE.fetch(cache_key, expires_in: 1.hour) do
      Temperature.order(timestamp: :desc).limit(24).as_json(only: [:timestamp, :celsius])
    end
  end

  def cache_key
    "temperatures_last_24/#{context.location_id}"
  end
end
