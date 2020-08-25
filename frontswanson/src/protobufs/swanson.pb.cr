## Generated from swanson.proto
require "protobuf"


struct Swanson
  include Protobuf::Message
  
  contract_of "proto3" do
    optional :body, :string, 1
  end
end

struct Result
  include Protobuf::Message
  
  contract_of "proto3" do
    optional :result, :string, 1
  end
end
