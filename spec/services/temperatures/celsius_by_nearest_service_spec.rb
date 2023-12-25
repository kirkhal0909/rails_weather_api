require 'rails_helper'

RSpec.describe Temperatures::CelsiusByNearestService do
  let(:location_id) { 1 }
  let(:celsius) { [10, 15, 30] }

  describe '#call' do
    before do
      create(:temperature, location_id: location_id, celsius: celsius[0], timestamp: 100)
      create(:temperature, location_id: location_id, celsius: celsius[1], timestamp: 50)
      create(:temperature, location_id: location_id, celsius: celsius[2], timestamp: 500)
    end
    subject(:service) { described_class }

    it 'returns timestamp and celsius' do
      expect(service.new(location_id, 0).call).to include('timestamp', 'celsius')
    end

    it 'returns nearest' do
      expect(service.new(location_id, 0).call['timestamp']).to eq(50)
      expect(service.new(location_id, 200).call['timestamp']).to eq(100)
      expect(service.new(location_id, 1000).call['timestamp']).to eq(500)
    end
  end
end
