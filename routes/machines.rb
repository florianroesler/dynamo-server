get '/machines' do
  @machines = Java::FrDynamoEc2::NodeList.getInstance.getNodes

  haml :machines
end

post '/machines/book' do
  @count = params['count'].to_i
  @type = params['type']

  Java::FrDynamoEc2::MachineManager.getInstance.bookInstance(@count, @type)

  haml :machines_booked
end

post '/machines/unbook' do
  id = params['instance_id']
  instance = Java::FrDynamoEc2::NodeList.getInstance.getNodes.find { |i| i.getInstanceId == id }

  Java::FrDynamoEc2::MachineManager.getInstance.terminateInstances(java.util.ArrayList.new([instance]))

  redirect '/machines'
end
