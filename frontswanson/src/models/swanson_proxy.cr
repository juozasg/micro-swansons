require "nats"

class SwansonProxy
  @@nc = NATS::Connection.new("demo.nats.io")
  @@nc.subscribe("swanson-rpc") { |msg|SwansonProxy.websocket_rpc_send("NATS: #{msg}")}

  def self.heartbeat_swanson_rpc
    @@nc.publish("swanson-rpc", "swanson-rpc is ready")

    # # send out initial message to websocket
    spawn do
      sleep 0.1
      SwansonProxy.websocket_rpc_send("swanson websockets is ready")
    end
  end
    
  def self.websocket_rpc_send(body : String)
    puts "WebSocket RpcChannel broadcasting to joined browsers '#{body}'"
    RpcSocket.broadcast("message", "rpc", "message_new", {
    "velx" => 2.3 * (Random.new.next_bool ? 1 : -1),
    "vely" => 1.1 * (Random.new.next_bool ? 1 : -1),
    "html" => Kilt.render("src/views/home/_entity.slang"),
    "time" => Time.utc.to_s
    })
  end
end