get '/machines' do
  @machines = Java::FrDynamoEc2::NodeList.getInstance.getNodes

  haml :machines
end

post '/machines/book' do
  count = params['count'] || 1
  Java::FrDynamoEc2::MachineManager.getInstance.bookInstance(count)
end
