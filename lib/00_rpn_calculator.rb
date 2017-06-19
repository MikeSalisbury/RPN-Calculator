class RPNCalculator
attr_accessor :result_array, :result

  def initialize
    @array = []
    @result = 0
  end

  def push(el)
    @array << el
  end

  def plus
    if @array.length >= 2
      @result = @array.pop + @array.pop
    else
      raise "calculator is empty"
    end
    @array << @result
  end

  def minus
    if @array.length >= 2
      var1 = @array.pop
      var2 = @array.pop
      @result = var2 - var1
    else
      raise "calculator is empty"
    end
    @array << @result
  end

  def times
    if @array.length >= 2
      @result = @array.pop.to_f * @array.pop.to_f
    else
      raise "calculator is empty"
    end
    @array << @result
  end

  def divide
    if @array.length >= 2
      var1 = @array.pop.to_f
      var2 = @array.pop.to_f
      @result = var2 / var1
    else
      raise "calculator is empty"
    end
    @array << @result
  end

  def value
    @result
  end

  #extra_credit
  def tokens(string)
    array = []
    string.split.each do |el|
      if el == "+"
        array << :+
      elsif el == "-"
        array << :-
      elsif el == "*"
        array << :*
      elsif el == "/"
        array << :/
      else
        array << el.to_i
      end
    end
  array
end

def evaluate(string)
  calculator = RPNCalculator.new
  token_array = tokens(string)
  token_array.each do |el|
    if el == :+
      calculator.plus
    elsif el == :-
      calculator.minus
    elsif el == :*
      calculator.times
    elsif el == :/
      calculator.divide
    else
      calculator.push(el)
    end
  end
  calculator.value
end
end
