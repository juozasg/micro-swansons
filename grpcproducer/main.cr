require "../frontswanson/src/protobufs/swanson.pb"
require "../frontswanson/src/protobufs/swanson_services.pb"
require "grpc"
require "grpc/http2"

SwansonWorldService = SwansonWorld::Stub.new("localhost", 50000)

puts("calling SwansonWorldService.create")
pp SwansonWorldService.create(Swanson.new(body: "producer body-#{1}"))
puts("done")


# i = 0
# loop do
#   sleep 1
#   i += i
# end