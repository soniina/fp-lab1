module DistinctPowers (recSol, tailRecSol, moduleSol, mapSol, infiniteListSol) where

import qualified Data.Set as Set

recSol :: Integer -> Int
recSol n = Set.size . Set.fromList $ helper 2
  where
    helper a
      | a > n = []
      | otherwise = map (a ^) [2 .. n] ++ helper (a + 1)

tailRecSol :: Integer -> Int
tailRecSol n = helper 2 Set.empty
  where
    helper a acc
      | a > n = Set.size acc
      | otherwise = helper (a + 1) (Set.union acc (Set.fromList [a ^ b | b <- [2 .. n]]))

moduleSol :: Integer -> Int
moduleSol n = count
  where
    generate = [(a, b) | a <- [2 .. n], b <- [2 .. n]]
    powerPairs = map (uncurry (^)) generate
    uniqueSet = Set.fromList powerPairs
    count = Set.size uniqueSet

mapSol :: Integer -> Int
mapSol n = Set.size $ Set.fromList $ concatMap (\a -> map (a ^) [2 .. n]) [2 .. n]

infiniteListSol :: Integer -> Int
infiniteListSol n = Set.size . Set.fromList $ (n ^ n) : takeWhile (< n^n) [a^b | a <- [2..], b <- [2..n]]
