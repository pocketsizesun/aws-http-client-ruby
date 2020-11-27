module Aws
  module HttpClient
    class HttpResponse
      attr_reader :code, :headers, :body

      def self.from(response)
        new(response.status, response.headers, response.body.to_s)
      end

      def initialize(code, headers, body)
        @code = code.to_i
        @headers = headers
        @body = body
      end

      def status
        code
      end
    end
  end
end
