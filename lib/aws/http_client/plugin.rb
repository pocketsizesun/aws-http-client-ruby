module Aws
  module HttpClient
    class Plugin < ::Seahorse::Client::Plugin
      def add_handlers(handlers, config)
        handlers.add(Aws::HttpClient::Handler, step: :send)
      end
    end
  end
end
