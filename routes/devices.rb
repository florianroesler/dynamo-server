get '/devices' do
  @devices = Java::FrDynamoEc2::NodeList.getInstance.getAllDevices
  @cloud_devices = Java::FrDynamoEc2::NodeList.getInstance.getCloudDevices

  haml :devices
end
