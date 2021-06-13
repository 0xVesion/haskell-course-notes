module Main where

main = putStrLn "Hello, World!"

-- typeclasses

-- typeclasses are similiar to interfaces in Java

-- This is the type signature of the == operator:
-- (==) :: (Eq a) => a -> a -> Bool

-- The part in front of the => is called a class constraint The type
-- declaration can be read as: == takes two parameters of the same type. The
-- type needs to be a member of the Eq class. It returns a Bool.

-- Some basic typeclasses:
-- - `Eq` is used for types that support equality testing.
-- - `Ord` is for types that have an ordering.
--      ghci> "Abrakadabra" `compare` "Zebra"
--      LT
-- - `Show` is for types that can be displayed as a string.
--      ghci> show 5.334
--      "5.334"
-- - `Read` is for types that can be read from a string.
--      ghci> read "[1,2,3,4]" ++ [3]
--      [1,2,3,4,3]

-- The previous examples used type inference to determine which specific method
-- implementation should called. Just executing `read "4"` would result in an
-- error as the types couldn't be inferred. This can be mitigated by explictly
-- stating the resulting type like so: `read "123" :: Int`. This tells ghc what
-- the return type of the expression is.

-- `Enum` members are sequentially orderd. The main advantage of this is that they
-- can be used in list ranges. The succ and pred function can also be used with
-- them. Types in this class are:
-- (), Bool, Char, Ordering, Int, Integer, Float and Double
-- Bounded types

-- `Bounded` members have an upper and lower bound
-- ghci> minBound :: Int
-- -2147483648
-- ghci> maxBound :: Char
-- '\1114111'

-- `Num` is a numeric typeclass. It includes all number classes like Int,
-- Integer Float and Double

-- `Integral` is also a numeric typeclass. It includes only integral (whole)
-- number classes like Int and Integer

-- `Floating` includes only floating point number classes like Float and Double