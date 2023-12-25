require 'rails_helper'

RSpec.describe Weather::API do
  before do
    create(:temperature, location_id: 294021, celsius: 15)
    create(:temperature, location_id: 294021, celsius: 30, timestamp: 1631823790)
  end

  describe 'GET /weather/current' do
    it 'returns historical temperatures' do
      get '/weather/current'
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /weather/historical' do
    it 'returns Swagger documentation' do
      get '/weather/historical'
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /weather/historical/min' do
    it 'returns Swagger documentation' do
      get '/weather/historical/min'
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /weather/historical/max' do
    it 'returns Swagger documentation' do
      get '/weather/historical/max'
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /weather/historical/avg' do
    it 'returns Swagger documentation' do
      get '/weather/historical/avg'
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /weather/by_time?timestamp=1621823790' do
    it 'returns Swagger documentation' do
      get '/weather/by_time?timestamp=1621823790'
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq({timestamp: 1631823790, celsius: 30}.as_json)
    end
  end
end
