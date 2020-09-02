require "kilt/slang"



class RpcChannel < Amber::WebSockets::Channel
  def handle_joined(client_socket, message)
    puts "WebSocket RpcChannel browser joined"
    # RpcSocket.broadcast("message", "rpc", "message_new", {"handle" => "here"})
    SwansonProxy.start_grpc_http2_server
  end

  def handle_message(client_socket, message)
    # puts("-------------")
    # puts(message.class)
    # puts(message)
    # dispatch(client_socket, message)
    puts "WebSocket RpcChannel browser sent '#{message}'"
  end

  def handle_leave(client_socket)
  end
end
