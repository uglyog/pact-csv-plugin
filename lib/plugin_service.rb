require 'plugin_pb'
require 'plugin_services_pb'

class PluginServer < Io::Pact::Plugin::PactPlugin::Service
  def initialize(server_key)
    @server_key = server_key
  end

  def init_plugin(req, _unused_call)
    puts "init_plugin OK - #{req}"
    STDOUT.flush
    Io::Pact::Plugin::InitPluginResponse.new(catalogue: [
      Io::Pact::Plugin::InitPluginResponse::CatalogueEntry.new(type: 'content-matcher', key: 'csv', values: {
        'content-types' => 'text/csv'
      })
    ])
  end
end
