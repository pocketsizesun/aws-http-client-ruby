module Aws
  module HttpClient
    class Handler < ::Seahorse::Client::Handler
      def self.http_clients
        @http_clients ||= {}
      end

      def self.http_client_for(endpoint)
        http_clients[endpoint.to_s] ||= \
          Aws::HttpClient::ConnectionPool.new(Aws::HttpClient.config.connection_pool) do
            HTTP.persistent(endpoint.to_s)
          end
      end

      def call(context)
        req = context.http_request
        resp = context.http_response

        begin
          http_response = self.class.http_client_for(req.endpoint).with do |client|
            Aws::HttpClient::HttpResponse.from(
              client.request(
                req.http_method, req.endpoint.request_uri,
                headers: req.headers, body: req.body.read
              )
            )
          end

          resp.signal_headers(http_response.status, http_response.headers.to_h)
          resp.signal_data(http_response.body)
          resp.signal_done
        rescue => error
          # not retried
          resp.signal_error(error)
        end

        Seahorse::Client::Response.new(context: context)
      end
    end
  end
end
