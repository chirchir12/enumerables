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
			newArray = []
			self.my_each {|value| newArray << value if yield value}
			return newArray
		else 
			return to_enum
		end
	end
	def my_all?
    if block_given?
        my_each do |val|
            return false if !yield(val)
        end 
    elsif !block_given?
       my_each do |val|
				return false if val.nil?  || !val 
			 end   
    end
    true
	end
	def my_any?
    if block_given?
        my_each do |val|
            return true if yield(val)
        end 
    elsif !block_given?
       my_each do |val|
				return true if !val.nil?  || val 
			 end   
    end
    false
	end
	def my_none?
    if block_given?
        my_each do |val|
            return false if yield(val)
        end 
    elsif !block_given?
       my_each do |val|
				return false if !val.nil?  || val 
			 end   
    end
    true
	end
	def my_count(param=nil)
		counter = 0
		return self.length if !block_given? && param.nil?
		if block_given?
			my_each {|val| if yield(val) then counter+=1 end}
		end
		if param
			my_each {|val| if val==param then counter+=1 end}
			
		end
		counter
	end
	def my_map
		if block_given?
			newArray = []
			self.my_each {|val| newArray << yield(val)}
			return newArray
		else 
			return to_enum
		end
	end
	def my_map(proc=nil)
		if block_given? || !proc.nil?
			newArray = []
			self.my_each {|val| newArray << proc.call(val) if !proc.nil?}
			self.my_each {|val| newArray << yield(val) if block_given?}
			return newArray
		else 
			return to_enum
		end
	end
	def my_inject(*args) 
		if args.length==2
			my_injector(args[0], args[1], self)	
		elsif args.length==1 && !block_given?
			my_injector(self.first, args[0], self.drop(1))	
		else
			sum = args[0] || self.first
      		self.my_each { |item| sum = yield(sum, item) if block_given? }
			  sum	
		end	
	end
	def my_injector(sum, symbol, enum)
		enum = enum.to_a if enum.is_a? Range
		enum.my_each { |item| sum = sum.send(symbol, item) }
		sum
	end

	
	

	
	
end
