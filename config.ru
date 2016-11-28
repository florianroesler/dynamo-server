require 'sinatra'
require 'time_diff'

Dir[File.join(File.dirname(__FILE__), 'dependencies', 'lib', '*.jar')].each {|f| require f }
require_relative 'dependencies/DynamOpencl-0.0.1.jar'

Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each { |f| load f }
Dir[File.join(File.dirname(__FILE__), 'routes', '*.rb')].each { |f| load f }

run Sinatra::Application.new
