require 'bundler/setup'

Bundler.require :default

Restforce.configure do |config|
  config.compress = true
  config.instance_url = ENV['SALESFORCE_INSTANCE_URL'] || 'https://na10.salesforce.com'
  config.api_version = '29.0'
end

client = Restforce.new
client.create! 'PushTopic', {
  ApiVersion: '29.0',
  Name: "AllAccounts",
  NotifyForOperationCreate: 'true',
  NotifyForOperationDelete: 'true',
  NotifyForOperationUpdate: 'true',
  NotifyForOperationUndelete: 'true',
  NotifyForFields: 'All',
  Query: "select Id, Name from Account"
}