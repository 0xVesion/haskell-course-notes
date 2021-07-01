module Main where

import Data.List
import Data.Set as Set

main = putStrLn "Hello, World!"

-- Sets are lists only containing unique elements. They are also implemented
-- using tree structures

-- fromList can be used to convert a list to a set ex.: fromList "Hello World!" -> " !HWdelor"
-- the resulting items of the set will also be ordered

-- The difference function returns all letters contained in the first set which
-- are missing from the second set

-- union combines two sets with each other

-- intersection returns a list of all elements contained in both sets

-- isSubSet checks if the left set contains only elements also found in the 
-- right set

-- Sets are most often used to weed out duplicates from a list. The function 
-- nub already does this. The difference between nub and a proper set is that 
-- nub only needs the elements to be a part of the Eq type class and it 
-- preserves the order of the elements. Using nub is also slower on longer 
-- lists than using a proper set