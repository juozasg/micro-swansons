
require "../protobufs/swanson.pb"
require "../protobufs/swanson_services.pb"
require "nats"
require "grpc/http2"

class SwansonWorldHandler < SwansonWorld
  def create(swanson : Swanson) : Result
    SwansonProxy.websocket_rpc_spawn(swanson.body.to_s)
    Result.new(result: "a faily decent good result right here")
  end
end

class SwansonProxy
  def self.start_nats_server
    # grpc = GRPC::Server.new
    # grpc << SwansonWorldHandler.new

    # server = HTTP2::ClearTextServer.new([grpc]) # TLS isn't supported yet
    # spawn do
    # end
    # puts("gRPC HTTP/2 listening on 0.0.0.0:5000")
    # server.listen "0.0.0.0", 50000
    # puts("done listening")

    # # send out initial message to websocket
    # spawn do
    #   sleep 0.1
    #   SwansonProxy.websocket_rpc_spawn("yooooo--- swansons await grpc messages on PORT 50000")
    # end
  end
    
  def self.websocket_rpc_spawn(body : String)
    puts "WebSocket RpcChannel broadcasting to joined browsers '#{body}'"
    RpcSocket.broadcast("message", "rpc", "message_new", {
    "velx" => 2.3 * (Random.new.next_bool ? 1 : -1),
    "vely" => 1.1 * (Random.new.next_bool ? 1 : -1),
    "html" => Kilt.render("src/views/home/_entity.slang"),
    "time" => Time.utc.to_s
  })
end
  
end