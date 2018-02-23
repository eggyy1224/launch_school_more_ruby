def compute(arg = nil)
  if block_given?
    yield(arg)
  else
    'Does not compute.'
  end
end

puts compute(5) { |n|  n + 3 } == 8
puts compute('a') { |n| n + 'b' } == 'ab'
puts compute == 'Does not compute.'