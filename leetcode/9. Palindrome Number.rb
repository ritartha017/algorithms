# frozen_string_literal: true

# Given an integer x, return true if x is palindrome integer.
# (An integer is a palindrome when it reads the same backward
# as forward. For example, 121 is palindrome while 123 is not.)

# Example 1:
# Input: x = 121
# Output: true

# Example 2:
# Input: x = -121
# Output: false

# Example 3:
# Input: x = 10
# Output: false

# Time O(log(n)), Space O(1)

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  # When x < 0, x is not a palindrome.
  # Also if the last digit of the number is 0, in order to be a palindrome,
  # the first digit of the number also needs to be 0.
  # Only 0 satisfy this property.
  return false if x.negative? || ((x % 10).zero? && x != 0)

  reverted_i = 0
  while x > reverted_i
    reverted_i = reverted_i * 10 + x % 10
    x /= 10
  end
  reverted_i == x || reverted_i / 10 == x
end
