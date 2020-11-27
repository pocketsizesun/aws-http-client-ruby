client_klasses = ObjectSpace.each_object(Class).select do |klass|
  klass < ::Seahorse::Client::Base
end
client_klasses.each do |klass|
  p klass
  klass.add_plugin(Aws::HttpClient::Plugin)
end
