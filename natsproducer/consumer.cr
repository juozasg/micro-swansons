require "nats"
nc = NATS::Connection.new("demo.nats.io")

nc.subscribe("swanson-rpc") do |msg| 
  puts("Read NATS: #{msg}")
end


