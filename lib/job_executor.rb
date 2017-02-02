class JobExecutor


  def self.matrix
    Thread.new do
      Java::FrDynamoSamplesMatrix_multiplication.MatrixMain.main(["5120","4"])
    end
  end

  def self.mandelbrot
    Thread.new do
      Java::FrDynamoSamplesMandelbrot.MandelbrotMain.main(["5000","10000","10", "0"])
    end
  end

  def self.kmeans
    Thread.new do
      Java::FrDynamoSamplesKmeans.KMeansMain.main(["10000","25","10"])
    end
  end

end
