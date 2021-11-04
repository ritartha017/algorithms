# frozen_string_literal: true

# Write a function that takes an integer as input, and returns the number of bits
# that are equal to one in the binary representation of that number.
# You can guarantee that input is non-negative.

# Example:
# The binary representation of 1234 is 10011010010, so the function should return 5 in this case

def count_bits(n)
  bits = []
  loop do |_i|
    bits << n % 2
    n /= 2
    break if n.zero?
  end
  # binary code of n will be: bits.reverse
  bits.tally[1] || 0
end

# def count_bits(n)
#   n.to_s(2).count "1"
# end

puts count_bits(1234)
puts count_bits(0)
