require "nats"
nc = NATS::Connection.new("demo.nats.io")

loop do
  print(".")
  STDOUT.flush
  nc.publish("swanson-rpc", "natsproducer heartbeat")
  sleep 2
end
