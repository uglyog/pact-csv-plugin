# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: plugin.proto for package 'io.pact.plugin'

require 'grpc'
require 'plugin_pb'

module Io
  module Pact
    module Plugin
      module PactPlugin
        class Service

          include GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'io.pact.plugin.PactPlugin'

          rpc :InitPlugin, ::Io::Pact::Plugin::InitPluginRequest, ::Io::Pact::Plugin::InitPluginResponse
        end

        Stub = Service.rpc_stub_class
      end
    end
  end
end