require 'pry'

def missing(arr)
  total = [arr[0]]
  len = arr[-1]  - arr[0]
  len.times do |num|
    total << arr[0] + num +1 
  end
  total - arr
end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []