class Jobs

  def self.all
    Java::FrDynamoExecution::DynamoExecutor.instance.getJobs
  end

end
