class HealthController < ApplicationController
  def health
    render json: { status: 'OK' }
  end
end
