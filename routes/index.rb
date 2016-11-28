get '/' do
  @jobs = Java::FrDynamoExecution::DynamoExecutor.instance.getJobs
  haml :index
end
