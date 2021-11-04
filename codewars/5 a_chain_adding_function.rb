# frozen_string_literal: true

# We want to create a function that will add numbers together when called in succession.

# add(1).(2);
# // returns 3

# We also want to be able to continue to add numbers to our chain.
# add(1).(2).(3); // 6
# add(1).(2).(3).(4); // 10
# add(1).(2).(3).(4).(5); // 15
# and so on.

# A single call should return the number passed in.
# add(1); // 1

class Integer
  def call(n)
    self + n
  end
end

def add(n)
  n
end

# def add(n)
#   n
# end

# class Fixnum
#   def call(m=0)
#     self + m
#   end
# end

# def add(n)
#   def call(m)
#     return self + m
#   end
#   return n
# end

# def add(n)
#   a = -> m { add n + m }
#   a.define_singleton_method(:==) { |m| n == m }
#   a
# end

p add(1) # 1
p add(1).call(2).call(3) # 6
