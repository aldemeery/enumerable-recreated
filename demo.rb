require_relative 'main'

a = [1, 2, 3, 4, 5]

puts '[1, 2, 3, 4, 5].my_each'
a.my_each {|i| p i}
puts '============'
