# frozen_string_literal: true

require_relative '../lib/enumerable_methods.rb'

RSpec.describe Enumerable do
  let(:arr) { [1, 2, 3, 4, 5] }

  describe "#my_each" do 
    it "loop a block through all elements of an array" do
      my_array = []
      original_array = []
      arr.my_each { |n| my_array << n * 2 }
      arr.each { |n| original_array << n * 2 }
      expect(my_array).to eql(original_array)
    end
  end

  describe "my_each_with_index" do
    it "get all elements of an array and return the value and its index" do
        my_array = []
        original_array = []
        arr.my_each_with_index { |i, idx| my_array << [i, idx] }
        arr.my_each_with_index { |i, idx| original_array << [i, idx] }
        expect(my_array).to eql(original_array)
    end
  end

  describe "#my_select" do
    it "returns an array of given numbers based on a given block" do
      expect([1,2,3,4,5].my_select(&:even?)).to eql([2,4])
    end
  end

  describe "#my_count" do
    it "returns an array of elements that evaluate to true given a block statement" do
      arr.my_count {|n| n>4 }
      expect(arr.my_count).to eql(5)
    end
  end


end