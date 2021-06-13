module Main where

main = putStrLn "Hello, World!"

-- infinite lists
infiniteLists = take 24 [13, 26 ..] -- as Haskell is lazy evaluated it will only evaluate the elements of the list when they are being retrieved

listCycle = take 10 (cycle [1, 2, 3]) -- creates an infinite cycle of the supplied list's elements

listRepeat = repeat -- repeats the given number to infinity

listReplicate = replicate 10 5 -- create a list of a value with a specific length