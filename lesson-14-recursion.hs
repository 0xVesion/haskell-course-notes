module Main where

main = putStrLn "Hello, World!"

-- recursion

fib :: (Eq a, Num a) => a -> a
fib 0 = 0
fib 1 = 1
fib x = fib (x - 1) + fib (x - 2)

myMaximum :: (Ord a) => [a] -> a
myMaximum [] = error "maximum of empty list"
myMaximum [x] = x
myMaximum (x : xs)
  | x > maxTail = x
  | otherwise = maxTail
  where
    maxTail = myMaximum xs

myReplicate :: Integer -> el -> [el]
myReplicate len el
  | len <= 0 = []
  | otherwise = el : myReplicate (len - 1) el

myTake :: Integer -> [a] -> [a]
myTake _ [] = []
myTake len (el : rest)
  | len <= 0 = []
  | otherwise = el : myTake (len - 1) rest

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (head : rest) = myReverse rest ++ [head]

myRepeat :: a -> [a]
myRepeat a = a : myRepeat a

myZip :: [a] -> [b] -> [(a, b)]
myZip [] _ = []
myZip _ [] = []
myZip (headA : restA) (headB : restB) = (headA, headB) : myZip restA restB

myElem :: (Eq el) => el -> [el] -> Bool
_ `myElem` [] = False
el `myElem` (x : xs)
  | el == x = True
  | otherwise = el `myElem` xs

myQuickSort :: (Ord el) => [el] -> [el]
myQuickSort [] = []
myQuickSort (x : xs) = smallerSorted ++ [x] ++ largerSorted
  where
    smallerSorted = myQuickSort [a | a <- xs, a <= x]
    largerSorted = myQuickSort [a | a <- xs, a >= x]