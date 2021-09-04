module Codewars.Cockroach where

-- The cockroach is one of the fastest insects.
-- Write a function which takes its speed in km per hour 
-- and returns it in cm per second, rounded down to the integer (= floored).

-- For example: 1.08 --> 30

cockroachSpeed :: Double -> Integer
-- cockroachSpeed s = floor (s * 1000 * 100 / 3600)

-- simpler method:
cockroachSpeed s = floor (s * 27.777778)


