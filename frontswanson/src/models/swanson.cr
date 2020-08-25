class Swanson
    def self.rpc_spawn(body : String)
        RpcSocket.broadcast("message", "rpc", "message_new", {
          "velx" => 2.3 * (Random.new.next_bool ? 1 : -1),
          "vely" => 1.1 * (Random.new.next_bool ? 1 : -1),
          "html" => Kilt.render("src/views/home/_entity.slang"),
          "time" => Time.utc.to_s
        })
    end

end