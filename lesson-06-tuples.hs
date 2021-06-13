module Main where

main = putStrLn "Hello, World!"

-- tuples

-- tuples are don't need to be homogenous
-- tuples combine a finite amount of known components into a single value

first = fst (1, 2) -- returns the first value of a pair

second = snd (1, 2) -- returns the second value of a pair

tupleZip = zip [1 .. 3] ["one", "two", "thee"] -- zip combines two lists into a list of pairs

tupleZipShort = zip [1 ..] ["one", "two", "thee"] -- zip chops off the longer list

-- exercise
allRightTriangles =
  [ (a, b, c)
    | c <- [1 .. 10],
      b <- [1 .. c],
      a <- [1 .. b],
      a ^ 2 + b ^ 2 == c ^ 2,
      a + b + c == 24
  ]
