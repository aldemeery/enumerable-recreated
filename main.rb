module Enumerable
  def my_each
    size.times { |counter| yield(to_a[counter]) } if block_given?
    block_given? ? self : enum_for(__method__)
  end

  def my_each_with_index
    size.times { |counter| yield(to_a[counter], counter) } if block_given?
    block_given? ? self : enum_for(__method__)
  end
end
