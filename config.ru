require 'sinatra'
require 'time_diff'

Dir[File.join(File.dirname(__FILE__), 'dependencies', 'lib', '*.jar')].each {|f| require f }
require_relative 'dependencies/DynamOpencl-0.0.1.jar'

Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each { |f| load f }
Dir[File.join(File.dirname(__FILE__), 'routes', '*.rb')].each { |f| load f }

if ENV['DCL_NODE_FILE'].nil?
  raise 'DCL_NODE_FILE not defined'
  return
end

Java::FrDynamoEc2::MachineManager.setup(File.join(File.dirname(__FILE__), 'aws.properties'))
Java::FrDynamoEc2::MachineManager.getInstance
run Sinatra::Application.new
