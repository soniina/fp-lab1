module FibSumEven (recSol, tailRecSol, moduleSol, mapSol, infiniteListSol)  where

recSol :: Int -> Int -> Int
recSol a b
  | a > 4000000 = 0
  | even a = a + recSol b next
  | otherwise = recSol b next
  where
    next = a + b

tailRecSol :: Int -> Int -> Int
tailRecSol a b = helper a b 0
  where
    helper x y acc
      | x > 4000000 = acc
      | even x = helper y next (acc + x)
      | otherwise = helper y next acc
      where
        next = x + y

moduleSol :: Int -> Int -> Int
moduleSol a b = moduleSum . moduleEven $ moduleFibSeq a b
  where
    moduleSum = foldl (+) 0
    moduleEven = filter even
    moduleFibSeq x y = takeWhile (<= 4000000) fibs
      where
        fibs = x : y : zipWith (+) fibs (tail fibs)

mapSol :: Int -> Int -> Int
mapSol a b = sum $ filter even $ takeWhile (<= 4000000) fibs
  where
    fibs = map fst $ iterate (\(x, y) -> (y, x + y)) (a, b)

infiniteListSol :: Int -> Int -> Int
infiniteListSol a b = sum $ filter even $ takeWhile (<= 4000000) fibs
  where
    fibs = a : b : zipWith (+) fibs (tail fibs)
