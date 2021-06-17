module Main where

main = putStrLn "Hello, World!"

-- function composition is defined as (f . g . z) x = f (g (z x))
mapWithLambda :: [Integer]
mapWithLambda = map (\x -> negate (abs x)) [5, -3, -6, 7, -3, 2, -19, 24]

mapWithComposition :: [Integer]
mapWithComposition = map (negate . abs) [5, -3, -6, 7, -3, 2, -19, 24]

oddSquaresDefault :: Integer
oddSquaresDefault = sum (takeWhile (< 10000) (filter odd (map (^ 2) [1 ..])))

oddSquaresComposition :: Integer
oddSquaresComposition =
  sum
    . takeWhile (< 10000)
    . filter odd
    . map (^ 2)
    $ [1 ..]

oddSquaresTidy :: Integer
oddSquaresTidy =
  let oddSquares = filter odd $ map (^ 2) [1 ..]
   in sum $ takeWhile (< 10000) oddSquares