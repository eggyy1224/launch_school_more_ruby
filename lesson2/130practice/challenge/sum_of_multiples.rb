require 'pry'

class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def self.to(limit, numbers = [3, 5])
    return 0 if numbers.all? { |number| number > limit }
    output = []
    numbers.each do |number|
      number.upto(limit - 1) do |num|
        output << num if num % number == 0
      end
    end
    output.uniq.reduce(:+)
  end

  def to(limit)
    self.class.to(limit, @numbers)
  end
end