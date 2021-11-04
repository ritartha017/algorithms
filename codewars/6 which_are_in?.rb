# frozen_string_literal: true

# Given two arrays of strings a1 and a2 return a sorted array r in
# lexicographical order of the strings of a1 which are substrings of strings of a2.

# Example 1:

# a1 = ["arp", "live", "strong"]
# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
# returns ["arp", "live", "strong"]

# Example 2:

# a1 = ["tarp", "mice", "bull"]
# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
# returns []

def in_array(array1, array2)
  matched = []
  array2.each do |el|
    array1.each do |el2|
      matched << el2 if el.include? el2
    end
  end
  matched.uniq.sort
end

# def in_array(array1, array2)
#   array1.select {|s| array2.any?{|w| w.include?(s)}}.sort
# end

a1 = %w[arp live strong]
a2 = %w[lively alive harp sharp armstrong]
p in_array(a1, a2) == %w[arp live strong]

a1 = %w[tarp mice bull]
a2 = %w[lively alive harp sharp armstrong]
p in_array(a1, a2) == []
