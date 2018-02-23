require 'pry'

class Series
  def initialize(str)
    @number_arr = str.split('').map(&:to_i)
  end

  def slices(count)
    raise ArgumentError, 'n is longer then size of string' if count > @number_arr.size 
    @number_arr.each_cons(count).to_a
  end
end