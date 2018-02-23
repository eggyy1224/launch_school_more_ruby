def step(start, endd, step)
  while start <= endd
    yield(start)
    start += step
  end
  start
end

step(1, 10, 3) { |value| puts "value = #{value}" }