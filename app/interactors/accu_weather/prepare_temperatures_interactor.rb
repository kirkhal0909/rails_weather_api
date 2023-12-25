class AccuWeather::PrepareTemperaturesInteractor < ApplicationInteractor
  def call
    context.temperatures = context.response[:response].map do |temperature|
      {
        location_id: context.location_id,
        timestamp: temperature.dig(:EpochTime),
        celsius: temperature.dig(:Temperature, :Metric, :Value)
      }
    end
  end
end
