module Main
  where
main=putStrLn "Hello, World!"

-- functions
doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y

-- if
doubleSmallNumber x = if x > 100
    then x
    else x * 2
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1                        -- ' at the end of a function denotes a more strict version
conanO'Brien = "It's a-me, Conan O'Brien!"                                     -- functions which don't receive any arguments are fundamentally the same as constants

-- lists
lostNumbers = [4, 8, 15, 16, 23, 42]                                           -- lists in haskell are homogenous data structures
twoLists = [1, 2, 3] ++ [3, 4, 5]                                              -- the ++ operator is used to add to lists together
strings = "123" ++ "456"                                                       -- strings in haskell are effectively lists of characters
characters = ['a', 'b', 'c'] ++ ['d', 'e', 'f']                                -- the ++ operator walks through all elements in the preceding list which makes it rather slow
cons = 'A' : ' ' : "SMALL CAT"                                                 -- the : cons operator adds an item to the start of the list
cons2 = 5:[1, 2, 3, 4, 5]                                                      -- the cons operator is instantaneous
listElement = [1, 2, 3] !! 1                                                   -- the !! operator is used to retrieve a value from a list
listComparison = [1, 2, 3] == [1, 2, 2]
listHead = head [1, 2, 3]                                                      -- takes a list and returns its first element
listTail = tail [1, 2, 3]                                                      -- takes a list and returns everything after the head
listLast = last [1, 2, 3]
listInit = init [1, 2, 3]                                                      -- takes a list and returns everything except its last element
listLength = length [1, 2, 3]
listEmpty = null [1, 2, 3]                                                     -- returns true if supplied list ist empty
listReverse = reverse [1, 2, 3]
listTake = take 1 [1, 2, 3]                                                    -- returns a sublist containing the first x or less items of the initial list
listDrop = drop 1 [1, 2, 3]                                                    -- returns everything after the first x elements
listMinimum = minimum [1, 2, 3]                                                -- returns the smallest element of the list
listMaximum = maximum [1, 2, 3]                                                -- returns the largest element of the list
listSum = sum [1, 2, 3]                                                        -- returns the sum of a list
listProduct = product [1, 2, 3]                                                -- returns the product of a list
listElemen = 2 `elem` [1, 2, 3]                                                -- checks if the element is in the list

-- ranges
numberRange = [1 .. 3]
characterRange = ['x' .. 'z']
evenNumbersRange = [2, 4 .. 10]
floatRange = [0.1, 0.3 .. 1]                                                   -- using floats with ranges can yield unwanted results
mulRange = [13, 26 .. 24 * 13];

-- infinite lists
infiniteLists = take 24 [13,26..]                                              -- as Haskell is lazy evaluated it will only evaluate the elements of the list when they are being retrieved
listCycle = take 10 (cycle [1,2,3])                                            -- creates an infinite cycle of the supplied list's elements
listRepeat = take 10 (repeat 5)                                                -- repeats the given number to infinity
listReplicate = replicate 10 5                                                 -- better way to get a list of a value with a specific length