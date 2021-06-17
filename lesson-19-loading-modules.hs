module Main where

import qualified Data.List as L (nub)

main = putStrLn "Hello, World!"

uniqueEls :: (Eq a) => [a] -> Int
uniqueEls = length . L.nub