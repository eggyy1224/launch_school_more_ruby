require 'pry'

class Octal
  def initialize(number)
    @number = number
  end

  def to_decimal
    @number.split('').reverse.map.with_index do |ele, index|
      return 0 if ele =~ /[8-9\D]/
      ele.to_i * 8**index
    end.reduce(:+)
  end
end