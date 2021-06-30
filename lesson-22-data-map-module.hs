module Main where

import Data.List (foldr)
import Data.Map as Map hiding (foldr)

main = putStrLn "Hello, World!"

-- maps are just lists of pairs

findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey _ [] = Nothing
findKey key ((k, v) : rest) =
  if key == k
    then Just v
    else findKey key rest

findKeyFoldr :: (Eq k) => k -> [(k, v)] -> Maybe v
findKeyFoldr key = foldr (\(k, v) acc -> if key == k then Just v else acc) Nothing

-- Data.Map maps are also just lists of pairs. The important difference is
-- that they are implemented internally with trees making them way faster than
-- normal lists of pairs.

-- fromList takes a list of pairs and turns them into a Map

-- empty returns an empty Map

-- inserts takes a key, a value and a map inserts the key and value into the
-- map

-- null returns true if the given map is empty

-- size returns the size of the given map

-- singleton takes a key and a value and creates a map with only a single value

-- lookup takes a key and a map and returns  maybe the associated value

-- member returns true if the given key is set in the given map

-- map and filter work liker their Data.List counterparts. The only difference
-- is that they only act upon the values of the given map

-- toList is the inverse of fromList

-- keys and elems returns a list of the given map's keys and elems respecitvely