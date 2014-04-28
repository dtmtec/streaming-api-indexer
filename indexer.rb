require 'elasticsearch'
require 'restforce'

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