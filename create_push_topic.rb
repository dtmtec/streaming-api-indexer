require './environment'

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