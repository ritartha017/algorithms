module Maskify where

-- Your task is to write a function maskify, which
-- changes all but the last four characters into '#'.
-- Example: maskify "4556364607935616" == "############5616"

maskify :: String -> String
maskify str = let strm = 
                    length str - 4 in replicate strm '#' ++ drop strm str
