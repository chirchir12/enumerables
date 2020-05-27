require_relative 'myenumerables.rb'

p [1, 2, 3, 4].my_each_with_index {|value, key| puts "#{value} - #{key}"}