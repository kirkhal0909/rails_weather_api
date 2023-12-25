class AccuWeather::SaveTemperaturesInteractor < ApplicationInteractor
  def call
    return unless context.save_records

    Temperature.create(temperatures)
  end

  def temperatures
    context.temperatures.select { |temperature| temperature[:timestamp] >= min_timestamp }
  end

  def min_timestamp
    (Temperature.where(location_id: context.location_id).maximum(:timestamp) || 0) + 1.hour.to_i
  end

  def cache_key
    "accu_weather_max_timestamp/#{context.location_id}"
  end
end
