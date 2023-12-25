#app/clients/accu_weather.rb

class AccuWeather::Client
  BASE_URL = 'http://dataservice.accuweather.com/currentconditions/v1/'

  def initialize
    @api_key = ENV['ACCUWEATHER_API']
  end

  def get_historical_data(location_id)
    get("#{location_id}/historical/24", { apikey: @api_key })
  end

  private

  def get(path, params)
    uri = URI.parse("#{BASE_URL}#{path}")
    uri.query = URI.encode_www_form(params)

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    return { response: JSON.parse(response.body).map(&:deep_symbolize_keys) } if response.is_a?(Net::HTTPSuccess)

    { error: true, code: response.code, message: response.message }
  end
end
