require 'rails_helper'

RSpec.describe HealthController, type: :controller do
  describe '#health' do
    it 'returns a successful response' do
      get :health
      expect(response).to have_http_status(:ok)
    end

    it 'returns JSON with status "OK"' do
      get :health
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to eq('OK')
    end
  end
end
