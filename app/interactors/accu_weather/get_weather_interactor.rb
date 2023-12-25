class AccuWeather::GetWeatherInteractor < ApplicationInteractor
  def call
    context.response = get_weather
    context.fail!(error: 'Failed to get weather data') if context.response[:error].present?
  end

  def get_weather
    response = CACHE.read(cache_key)
    context.save_records = false
    return response if response&.dig(:response)

    context.save_records = true
    response = client.get_historical_data(context.location_id)
    CACHE.write(cache_key, response, expires_in: 1.hour)
    response
  end

  def client
    @client ||= AccuWeather::Client.new
  end

  def cache_key
    "accu_weather_last_24_hours/#{context.location_id}"
  end
end
