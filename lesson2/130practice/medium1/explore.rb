# # Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call 不用傳參數
# my_proc.call('cat')

# # Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}" }
# my_second_lambda = -> (thing) { puts "This is a #{thing}" }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# # my_lambda.call 參數需要傳進去
# # my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }#無法這樣初始化

## Group3
# def block_method_1(animal)
#   yield if block_given?
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal') #當方法裡面有yield時需要傳入block參數

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end #會忽略不認識的參數
block_method_2('turtle') { puts "This is a #{animal}."} #無法認得animal參數
