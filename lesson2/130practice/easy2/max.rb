def max_by(collection)
  return nil if collection.empty?
  current_value = collection[0]
  collection[1..-1].each do |ele|
    if yield(ele) > yield(current_value)
      current_value = ele
    end 
  end
  current_value
end

puts max_by([1, 5, 3]) { |value| value + 2 } == 5
puts max_by([1, 5, 3]) { |value| 9 - value } == 1
puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
puts max_by([-7]) { |value| value * 3 } == -7
puts max_by([]) { |value| value + 5 } == nil