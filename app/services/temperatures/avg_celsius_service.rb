class Temperatures::AvgCelsiusService < Temperatures::BaseService
  def call
    (celsius.sum / celsius.count).round(2)
  end
end
