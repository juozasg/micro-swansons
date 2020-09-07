require "nats"
nc = NATS::Connection.new("demo.nats.io")

puts("NATS::Connection established. publish heartbeat to swanson-rpc")

loop do
  print(".")
  STDOUT.flush
  nc.publish("swanson-rpc", "natsproducer heartbeat")
  sleep 2
end
