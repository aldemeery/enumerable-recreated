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

  def my_any? (*args, &block)
   if (arg = args[0])
     puts 'Warning, the block is being ignored. ' if block
     my_each do |item|
      if arg.is_a? Regexp 
        if arg === item.to_s
           return true
        end
      else
        if item.is_a?(arg)
          return true
        end
      end
     end
    elsif block_given?
      my_each {|item| return true if yield(item)}
    else
      return my_any?{ |item| item }
    end
    return false
  end

  def my_none? (*args, &block)
    if (arg = args[0])
      puts 'Warning, the block is being ignored. ' if block
      my_each do |item|
       if arg.is_a? Regexp 
         if arg === item.to_s
            return false
         end
       else
         if item.is_a?(arg)
           return false
         end
       end
      end
     elsif block_given?
       my_each {|item| return false if yield(item)}
     else
       return my_none?{ |item| item }
     end
     return true
   end
 

end


# rubocop:enable Style/CaseEquality
