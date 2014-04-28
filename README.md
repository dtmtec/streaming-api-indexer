# Streaming API Indexer

Example implementation of an indexer for Salesforce data using the Streaming API

# Install

As usual:

	bundle install
	gem install foreman

Configure the environment variables in a `.env`:

	SALESFORCE_CLIENT_ID=<client-id>
    SALESFORCE_CLIENT_SECRET=<A-SECRET>
    SALESFORCE_SECURITY_TOKEN=<security-token>
    SALESFORCE_USERNAME=<your-username>
    SALESFORCE_PASSWORD=<your-user-password>

Create the push topic:

	ruby create_push_topic.rb

Run the indexer with:

	ruby indexer.rb
