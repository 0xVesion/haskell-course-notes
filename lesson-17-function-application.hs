module Main where

main = putStrLn "Hello, World!"

-- $ = function application operator
-- Apply the right-hand side to the left-hand side after it has been evaluated

sqrtSumsDollar :: Int
sqrtSumsDollar =
  length
    ( takeWhile (< 1000) $
        scanl1 (+) $
          map sqrt [1 ..]
    )
    + 1

functionApplicationMap :: [Double]
functionApplicationMap = map ($ 3) [(4 +), (10 *), (^ 2), sqrt]

