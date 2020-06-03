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
                      arg === item
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
    result = false
    if (arg = args[0])
      puts 'Warning, the block is being ignored. ' if block

      my_each { |item| result |= (arg.is_a?(Regexp) ? (arg === item.to_s) : (arg === item)) }
    elsif block_given?
      my_each { |item| result |= yield(item) }
    else
      return my_any? { |item| item }
    end
    result
  end

  def my_none?(*args, &block)
    !my_any?(*args, &block)
  end

  def my_count(*args, &block)
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

  def my_map(*args)
    return enum_for(__method__) if !block_given? && args[0].nil?

    new_array = []
    my_each { |item| new_array << (args[0].nil? ? yield(item) : args[0].call(item)) }
    new_array
  end

  def my_map!(*args)
    return enum_for(__method__) if !block_given? && args[0].nil?

    my_each_with_index { |item, index| self[index] = (args[0].nil? ? yield(item) : args[0].call(item)) }
    self
  end

  def my_inject(*args)
    if args.size == 2
      memo = args[0]
      my_each { |item| memo = memo.send(args[1], item) }
    elsif args.size == 1 && !block_given?
      memo = shift
      my_each { |item| memo = memo.send(args[0], item) }
    else
      memo = args[0] || shift
      my_each { |item| memo = yield(memo, item) if block_given? }
    end
    memo
  end
end

def multiply_els(array)
  array.inject(:*)
end

# rubocop:enable Style/CaseEquality
