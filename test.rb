require_relative 'myenumerables.rb'


p [1, 2, 3].my_each_with_index {|val, id| puts "#{val}-#{id}"}