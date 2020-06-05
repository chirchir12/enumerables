require_relative '../myenumerables.rb'

describe Enumerable do
  let(:arr) { [1, 2, 3, 4] }
  let(:str) { %w[cat dog wombat] }
  let(:str2) { %w[a b c d e f] }
  let(:hash) { {} }
  describe '#my_each' do
    context 'when no block is given' do
      it 'should return enumerable' do
        expect(arr.my_each).to be_a(Enumerable)
      end
      it 'should return an array' do
        expect(arr.my_each.to_a).to eql(arr)
      end
    end
    context 'when block is given' do
      it 'should return list of elements' do
        expect(arr.my_each { |n| n * 3 }).to eql(arr.my_each { |n| n * 3 })
      end
    end
  end

  describe '#my_each_with_index' do
    context 'when block is given' do
      it 'should return each element ' do
        expect(arr.my_each_with_index { |v, k| v * k }).to eql(arr.my_each_with_index { |v, k| v * k })
      end
      it 'should return hash of values' do
        expect(str.my_each_with_index { |item, index| hash[item] = index }).to eql(str.my_each_with_index { |item, index| hash[item] = index })
      end
    end
    context 'when no block is given' do
      it 'should return enumerable' do
        expect(arr.my_each_with_index).to be_a(Enumerable)
      end
    end
  end

  describe '#my_select' do
    context 'when block is given' do
      it 'should return even numbers' do
        expect(arr.my_select(&:even?)).to eql(arr.my_select(&:even?))
      end
      it 'should vowels within [aeiou]' do
        expect(str2.my_select { |v| v =~ /[aeiou]/ }).to eql(str2.my_select { |v| v =~ /[aeiou]/ })
      end
    end
    context 'when no block is given' do
      it 'should return enumberable' do
        expect(str2.my_select).to be_a(Enumerable)
      end
    end
  end

  describe "#my_all" do
      
  end
  
end
