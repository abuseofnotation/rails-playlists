class Test
  def initialize
    @dict = {}
  end
  def set (key, val)
    @dict[key] = val
  end

  def get key
    @dict[key]
  end

  def []= (key, val)
    @dict[key] = val
  end

end
