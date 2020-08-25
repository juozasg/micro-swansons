## Generated from swanson.proto
require "grpc/service"

abstract class SwansonWorld
  include GRPC::Service

  @@service_name = ".SwansonWorld"

  rpc Create, receives: ::Swanson, returns: ::Result
end
