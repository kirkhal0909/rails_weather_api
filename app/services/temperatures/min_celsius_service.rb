class Temperatures::MinCelsiusService < Temperatures::BaseService
  def call
    celsius.min
  end
end
