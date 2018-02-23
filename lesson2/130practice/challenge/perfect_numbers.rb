require 'pry'
class PerfectNumber
  def self.classify(number)
    raise RuntimeError, 'input cannot less than zero' if number <= 0
    divisors = PerfectNumber.generate_divisors(number)
    PerfectNumber.sort(divisors, number)
  end

  def self.generate_divisors(number)
    (1...number).each_with_object([]) do |divisor, divisors|
      divisors << divisor if number % divisor == 0
    end
  end

  def self.sort(divisors, number)
    case divisors.reduce(:+) <=> number
    when 0 then 'perfect'
    when 1 then 'abundant'
    when -1 then 'deficient'
    end
  end
end