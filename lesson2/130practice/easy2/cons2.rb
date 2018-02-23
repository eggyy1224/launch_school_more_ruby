require 'pry'

def each_cons(collection, cons)
  count = 0
  while count + (cons - 1) < collection.size 
    yield(*collection.slice(count, cons))
    count += 1
  end 
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
puts hash == { 1 => true, 3 => true, 6 => true, 10 => true }
puts hash

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
puts hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
puts hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
puts hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
puts hash == {}