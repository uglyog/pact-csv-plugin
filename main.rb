#!/usr/bin/env ruby

require 'rubygems'

lib_dir = File.join(__dir__, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

ENV['BUNDLE_GEMFILE'] = File.join(__dir__, 'Gemfile')
require 'bundler/setup'
Bundler.require

require 'json'
require 'securerandom'
require 'grpc'
require 'plugin_pb'
require 'plugin_services_pb'
require 'grpc/health/checker'
require 'grpc/health/v1/health_services_pb'
require 'plugin_service'

server_key = SecureRandom.base64(20)

s = GRPC::RpcServer.new
port = s.add_http2_port('0.0.0.0:0', :this_port_is_insecure)
s.handle(PluginServer.new(server_key))

puts({ 'port' => port, 'serverKey' => server_key }.to_json)
STDOUT.flush

health_checker = Grpc::Health::Checker.new
health_checker.add_status(
  "io.pact.pactplugin.PluginServer",
  Grpc::Health::V1::HealthCheckResponse::ServingStatus::SERVING)
s.handle(health_checker)

# Runs the server with SIGHUP, SIGINT and SIGQUIT signal handlers to
#   gracefully shutdown.
s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
