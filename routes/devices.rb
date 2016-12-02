get '/devices' do
  @devices = Java::FrDynamoEc2::NodeList.getInstance.getAllDevices

  haml :devices
end
