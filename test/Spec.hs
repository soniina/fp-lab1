import Test.Tasty
import Test.Tasty.HUnit

import FibSumEven

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "All tests"
  [ testCase "recSol 1 2" $
      recSol 1 2 @?= 4613732
  , testCase "tailRecSol 1 2" $
      tailRecSol 1 2 @?= 4613732
  , testCase "moduleSol 1 2" $
      moduleSol 1 2 @?= 4613732
  , testCase "mapSol 1 2" $
      mapSol 1 2 @?= 4613732
  , testCase "infiniteListSol 1 2" $
      infiniteListSol 1 2 @?= 4613732
  ]
