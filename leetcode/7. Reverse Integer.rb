# frozen_string_literal: true

# Given a signed 32-bit integer x, return x with its digits reversed.
# If reversing x causes the value to go outside
# the signed 32-bit integer range [-231, 231 - 1], then return 0.

# Example 1:
# Input: x = 123
# Output: 321

# Example 2:
# Input: x = -123
# Output: -321

# @param {Integer} x
# @return {Integer}
def reverse(x)
  ans = x.to_s.reverse!.to_i
  ans = x.negative? ? -ans : ans
  return 0 if ans < -(2**31) || ans > (2**31) - 1

  ans
end
