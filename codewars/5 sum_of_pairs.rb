# frozen_string_literal: true

# Given a list of integers and a single sum value, return the first two
# values (parse from the left please) in order of appearance that add up to form the sum.

# !!!!!Execution Timed Out (12000 ms)
# def sum_pairs(ints, s)
#   pairs = []
#   for i in 0...ints.size
#     for j in i+1...ints.size
#     	pairs << { i => ints[i], j => ints[j] } if ints[i] + ints[j] == s
# 	end
#   end
#   return nil if pairs.empty?
#   solution = pairs[0]
#   pairs.each { |el| solution  = el if el.keys.max < solution .keys.max }
#   return solution .values.to_a
# end

# https://afteracademy.com/blog/check-for-pair-in-an-array-with-a-given-sum
# O(n)
def sum_pairs(ints, s)
  h = {}
  (0...ints.size).each do |i|
    rem = s - ints[i]
    if h.key? rem
      count = h[rem]
      (0...count).each do |_j|
        # puts "#{rem}, #{ints[i]}"
        return [rem, ints[i]]
      end
    end
    (h.key? ints[i]) ? h[ints[i]] += 1 : h[ints[i]] = 1
  end
  nil
end

# def sum_pairs(ints, s)
#   seen = {}
#   for i in ints do
#     return [s-i, i] if seen[s-i]
#     seen[i] = true
#   end
#   nil
# end

p sum_pairs([11, 3, 7, 5], 10) == [3, 7]
#              ^--^      3 + 7 = 10

p sum_pairs([4, 3, 2, 3, 4], 6) == [4, 2]
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * entire pair is earlier, and therefore is the correct answer

p sum_pairs([0, 0, -2, 3], 2).nil?
#  there are no pairs of values that can be added to produce 2.

p sum_pairs([10, 5, 2, 3, 7, 5], 10) == [3, 7]
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * entire pair is earlier, and therefore is the correct answer

l2 = [1, -2, 3, 0, -6, 1]
p sum_pairs(l2, -6) == [0, -6]
