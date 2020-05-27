require_relative 'myenumerables.rb'

proc = Proc.new{ |x| x * 2 }

p [1, 1, 3, 5, 1, 4, 2].my_map {|v| v*2}

	
	
	