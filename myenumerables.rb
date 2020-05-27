module Enumerable
   def my_each
    if block_given?
        counter = 0
        while counter<self.length
            yield self[counter]
            counter+=1
        end
    else
        self
    end
  end
end