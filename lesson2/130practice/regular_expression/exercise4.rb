def mysterious_math(str)
  str.gsub(/[+\-*\/]/, '?')
end

puts mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
puts mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'