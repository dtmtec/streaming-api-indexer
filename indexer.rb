require 'elasticsearch'
require 'restforce'

elastic_search_client = Elasticsearch::Client.new

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