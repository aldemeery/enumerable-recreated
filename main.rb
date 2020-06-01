# rubocop:disable Style/CaseEquality

module Enumerable
  def my_each
    size.times { |counter| yield(to_a[counter]) } if block_given?
    block_given? ? self : enum_for(__method__)
  end

  def my_each_with_index
    size.times { |counter| yield(to_a[counter], counter) } if block_given?
    block_given? ? self : enum_for(__method__)
  end

  def my_select
    return enum_for(__method__) unless block_given?

    selected = []
    my_each { |item| selected.push(item) if yield(item) }
    selected
  end

  def my_all?(*args, &block)
    all_true = true

    if (arg = args[0])
      puts 'Warning, the block is being ignored.' if block
      my_each do |item|
        all_true &= if arg.is_a? Regexp
                      (arg === item.to_s)
                    else
                      item.is_a? arg
                    end
      end
    elsif block_given?
      my_each { |item| all_true &= yield(item) }
    else
      all_true = my_all? { |item| item }
    end

    all_true
  end

  def my_any?(*args, &block)
    if (arg = args[0])
      puts 'Warning, the block is being ignored. ' if block
      my_each do |item|
        if arg.is_a? Regexp
          return true if arg === item.to_s
        else
          return true if item.is_a?(arg)
        end
      end
    elsif block_given?
      my_each { |item| return true if yield(item) }
    else
      return my_any? { |item| item }
     end
    false
  end

  def my_none?(*args, &block)
    if (arg = args[0])
      puts 'Warning, the block is being ignored. ' if block
      my_each do |item|
        if arg.is_a? Regexp
          return false if arg === item.to_s
        else
          return false if item.is_a?(arg)
        end
      end
    elsif block_given?
      my_each { |item| return false if yield(item) }
    else
      return my_none? { |item| item }
     end
    true
   end

  def my_count?(*args, &block)
    counter = 0
    if (arg = args[0])
      puts 'Warning, the block is being ignored. ' if block
      my_each { |item| counter += 1 if item == arg }
    elsif block_given?
      my_each { |item| counter += 1 if yield(item) }
    else
      my_each { |_item| counter += 1 }
    end
    counter
  end

  def my_map
    return enum_for(__method__) unless block_given?

    new_array = []
    my_each { |item| new_array.push(yield(item)) }
    new_array
  end

  def my_map!
    return enum_for(__method__) unless block_given?

    my_each_with_index { |item, index| self[index] = yield(item) }
    self
  end
end

# rubocop:enable Style/CaseEquality
