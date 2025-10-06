import Test.Tasty
import Test.Tasty.HUnit

import FibSumEven
import DistinctPowers

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Lab1 tests"
  [ testGroup "Problem2 tests" [
        testCase "recSol 0 1" $ FibSumEven.recSol 1 2 @?= 4613732,
        testCase "tailRecSol 0 1" $ FibSumEven.tailRecSol 1 2 @?= 4613732,
        testCase "moduleSol 0 1" $ FibSumEven.moduleSol 1 2 @?= 4613732, 
        testCase "mapSol 0 1" $ FibSumEven.mapSol 1 2 @?= 4613732, 
        testCase "infiniteListSol 0 1" $ FibSumEven.infiniteListSol 1 2 @?= 4613732,
        testCase "recSol 1 2" $ FibSumEven.recSol 1 2 @?= 4613732,
        testCase "tailRecSol 1 2" $ FibSumEven.tailRecSol 1 2 @?= 4613732,
        testCase "moduleSol 1 2" $ FibSumEven.moduleSol 1 2 @?= 4613732, 
        testCase "mapSol 1 2" $ FibSumEven.mapSol 1 2 @?= 4613732, 
        testCase "infiniteListSol 1 2" $ FibSumEven.infiniteListSol 1 2 @?= 4613732
    ],
    testGroup "Problem29 tests" [
        testCase "recSol 5" $ DistinctPowers.recSol 5 @?= 15,
        testCase "tailRecSol 5" $ DistinctPowers.tailRecSol 5 @?= 15,
        testCase "moduleSol 5" $ DistinctPowers.moduleSol 5 @?= 15, 
        testCase "mapSol 5" $ DistinctPowers.mapSol 5 @?= 15, 
        testCase "infiniteListSol 5" $ DistinctPowers.infiniteListSol 5 @?= 15,
        testCase "recSol 100" $ DistinctPowers.recSol 100 @?= 9183,
        testCase "tailRecSol 100" $ DistinctPowers.tailRecSol 100 @?= 9183,
        testCase "moduleSol 100" $ DistinctPowers.moduleSol 100 @?= 9183, 
        testCase "mapSol 100" $ DistinctPowers.mapSol 100 @?= 9183, 
        testCase "infiniteListSol 100" $ DistinctPowers.infiniteListSol 100 @?= 9183
    ]
  ]
