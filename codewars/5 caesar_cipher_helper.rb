# frozen_string_literal: true

# Write a class that, when given a string, will return an uppercase
# string with each letter shifted forward in the alphabet by however
# many spots the cipher was initialized to.

# For example:
# c = CaesarCipher.new(5); # creates a CipherHelper with a shift of five
# c.encode('Codewars') # returns 'HTIJBFWX'
# c.decode('BFKKQJX') # returns 'WAFFLES'

# If something in the string is not in the alphabet (e.g. punctuation, spaces), simply leave it as is.
# The shift will always be in range of [1, 26].

class CaesarCipher
  @@LETTERS = ('a'..'z').to_a

  attr_accessor :shift

  def initialize(shift)
    @shift = shift
  end

  def encode(text)
    encrypted = ''
    text.split('').to_a.each do |x|
      encrypted += if @@LETTERS.include?(x.downcase)
                     @@LETTERS[(@@LETTERS.index(x.downcase) + shift) % 26]
                   else
                     x
                   end
    end
    encrypted.upcase
  end

  def decode(text)
    decrypted = ''
    text.split('').to_a.each do |x|
      decrypted += if @@LETTERS.include? x.downcase
                     @@LETTERS[(@@LETTERS.index(x.downcase) - shift) % 26]
                   else
                     x
                   end
    end
    decrypted.upcase
  end
end

# class CaesarCipher
#   def initialize(shift)
#     @rotate = ('A'..'Z').to_a.rotate(shift).join
#   end

#   def encode(string)
#     string.upcase.tr "A-Z", @rotate
#   end

#   def decode(string)
#     string.tr @rotate, "A-Z"
#   end
# end

c = CaesarCipher.new(5)
p c.encode('Codewars') == 'HTIJBFWX'
p c.decode('HTIJBFWX') == 'CODEWARS'
