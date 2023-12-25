FactoryBot.define do
  factory :temperature do
    location_id { 294021 }
    celsius { rand(-2.0..20.0).round(1) }
    timestamp { rand(1..1_000_000) }
  end
end
