# frozen_string_literal: true

# Complete the solution so that it strips all text that follows any of a set of
# comment markers passed in. Any whitespace at the end of the line should also be stripped out.

# Example:
# Given an input string of:
# apples, pears # and bananas
# grapes
# bananas !apples

# The output expected would be:
# apples, pears
# grapes
# bananas

# The code would be called like so:
# result = solution("apples, pears # and bananas\ngrapes\nbananas !apples", ["#", "!"])
# result should == "apples, pears\ngrapes\nbananas"

def solution(input, markers)
  input.gsub(/\s+[#{markers.join}].*$/, '')
end

# def solution(input, markers)
#   input
#     .split("\n")
#     .map { |line|
#       markers.each { |marker|
#         line = line.split(marker)[0]
#       }
#       line.strip
#     }
#     .join("\n")
# end

p solution("apples, plums % and bananas\npears\noranges !applesauce", ['%', '!']) == "apples, plums\npears\noranges"
p solution("Q @b\nu\ne -e f g", ['@', '-']) == "Q\nu\ne"
