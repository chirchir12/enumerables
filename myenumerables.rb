# rubocop:disable  Metrics/ModuleLength
# rubocop:disable  Metrics/PerceivedComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
module Enumerable
  def my_each
    if block_given?
      counter = 0
      while counter < length
        yield self[counter]
        counter += 1
      end
      self
    else
      to_enum
    end
  end

  def my_each_with_index
    if block_given?
      index = -1
      my_each do |value|
        yield value, index += 1
      end
      self
    else
      to_enum
    end
  end

  def my_select
    if block_given?
      new_array = []
      my_each { |value| new_array << value if yield value }
      new_array
    else
      to_enum
    end
  end

  def my_all?(param = nil)
    if !param.nil?
      if param.is_a? Class
        my_each do |val|
          return false unless val.is_a? param
        end
      elsif param.is_a? Regexp
        my_each do |val|
          return false unless val.to_s.match(param)
        end
      else
        my_each do |val|
          return false unless val == param
        end
      end

    elsif block_given?
      my_each do |val|
        return false unless yield(val)
      end
    elsif !block_given? && param.nil?
      my_each do |val|
        return false if val.nil? || !val
      end
    end
    true
  end

  def my_any?(param = nil)
    if !param.nil?
      if param.is_a? Class
        my_each do |val|
          return true if val.is_a? param
        end
      elsif param.is_a? Regexp
        my_each do |val|
          return true if val.to_s.match(param)
        end
      else
        my_each do |val|
          return true if val == true
        end
      end
    elsif block_given?
      my_each do |val|
        return true if yield(val)
      end
    elsif !block_given? && param.nil?
      my_each do |val|
        return true if !val.nil? || val
      end
    end
    false
  end

  def my_none?(param = nil)
    if !param.nil?
      if param.is_a? Class
        my_each do |val|
          return false if val.is_a? param
        end
      elsif param.is_a? Regexp
        my_each do |val|
          return false if val.to_s.match(param)
        end
      else
        my_each do |val|
          return false if val
        end
      end
    elsif block_given?
      my_each do |val|
        return false if yield(val)
      end
    elsif !block_given? && param.nil?
      my_each do |val|
        return false if !val.nil? || val
      end
    end
    true
  end

  def my_count(param = nil)
    counter = 0
    return length if !block_given? && param.nil?

    if block_given?
      my_each { |val| counter += 1 if yield(val) }
    end
    if param
      my_each { |val| counter += 1 if val == param }

    end
    counter
  end

  def my_map(proc = nil)
    new_array = []
    temp_self = self
    temp_self = to_a if temp_self.is_a? Range
    if !proc.nil?
      temp_self.my_each { |val| new_array << proc.call(val) }
      new_array
    elsif block_given?
      temp_self.my_each { |val| new_array << yield(val) }
      new_array
    else
      to_enum
    end
  end

  def my_inject(*args)
    temp_self = self
    if args.length == 2
      my_injector(args[0], args[1], self)
    elsif args.length == 1 && !block_given?
      my_injector(first, args[0], drop(1))
    else
      temp_self = temp_self.to_a if temp_self.is_a? Range
      value = temp_self.first
      value = 0 if temp_self.first.is_a? Integer
      sum = args[0] || value
      temp_self.my_each { |item| sum = yield(sum, item) if block_given? }
      sum
    end
  end

  def my_injector(sum, symbol, enum)
    enum = enum.to_a if enum.is_a? Range
    enum.my_each { |item| sum = sum.send(symbol, item) }
    sum
  end
end
# rubocop:enable  Metrics/ModuleLength
# rubocop:enable  Metrics/PerceivedComplexity
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
def multiply_els(arr)
  arr.my_inject(:*)
end
