module Enumerable
  def my_each
    if block_given?
      counter = 0
      while counter < length
        yield self[counter]
        counter += 1
      end
    end
    self
  end

  def my_each_with_index
    index = -1
    my_each do |value|
      yield value, index += 1
    end
	end
	def my_select
		newArray = []
		self.my_each {|value| newArray << value if yield value}
		newArray
	end
	
end
