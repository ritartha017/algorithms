# frozen_string_literal: true

# You are given an array (which will have a length of at least 3, but could be very large)
# containing integers. The array is either entirely comprised of odd integers or entirely
# comprised of even integers except for a single integer N. Write a method that takes the
# array as an argument and returns this "outlier" N.

def find_outlier(integers)
  even = []
  odds = []
  integers.each do |num|
    even << num if num.even?
    odds << num if num.odd?
  end
  even.size > 1 ? odds[0] : even[0]
end

# def find_outlier(integers)
#   integers.partition(&:odd?).find(&:one?).first
# end

p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p find_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160
