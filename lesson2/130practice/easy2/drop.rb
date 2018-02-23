def drop_while(collection)
  result = []
  collection.each_with_index do |ele, index|
    unless yield(ele)
      result = collection[index..-1]
      break 
    end
  end
  result
end
# puts drop_while([1, 3, 5, 6]) { |value| value.odd? }
puts drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
puts drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| true } == []
puts drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
puts drop_while([]) { |value| true } == []