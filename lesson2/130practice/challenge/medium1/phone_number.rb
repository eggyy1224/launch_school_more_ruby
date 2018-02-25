require 'pry'

class PhoneNumber
  attr_accessor :num
  def initialize(num)
    @num = num
  end

  def number
    self.num = num.chars.select do |char|
      return '0000000000' if char =~ /[a-zA-z]/
      char =~ /\d/
    end.join
    
    if num.size == 10
      num
    elsif num.size == 11
      if num =~ /\A1/
        self.num = num[1..-1]
      else
        '0000000000'
      end
    else
      '0000000000'
    end   
  end

  def area_code
    number[0..2]
  end

  def to_s
    # binding.pry
    "(#{area_code}) #{number[3..5]}-#{number[6..-1]}" 
  end
end