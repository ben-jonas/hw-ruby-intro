# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  arr.reduce(0,:+)
end

def max_2_sum arr
  neg_inf = -1*Float::INFINITY
  max_2 = arr.reduce([neg_inf, neg_inf]) do |acc, n|
    if n >= acc[0]
      acc[1] = acc[0]
      acc[0] = n
    elsif n > acc[1]
      acc[1] = n
    end
    acc
  end
  (0..1).each { |n| max_2[n] = 0 if max_2[n] == neg_inf }
  max_2[0] + max_2[1]
end

def sum_to_n? arr, n
  sorted = arr.sort
  ascend_cursor = 0
  descend_cursor = sorted.length - 1
  while ascend_cursor < descend_cursor
    sum = sorted[ascend_cursor] + sorted[descend_cursor]
    return true if sum == n
    ascend_cursor += 1 if sum < n
    descend_cursor -= 1 if sum > n
  end
  false
end

# Part 2

def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant? s
  /^[B-DF-HJ-NP-TV-Zb-df-hj-np-tv-z]/.match s
end

def binary_multiple_of_4? s
  /^[10]*100$|^0$/.match s
end

# Part 3

class BookInStock
  def initialize(isbn, price)
    raise ArgumentError if isbn == '' || price <= 0
    @isbn = isbn
    @price = price
  end
  
  attr_accessor :isbn, :price
  
  def price_as_string
    "$%0.2f" % @price
  end
end
