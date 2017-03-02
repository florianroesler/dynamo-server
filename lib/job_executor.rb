class JobExecutor


  def self.matrix
    Thread.new do
      Java::FrDynamoSamplesMatrix_multiplication.MatrixMain.main(["3200","8"])
    end
  end

  def self.mandelbrot
    Thread.new do
      Java::FrDynamoSamplesMandelbrot.MandelbrotMain.main(["2000","100000","20", "0"])
    end
  end

  def self.kmeans
    Thread.new do
      Java::FrDynamoSamplesKmeans.KMeansMain.main(["100000","50"])
    end
  end

end
