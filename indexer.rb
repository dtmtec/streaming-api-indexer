require 'bundler/setup'

Bundler.require :default

Restforce.configure do |config|
  config.compress = true
  config.instance_url = ENV['SALESFORCE_INSTANCE_URL'] || 'https://na10.salesforce.com'
  config.api_version = '29.0'
end

client = Restforce.new

elastic_search_client = Elasticsearch::Client.new({
  hosts: ENV['BONSAI_URL'] || "localhost:9200"
})

EM.run do
  client.subscribe 'AllAccounts' do |message|
    elastic_search_client.index(
      index: 'salesforce',
      type: 'Account',
      id: message['sobject']['Id'],
      body: message['sobject']
    )
  end
end