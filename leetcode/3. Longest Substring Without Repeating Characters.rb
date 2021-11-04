# frozen_string_literal: true

# Given a string s, find the length of the longest
# substring without repeating characters.

# Example 1:
# Input: s = "abcabcbb"
# Output: 3

# Example 2:
# Input: s = "bbbbb"
# Output: 1

# Example 3:
# Input: s = "pwwkew"
# Output: 3

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  return 0 if s.empty?

  right_pp = 0
  left_pp = 0
  longest = 1
  lookup = {}

  s.each_char do |char|
    if lookup[char] && (lookup[char] >= left_pp)
      longest = [longest, right_pp - left_pp].max
      left_pp = lookup[char] + 1
    end
    lookup[char] = right_pp
    right_pp += 1
  end

  [longest, right_pp - left_pp].max
end
