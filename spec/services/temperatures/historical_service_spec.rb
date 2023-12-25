require 'rails_helper'

RSpec.describe Temperatures::HistoricalService do
  let(:location_id) { 1 }

  describe '#call' do
    before { create_list(:temperature, 25, location_id: location_id) }
    subject(:service) { described_class.new(location_id) }

    it 'returns historical temperatures' do
      data = service.call
      expect(data.count).to eq(24)
      expect(data.first['timestamp'] == data.pluck('timestamp').max).to eq(true)
    end

    context 'when data cached' do
      it 'return data from cache' do
        service.call
        Temperature.destroy_all
        expect(service.call.count).to eq(24)
      end
    end
  end
end
