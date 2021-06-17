module Main where

main = putStrLn "Hello, World!"

mySum :: (Foldable t, Num b) => t b -> b
mySum = foldl (+) 0

myElem :: (Foldable t, Eq a) => a -> t a -> Bool
myElem y = foldl (\acc x -> if x == y then True else acc) False

myMap2 :: Foldable t1 => (t2 -> a) -> t1 t2 -> [a]
myMap2 fun = foldr (\x acc -> (fun x) : acc) []

foldl1Test :: [Char]
foldl1Test = foldl1 (\x acc -> acc ++ "\n" ++ x) ["123", "222", "123"]

scan1Test :: [[Char]]
scan1Test = scanl1 (\x acc -> acc ++ "\n" ++ x) ["123", "222", "123"]

sqrtSums :: Int
sqrtSums =
  1
    + length
      ( takeWhile
          (< 1000)
          ( scanl1
              (+)
              ( map sqrt [1 ..]
              )
          )
      )