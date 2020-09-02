require "../frontswanson/src/protobufs/swanson.pb"
require "../frontswanson/src/protobufs/swanson_services.pb"
require "grpc"
require "grpc/http2"

class SwansonWorldHandler < SwansonWorld
  def create(swanson : Swanson) : Result
    puts("SwansonWorldHandler#create received #{swanson}")
    Result.new(result: "a faily decent good result right here")
  end
end


grpc = GRPC::Server.new
grpc << SwansonWorldHandler.new

server = HTTP2::ClearTextServer.new([grpc]) # TLS isn't supported yet
spawn do
end

puts("gRPC HTTP/2 listening on 0.0.0.0:5000")
server.listen "0.0.0.0", 50000