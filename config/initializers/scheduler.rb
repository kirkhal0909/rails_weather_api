
return unless defined?(Rails::Server)

require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

# Запуск задачи каждые 24 часа
scheduler.every '24h', first_in: 0 do
  puts(" [SCHEDULER] AccuWeather::FetchTemperaturesOrganizer.call(location_id: #{MOSCOW_LOCATION_ID})")
  AccuWeather::FetchTemperaturesOrganizer.call(location_id: MOSCOW_LOCATION_ID)
end

# Запуск планировщика

Thread.new do
  scheduler.join
rescue StandardError => e
  puts "Rufus thred crashed: #{e.message}"
  puts 'Restarting the thread...'
  retry
end

