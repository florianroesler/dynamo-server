class Memory

  def self.free
    Java::JavaLang::Runtime.getRuntime.freeMemory
  end

  def self.used
    max - free
  end

  def self.max
    Java::JavaLang::Runtime.getRuntime.totalMemory
  end
end
