require 'http'
require 'aws/http_client/connection_pool'
require 'aws/http_client/http_response'
require 'aws/http_client/handler'
require 'aws/http_client/plugin'

module Aws
  module HttpClient
    Configuration = Struct.new(:connection_pool)

    def self.config
      @config ||= Configuration.new({ size: 1 })
    end
  end
end
