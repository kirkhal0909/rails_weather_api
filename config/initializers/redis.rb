require 'redis'

$redis = Redis.new(url: CONFIG[:redis][:url])
