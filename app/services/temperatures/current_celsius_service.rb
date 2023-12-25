class Temperatures::CurrentCelsiusService < Temperatures::BaseService
  def call
    celsius.first
  end
end
