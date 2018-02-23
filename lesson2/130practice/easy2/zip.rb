def zip(arr1, arr2)
  result = []
  until arr2.empty?
    result << [arr1.shift, arr2.shift]  
  end
  result
end

puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]