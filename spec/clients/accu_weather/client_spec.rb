require 'rails_helper'

RSpec.describe AccuWeather::Client do
  describe '#get_historical_data' do
    let(:location_id) { 123 }

    context 'when the request is successful' do
      it 'returns parsed JSON response' do
        stub_request(:get, /dataservice.accuweather.com/).to_return(
          status: 200,
          body: File.read('spec/fixtures/accu_weather/client/get_historical_data.json')
        )

        client = AccuWeather::Client.new
        result = client.get_historical_data(location_id)

        expect(result).to be_an(Array)
        expect(result.first).to include('LocalObservationDateTime', 'Temperature')
      end
    end

    context 'when the request is unsuccessful' do
      it 'return nil' do
        stub_request(:get, /dataservice.accuweather.com/).to_return(
          status: 404,
          body: 'Not Found'
        )

        expect(AccuWeather::Client.new.get_historical_data(location_id)).to be_nil
      end
    end
  end
end
