require_relative 'main'

a = [1, 2, 3, 4, 5]

puts '[1, 2, 3, 4, 5].my_each'
a.my_each { |i| p i }
puts '============'

puts '[1, 2, 3, 4, 5].my_each_with_index'
a.my_each_with_index { |i, index| p "#{index} => #{i}" }
puts '============'

puts '[1, 2, 3, 4, 5].my_select'
p(a.my_select { |i| i > 2 })
puts '============'
