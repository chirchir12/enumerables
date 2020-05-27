require_relative 'myenumerables.rb'
include Enumerable

[1, 2, 3, 4].my_each_with_index { |v, k| puts "#{v}- #{k}" }
