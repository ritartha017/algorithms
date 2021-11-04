# frozen_string_literal: true

# Here's the deal:

# It must start with a hashtag (#).
# All words must have their first letter capitalized.
# If the final result is longer than 140 chars it must return false.
# If the input or the result is an empty string it must return false.

# " Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
# "    Hello     World   "                  =>  "#HelloWorld"
# ""                                        =>  false

def generateHashtag(str)
  return false if str.strip.empty?

  out = "##{str.split.map(&:capitalize).join('')}"
  out.size <= 140 ? out : false
end

# def generateHashtag(str)
#   str.size > 1 && str.size <= 140 ? "#" + str.split.map { |x| x.capitalize }.join : false
# end

p generateHashtag(' Hello there thanks for trying my Kata') == '#HelloThereThanksForTryingMyKata'
p generateHashtag('    Hello     World   ') == '#HelloWorld'
p generateHashtag('') == false
