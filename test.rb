require_relative 'myenumerables.rb'

# MY_MAP
# p [1,2,3,4,5].my_map {|val| val*3}
p [1, 2, 3, 4, 5].my_map proc { |val| val * 3 }
