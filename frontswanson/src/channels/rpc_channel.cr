require "kilt/slang"



class RpcChannel < Amber::WebSockets::Channel
  def handle_joined(client_socket, message)
    puts "WebSocket RpcChannel browser joined"
    SwansonProxy.heartbeat_swanson_rpc
  end

  def handle_message(client_socket, message)
    puts "WebSocket RpcChannel browser sent '#{message}'"
  end

  def handle_leave(client_socket)
  end
end
