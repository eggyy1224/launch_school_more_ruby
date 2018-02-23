def each_cons(collection)
  count = 0
  while count + 1 < collection.size
    yield(collection.slice(count, 2))
    count += 1
  end
  nil 
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end

puts result == nil
puts hash == { 1 => 3, 3 => 6, 6 => 10 }
puts hash

hash = {}
each_cons([]) do |value1, value2|
  hash[value1] = value2
end
puts hash == {}

hash = {}
each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
puts hash == {'a' => 'b'}