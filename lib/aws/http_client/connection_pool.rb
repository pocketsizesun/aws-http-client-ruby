module Aws
  module HttpClient
    class ConnectionPool
      def initialize(opts = {}, &block)
        @size = opts.fetch(:size, 1).to_i
        @connections = Queue.new.tap do |queue|
          @size.times do
            queue << yield
          end
        end
      end

      def with(&block)
        conn = nil
        conn = @connections.pop
        yield(conn)
      ensure
        @connections << conn unless conn.nil?
      end
    end
  end
end
