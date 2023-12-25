class Temperatures::MaxCelsiusService < Temperatures::BaseService
  def call
    celsius.max
  end
end
