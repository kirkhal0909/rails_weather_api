require 'rails_helper'

RSpec.describe AccuWeather::FetchTemperaturesOrganizer do
  let(:location_id) { 111 }
  subject(:organizer) { described_class.call(location_id: location_id) }

  describe '#call' do
    context 'when the data is not in the cache' do
      before do
        stub_request(:get, /dataservice.accuweather.com/)
          .to_return(status: 200, body: File.read('spec/fixtures/accu_weather/client/get_historical_data.json'))
      end

      it 'fetches historical data from the AccuWeather API' do
        expect(organizer.temperatures.first.values).to eq([location_id, 1703217420, 1.1])
      end

      it 'created 3 temperatures' do
        organizer
        expect(Temperature.count).to eq(3)
      end
    end

    context 'when the data is in the cache' do
      before do
        CACHE.write("accu_weather_last_24_hours/#{location_id}", { response: [{ EpochTime: 123 }] })
      end

      it 'used data from the cache' do
        expect(WebMock).not_to have_requested(:any, /dataservice.accuweather.com/)
        expect(organizer.temperatures.first.values).to eq([location_id, 123, nil])
      end
    end

    context 'when response is blank' do
      before do
        stub_request(:get, /dataservice.accuweather.com/)
          .to_return(status: 401, body: { error: 'some error' }.to_json)
      end

      it 'fetches historical data from the AccuWeather API' do
        expect(organizer.error).to eq('Failed to get weather data')
      end
    end
  end
end
