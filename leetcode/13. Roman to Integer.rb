# frozen_string_literal: true

# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000

# There are six instances where subtraction is used:
# I can be placed before V (5) and X (10) to make 4 and 9.
# X can be placed before L (50) and C (100) to make 40 and 90.
# C can be placed before D (500) and M (1000) to make 400 and 900.

# Given a roman numeral, convert it to an integer.

# Example 1:
# Input: s = "III"
# Output: 3

# Example 5:
# Input: s = "MCMXCIV"
# Output: 1994
# Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  hash = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
  }
  out_i = 0
  (0...s.size).each do |i|
    if s[i] == 'I' && (s[i + 1] == 'V' || s[i + 1] == 'X')
      out_i -= 1
    elsif s[i] == 'X' && (s[i + 1] == 'L' || s[i + 1] == 'C')
      out_i -= 10
    elsif s[i] == 'C' && (s[i + 1] == 'D' || s[i + 1] == 'M')
      out_i -= 100
    else
      out_i += hash[s[i].to_sym]
    end
  end
  out_i
end
