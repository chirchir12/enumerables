require_relative 'myenumerables.rb'


p [1, 1, 3, 5, 1, 4, 2].map 

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