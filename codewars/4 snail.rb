# frozen_string_literal: true

# Snail Sort
# Given an n x n array, return the array elements arranged from outermost elements to the middle element, traveling clockwise.

# array = [[1,2,3],
#          [4,5,6],
#          [7,8,9]]
# snail(array) #=> [1,2,3,6,9,8,7,4,5]

# array = [[1,2,3],
#          [8,9,4],
#          [7,6,5]]
# snail(array) #=> [1,2,3,4,5,6,7,8,9]

# NOTE: The idea is not sort the elements from the lowest value to the highest; the idea is to traverse the 2-d array in a clockwise snailshell pattern.
# NOTE 2: The 0x0 (empty matrix) is represented as en empty array inside an array [[]].

# def snail(array)
#   snail = []
#   array_to_reverse = []

#   snail.push(array.shift)

#   while !array.empty? do
#     array.each{ |row| snail << row.pop }
#     snail << array.pop.reverse
#     array.empty? ? break : array.each{ |row| array_to_reverse.push(row.shift) }

#     snail << array_to_reverse.reverse
#     array_to_reverse.clear
#     snail << array.shift
#   end

#   snail.flatten
# end

def snail(array)
  array.empty? ? [] : array.shift + snail(array.transpose.reverse)
end

p snail([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) == [1, 2, 3, 6, 9, 8, 7, 4, 5]
p snail([[1, 2, 3, 1], [4, 5, 6, 4], [7, 8, 9, 7], [7, 8, 9, 7]]) == [1, 2, 3, 1, 4, 7, 7, 9, 8, 7, 7, 4, 5, 6, 9, 8]
