# Aws::HttpClient

## Usage
```ruby
Aws::DynamoDB::Client.add_plugin(Aws::HttpClient::Plugin)
cl = Aws::DynamoDB::Client.new
4.times do
  cl.list_tables
end
```
