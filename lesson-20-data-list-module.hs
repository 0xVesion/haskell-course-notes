module Main where

import Data.List

main = putStrLn "Hello, World!"

-- Data.List contains all methods regarding lists. It even includes the
-- methods filter and map which are loaded by default in the Prelude
-- environment

-- joins all pairs of a list with the given element
intersperseTest = intersperse '-' "ABCD" -- -> A-B-C-D

-- takes a list of lists joins the lists with a given list and then flattens
-- the result
intercalateTest = intercalate "-" ["001", "212", "123456"] -- -> "001-212-123456"

transposeTest = transpose [[1, 2, 3], [4, 5, 6], [7, 8, 9]] -- -> [[1,4,7],[2,5,8],[3,6,9]]

-- foldl' and foldl1' are stricter variants of their respective lazy
-- incarnation. They should be used if the normal variants encounter a stack
-- overflow.

-- flattens a list of lists
concatTest = concat ["I", "like", "fridays"] -- -> Ilikefridays

-- and returns true if all values in the given list are true
-- or returns true if one value in the given list is true

-- all returns true if all values in the given list match the given predicate
-- any returns true if one value in the given list matches the given predicate

-- iterate takes a functiona and a starting value and applies the function to
-- the starting value, then it applies the function to the result again, etc.
iterateTest = take 3 $ iterate (++ "haha") "haha" -- -> ["haha","hahahaha","hahahahahaha"]

-- splitAt takes a number and a list. It then splits the list after that many
-- elements and returns the resulting two parts as a pair.
splitAtTest = splitAt 3 "heyman" -- -> ("hey","man")

-- takeWhile takes a predicate and a list. It returns all elements matching the
-- predicate until one not matching the predicate is encountered.

-- dropWhile takes a predicate and a list. It drops all elements matching the
-- predicate until one not matching the predicate is encountered.

-- span is similiar to takeWhile. It also takes a list and a predicate. It
-- returns a pair of lists. The first list contains everything takeWhile would
-- return the second list contains the rest.
spanTest = span (< 3) [1, 2, 3, 4, 5, 6] -- -> ([1,2,3], [4,5,6])

-- break is similiar to span. It brakes the list in two as soon as the given
-- predicate matches for the first time.
breakTest = break (== 4) [1, 2, 3, 4, 5, 6] -- -> ([1,2,3], [4,5,6])

-- sort sorts a list asc. The elements of the list must be part of the Ord
-- typeclass.

-- group takes a list and groups adjacent items if they are equal
groupTest = group [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 2, 2, 2, 5, 6, 7] -- -> [[1,1,1,1],[2,2,2,2],[3,3],[2,2,2],[5],[6],[7]]

-- inits takes a list and applies init to it. I then recursively applies init
-- to the result and returns a list of all possible init results until the
-- init returns an empty list.
initTest = inits "123" -- -> ["","1","12","123"]

myInits :: [a] -> [[a]]
myInits [] = [[]]
myInits x = let i = init x in myInits i ++ [x]

-- tails is similiar to inits but uses tail instead of init.
tailsTest = tails "123" -- -> ["123","23","3",""]

-- this is an example usage of the tails function
mySearch :: Eq a => [a] -> [a] -> Bool
mySearch needle haystack =
  let needleLen = length needle
   in foldl (\acc x -> (take needleLen x == needle) || acc) False (tails haystack)

-- i like the recursive version better though
mySearchRecu :: Eq a => [a] -> [a] -> Bool
mySearchRecu _ [] = False
mySearchRecu needle haystack =
  stackStartsWithNeedle || mySearchRecu needle (tail haystack)
  where
    stackStartsWithNeedle = take (length needle) haystack == needle

-- find takes a list and a predicate and returns the first occurrence of it
-- it returns a maybe value. Maybe values are values that can be either a 
-- single value or nothing.

-- elemIndex might return the index of the first occurrence of the searched value in a list

-- elemIndices returns the indices of all occurences of the searched value in a list

-- findIndex is like find, but returns the index of the first element that 
-- satifies the given predicate

-- delete takes an element and a list and deletes the first occurence of the 
-- given element from the list

-- nub takes a list and deletes all duplicate elements from it

-- \\ is the list difference function. It takes two lists and removes the 
-- elements in the right list from the left list
-- [1, 2, 3, 4, 5, 6] \\ [1, 3, 5] -> [2, 4, 6]

-- union joins to lists together and removes all duplicate elements from the 
-- resulting list

-- intersect returns all elements found in both supplied lists

-- insert takes an element and a list which is part of the Ord type class and 
-- inserts the element in the first position where it's still less than or 
-- equal to the next element into the list