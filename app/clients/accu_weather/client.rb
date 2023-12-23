#app/clients/accu_weather.rb

class AccuWeather::Client
  BASE_URL = 'http://dataservice.accuweather.com/currentconditions/v1/'

  def initialize
    @api_key = ENV['ACCUWEATHER_API']
  end

  def get_historical_data(location_id)
    response = get("#{location_id}/historical/24", { apikey: @api_key })
    return JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)

    puts "Ошибка #{response.code}: #{response.message}"
  end

  private

  def get(path, params)
    uri = URI.parse("#{BASE_URL}#{path}")
    uri.query = URI.encode_www_form(params)

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)

    http.request(request)
  end
end
