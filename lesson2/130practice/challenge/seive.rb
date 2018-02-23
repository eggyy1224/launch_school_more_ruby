require 'pry'

class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    number_arr = (2..@limit).to_a
    number_arr.each do |num|
      number_arr.reject! { |i| i != num && i % num == 0 }
    end
    # primes = []
    # loop do
    #   subs = [] 
    #   primes << number_arr.min
    #   basic = number_arr.min
    #   number_arr.each do |ele|
    #     subs << ele if ele % basic == 0
    #   end
    #   number_arr -= subs
      
    #   break if number_arr.max < number_arr.min**2
    # end
    # primes += number_arr
    # primes
    number_arr
  end
end
