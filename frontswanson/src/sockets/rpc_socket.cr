struct RpcSocket < Amber::WebSockets::ClientSocket

  channel "rpc", RpcChannel

  def on_connect
    # self.session and self.cookies available here
    # do authentication here like
    # !self.session[:user_id].nil?

    # returning true accept all connections
    true
  end
end
