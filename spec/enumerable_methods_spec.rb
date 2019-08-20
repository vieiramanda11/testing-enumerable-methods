# frozen_string_literal: true

require_relative '../lib/enumerable_methods.rb'

RSpec.describe Enumerable do
  let(:arr) { [1, 2, 3, 4, 5] }

  describe '#my_each' do
    it 'loop a block through all elements of an array' do
      my_array = []
      original_array = []
      arr.my_each { |n| my_array << n * 2 }
      arr.each { |n| original_array << n * 2 }
      expect(my_array).to eql(original_array)
    end
  end

  describe 'my_each_with_index' do
    it 'get all elements of an array and return the value and its index' do
      my_array = []
      original_array = []
      arr.my_each_with_index { |i, idx| my_array << [i, idx] }
      arr.my_each_with_index { |i, idx| original_array << [i, idx] }
      expect(my_array).to eql(original_array)
    end
  end

  describe '#my_select' do
    it 'returns an array of given numbers based on a given block' do
      expect([1, 2, 3, 4, 5].my_select(&:even?)).to eql([2, 4])
    end
  end

  describe '#my_count' do
    it 'returns an array of elements that evaluate to true given a block statement' do
      arr.my_count { |n| n > 4 }
      expect(arr.my_count).to eql(5)
    end
  end

  describe '#my_all?' do
    it 'returns true if the block passed never returns false or nil' do
      my_all = arr.my_all? { |i| i > 2 }
      all = arr.all? { |i| i > 2 }
      expect(my_all).to eql(all)
    end
  end

  describe '#my_any?' do
    it 'returns true if the block passed ever returns a value othen than false or nil' do
      my_any = arr.my_any? { |i| i < 0 }
      any = arr.any? { |i| i < 0 }
      expect(my_any).to eql(any)
    end
  end

  describe '#my_none' do
    it 'returns true if none of the elements meet criteria defined in the block' do
      expect(arr.my_none? { |num| num == 10 }).to eql(true)
    end
  end

  describe '#my_map' do
    it 'returns a new array with the results of running through the block once on a given array' do
      answer = arr.my_map { |num| num**2 }
      expect(answer).to eql(arr.map { |num| num**2 })
    end
  end

  describe 'my_inject' do
    it 'return the accumulator for each value passed in a block' do
      result = arr.my_inject { |sum, n| sum + n }
      expect(result).to eql(arr.inject { |sum,n| sum+n })
    end
  end

  describe '#multiply_els' do
    it 'return the product of all the values of an array' do
      result = multiply_els(arr)
      expect(result).to eql(120)
    end
  end
end
