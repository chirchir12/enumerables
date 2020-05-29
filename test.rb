# require_relative 'myenumerables.rb'

# # # # # # MY_MAP
# # # # # # p [1,2,3,4,5].my_map {|val| val*3}
# # # # # # p [1, 2, 3, 4, 5].my_map proc { |val| val * 3 }

# # # # # # MY_INJECT
# # # # # # p (1..5).my_inject(:+)
# # # # # #  p (5..10).my_inject { |sum, n| sum + n }
# # # # # # p (5..10).my_inject(1, :*)
# # # # # # p (5..10).inject(2) { |product, n| product * n }
# # # # # # longest = %w{ cat sheep bear }.my_inject do |memo, word|
# # # # # #     memo.length > word.length ? memo : word
# # # # # #   end
# # # # # # # longest = %w{ cat sheep bear }
# # # # # # #  p longest.my_each {|val| puts val}
# # # # # # p longest

# # # # # # p [1,2,3,4].first.is_a? Integer

# # # # # MY_ALL
# # # # # p %w[ant bear cat].my_all? { |word| word.length >= 3 }
# # # # # p %w[ant bear cat].my_all? { |word| word.length >= 4 }

# # # #MY_ANY
# # # # p %w[ant bear cat].my_any?(/d/)
# # # # p [].my_any?
# # # # p [nil, true, 99].my_any?(Integer)
# # # p %w[ant bear cat].my_any? { |word| word.length >= 4 }

# # #MY_NONE
# # # p [nil, false, true].my_none?
# # # p [1, 3.14, 42].my_none?(Float)
# # p %w{ant bear cat}.my_none?(/d/)

# p (1..4).my_map {|val| val*3}
