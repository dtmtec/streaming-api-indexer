require './environment'

client = Restforce.new

elastic_search_client = Elasticsearch::Client.new({hosts: ENV['BONSAI_URL'] || "localhost:9200"})

EM.run do
  client.faye.set_header 'Authorization', "OAuth #{client.authenticate!.access_token}"

  client.subscribe 'AllAccounts' do |message|
    elastic_search_client.index(
      index: 'salesforce',
      type: 'Account',
      id: message['sobject']['Id'],
      body: message['sobject']
    )
  end
end