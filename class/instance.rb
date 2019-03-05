class Instance
  def initialize(string)
    @instance = string
  end

  def matrix? # [[[]]]
  end

  def variable? # a
    @instance.scan(/=/).count == 0
  end

  def expression? # a = 2 + 5 || 10 || 2 * 5 || 2 + a
    @instance.scan(/=/).count > 0
  end

  def function? # a = 2 + x WITH ONLY ONE UNKNOWN
  end

  def imaginary?
  end
end
