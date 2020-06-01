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

puts '[1, 2, 3, 4, 5].my_all?'
p(a.my_all?)
puts '============'

puts '[1, 2, 3, 4, 5].my_any? { |i| i % 2 == 0 }'
p(a.my_any?(&:even?))
puts '============'

puts '[1, 2, 3, 4, 5].my_none? { |i| i % 11 == 0 }'
p(a.my_none? { |i| i % 11 == 0 })
puts '============'

puts '[1, 2, 3, 4, 5].my_count?(99)'
p(a.my_count?(99))
puts '============'

puts '[1, 2, 3, 4, 5].my_map? { |item| item * 2 }'
p(a.my_map { |item| item * 2 })
puts '============'

puts '[1, 2, 3, 4, 5].my_map! { |item| item + 10 }'
p(a.my_map! { |item| item + 10 })
a.my_map! {|item| item - 10}
puts '============'

puts '[1, 2, 3, 4, 5].inject'
p(a.inject(:+))
puts '============'

puts 'multiply_els([2, 4, 5])'
p(multiply_els([2, 4, 5]))
puts '============'
