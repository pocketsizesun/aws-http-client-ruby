require 'bundler/setup'
require 'aws-sdk-dynamodb'
require 'aws-http-client'
require 'aws/http_client/all'

# Aws::DynamoDB::Client.add_plugin(Aws::HttpClient::Plugin)
cl = Aws::DynamoDB::Client.new
4.times do
  cl.list_tables
end
