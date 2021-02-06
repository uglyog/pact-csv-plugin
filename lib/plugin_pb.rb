# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: plugin.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("plugin.proto", :syntax => :proto3) do
    add_message "io.pact.plugin.InitPluginRequest" do
      optional :implementation, :string, 1
      optional :version, :string, 2
    end
    add_message "io.pact.plugin.InitPluginResponse" do
      repeated :catalogue, :message, 1, "io.pact.plugin.InitPluginResponse.CatalogueEntry"
    end
    add_message "io.pact.plugin.InitPluginResponse.CatalogueEntry" do
      optional :type, :string, 1
      optional :key, :string, 2
      map :values, :string, :string, 3
    end
  end
end

module Io
  module Pact
    module Plugin
      InitPluginRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("io.pact.plugin.InitPluginRequest").msgclass
      InitPluginResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("io.pact.plugin.InitPluginResponse").msgclass
      InitPluginResponse::CatalogueEntry = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("io.pact.plugin.InitPluginResponse.CatalogueEntry").msgclass
    end
  end
end
