require 'pry'

class Trinary
  def initialize(number)
    @number = number
  end

  def to_decimal
    @number.split('').reverse.map.with_index do |ele, index|
      return 0 if ele =~ /[3-9\D]/
      ele.to_i * 3**index
    end.reduce(:+)
  end
end