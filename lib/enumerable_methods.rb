# frozen_string_literal: true

# Enumerable module
module Enumerable
  # my_each method
  def my_each
    res = self
    i = 0
    while i < res.length
      yield(res[i])
      i += 1
    end
    res
  end

  # my_each_with_index method
  def my_each_with_index
    res = self
    i = 0
    while i < res.length
      yield(res[i], i)
      i += 1
    end
    res
  end

  # my_select method
  def my_select
    res = self
    array = []
    res.my_each do |s|
      array.push(s) if yield(s)
    end
    array
  end

  # my_all? method
  def my_all?
    res = self
    res.my_each do |a|
      return false unless yield(a)
    end
    true
  end

  # my_any? method
  def my_any?
    if block_given?
      my_each { |i| return true if yield(i) }
    end
    false
  end

  # my_none? method
  def my_none?
    res = self
    res.my_each do |n|
      return false if yield(n)
    end
    true
  end

  # my_count method
  def my_count
    res = self
    counter = 0
    res.my_each do |c|
      if block_given? && yield(c)
        counter += 1
      else
        counter = res.length
      end
    end
    counter
  end

  # my_map method
  def my_map(proc = nil)
    result = []
    if proc
      my_each do |p|
        result << proc.call(p)
      end
    else
      my_each do |a|
        result << yield(a)
      end
    end
    result
  end

  # my_inject method
  def my_inject(init = self[0])
    result = init
    res = self
    res.my_each do |i|
      next if init == i

      result = yield(result, i)
    end
    result
  end
end

# multiply method
def multiply_els(par)
  par.my_inject(1) { |a, b| a * b }
end
