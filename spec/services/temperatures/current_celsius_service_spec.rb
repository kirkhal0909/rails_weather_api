require 'rails_helper'

RSpec.describe Temperatures::CurrentCelsiusService do
  let(:location_id) { 1 }
  let(:celsius) { [10, 15, 30] }

  describe '#call' do
    before do
      create(:temperature, location_id: location_id, celsius: celsius[0])
      create(:temperature, location_id: location_id, celsius: celsius[1], timestamp: Time.now.to_i)
      create(:temperature, location_id: location_id, celsius: celsius[2])
    end
    subject(:service) { described_class.new(location_id) }

    it 'returns current temperature' do
      expect(service.call).to eq(celsius[1])
    end
  end
end
