require "kilt/slang"



class RpcChannel < Amber::WebSockets::Channel
  def handle_joined(client_socket, message)
    puts "RPC joined broadcast:"
    # RpcSocket.broadcast("message", "rpc", "message_new", {"handle" => "here"})
    spawn do
      i = 0
      loop do
        i += 1
        sleep 1.seconds
        puts("loop bcast")
        Swanson.rpc_spawn("yooooo")
        break
      end
      
    end
  end

  def handle_message(client_socket, message)
    # puts("-------------")
    # puts(message.class)
    # puts(message)
    # dispatch(client_socket, message)
    puts "RPC handle message received"
  end

  def handle_leave(client_socket)
  end
end
