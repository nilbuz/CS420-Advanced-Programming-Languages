import Test.Tasty
import Common
import Assign2

main :: IO ()
main = runTests [unit1]

unit1 :: Score -> TestTree
unit1 sc = testGroup "Unit 1"
  [ mkTest
      sumList
      [1, 2, 3, 4]
      10
      "sumList 1"
  , mkTest
      sumList
      [1, -2, 3, 5]
      7
      "sumList 2"
  , mkTest
      sumList
      [1, 3, 5, 7, 9, 11]
      36
      "sumList 3"
  , mkTest
      digitsOfInt
      3124
      [3, 1, 2, 4]
      "digitsOfInt 1"
  , mkTest
      digitsOfInt
      352663
      [3, 5, 2, 6, 6, 3]
      "digitsOfInt 2"
  , mkTest
      digits
      31243
      [3, 1, 2, 4, 3]
      "digits 1"
  , mkTest
      digits
      (-23422)
      [2, 3, 4, 2, 2]
      "digits 2"
  , mkTest
      additivePersistence
      9876
      2
      "additivePersistence 1"
  , mkTest
      additivePersistence
      99999999999
      3
      "additivePersistence 2"
  , mkTest
      digitalRoot
      9876
      3
      "digitalRoot"
  , mkTest
      listReverse
      [1, 2, 3, 4]
      [4, 3, 2, 1]
      "reverse 1"
  , mkTest
      listReverse
      ["a", "b", "c", "d"]
      ["d", "c", "b", "a"]
      "rev 2"
  , mkTest
      palindrome
      "malayalam"
      True
      "palindrome 1"
  , mkTest
      palindrome
      "myxomatosis"
      False
      "palindrome 2" 
  , mkTest
      rootList
      [3]
      [3]
      "rootList"
  ,
     mkTest
      rootList
      [3]
      [3]
      "rootList"
  ,  mkTest
      (assoc 0 "william")
      [("ranjit", 85), ("william",23), ("moose",44)]
      23
      "assoc 0"
  , mkTest
      (assoc 0 "ranjit")
      [("ranjit", 85), ("william",23), ("moose",44)]
      85
      "assoc 1"
  , mkTest
      (assoc 0 "ranjit")
      [("ranjit", 85), ("william",23), ("moose",44), ("ranjit",9)]
      85
      "assoc 2"
  , mkTest
      (assoc 0 "bob")
      [("ranjit", 85), ("william",23), ("moose",44), ("ranjit",9)]
      0
      "assoc 3"
  , mkTest
      removeDuplicates
      [1,6,2,4,12,2,13,12,6,9,13]
      [1,6,2,4,12,13,9]
      "removeDups 0"
  , mkTest
      removeDuplicates
      [1,1,1]
      [1]
      "removeDups 1"
  , mkTest
      (wwhile (\x ->  let xx = x*x*x in (xx < 100, xx)))
      2
      512
      "wwhile 1"
  , mkTest
      (fixpointL collatz)
      1
      [1]
      "fixpointL 1"
  , mkTest
      (fixpointL collatz)
      2
      [2,1]
      "fixpointL 2"
  , mkTest
      (fixpointL collatz)
      3
      [3,10,5,16,8,4,2,1]
      "fixpointL 3"
  , mkTest
      (fixpointL collatz)
      4
      [4,2,1]
      "fixpointL 4"
  , mkTest
      (fixpointL collatz)
      5
      [5,16,8,4,2,1]
      "fixpointL 5"
  , mkTest
      (fixpointL gg)
      0
      [0,1000000, 540302, 857553, 654289, 793480,701369,
       763959,722102,750418,731403,744238,735604,741425,
       737506,740147,738369,739567,738760,739304,738937,
       739184,739018,739130,739054,739106,739071,739094,
       739079,739089,739082,739087,739083,739086,739084,739085]
      "fixpointL 6"
  , mkTest
      (fixpointW collatz)
      1
      1
      "fixpointW 1"
  , mkTest
      (fixpointW collatz)
      2
      1
      "fixpointW 2"
  , mkTest
      (fixpointW collatz)
      3
      1
      "fixpointW 3"
  , mkTest
      (fixpointW collatz)
      4
      1
      "fixpointW 4"
  , mkTest
      (fixpointW collatz)
      5
      1
      "fixpointW 5"
  , mkTest
      (fixpointW gg)
      0
      739085
      "fixpointL 6"
  , mkTest
      sqSum
      []
      0
      "sqSum 1"
  , mkTest
      sqSum
      [1,2,3,4]
      30
      "sqSum 2"
  , mkTest
      sqSum
      [-1,-2,-3,-4]
      30
      "sqSum 3"

  , mkTest
      (\(fs, x) -> pipe fs x)
      ([], 3)
      3
      "pipe 1"
  
  , mkTest
      (\(fs, x) -> pipe fs x)
      ([(\x -> 2*x), (\x -> x + 3)], 3)
      12
      "pipe 2"

  , mkTest
      (\(fs, x) -> pipe fs x)
      ([(\x -> x + 3), (\x -> 2*x)], 3)
      9
      "pipe 3"

  , mkTest
      (\(fs, x) -> pipe fs x)
      ([(\x -> x + 5), (\x -> x * 2), (\x -> x - 3)], 4)
      7
      "pipe 4"

  , mkTest
      (\(sep, lst) -> sepConcat sep lst)
      (", ", ["foo", "bar", "baz"])
      "foo, bar, baz"
      "sepConcat 1"
 
  , mkTest
     (\(sep, lst) -> sepConcat sep lst)
     ("---", [])
     ""
     "sepConcat 2"

  , mkTest
     (\(sep, lst) -> sepConcat sep lst)
     ("", ["a", "b", "c", "d", "e"])
     "abcde"
     "sepConcat 3"

  , mkTest
      (\(sep, lst) -> sepConcat sep lst)
     ("X", ["hello"])
     "hello"
     "sepConcat 4"

  , mkTest
      (\(f, xs) -> stringOfList f xs)
     (intString, [1, 2, 3, 4, 5, 6])
     "[1, 2, 3, 4, 5, 6]"
     "stringOfList 1"

  , mkTest
      (\(f, xs) -> stringOfList f xs)
      (id, ["foo"])
      "[foo]"
     "stringOfList 2"

  , mkTest
      (\(f, xs) -> stringOfList f xs)
      (stringOfList intString, [[1, 2, 3], [4, 5], [6], []])
      "[[1, 2, 3], [4, 5], [6], []]"
      "stringOfList 3"

  , mkTest
      (\(f, xs) -> stringOfList f xs)
      (stringOfList intString, [[1, 2], [3, 4]])
      "[[1, 2], [3, 4]]"
      "stringOfList 4"

  , mkTest
      (\(x, n) -> clone x n)
      (3, 5)
      [3, 3, 3, 3, 3]
      "clone 1"

  ,  mkTest
      (\(x, n) -> clone x n)
      ("foo", 2)
      ["foo", "foo"]
      "clone 2"

  , mkTest
      (\(x, n) -> clone x n)
      ([1, 2, 3], 3)
      [[1, 2, 3], [1, 2, 3], [1, 2, 3]]
      "clone 3"

  , mkTest
      (\(x, n) -> clone x n)
      ("abc", 4)
      ["abc", "abc", "abc", "abc"]
      "clone 4"

  , mkTest
      (\(xs, ys) -> padZero xs ys)
      ([9, 9], [1, 0, 0, 2])
      ([0, 0, 9, 9], [1, 0, 0, 2])
      "padZero 1"


  , mkTest
      (\(xs, ys) -> padZero xs ys)
      ([1, 0, 0, 2], [9, 9])
      ([1, 0, 0, 2], [0, 0, 9, 9])
      "padZero 2"

  , mkTest
      (\(xs, ys) -> padZero xs ys)
      ([1, 2, 3, 4, 5], [9, 8, 7])
      ([1, 2, 3, 4, 5], [0, 0, 9, 8, 7])
      "padZero 3"

  , mkTest
      (\(xs, ys) -> padZero xs ys)
      ([5, 4, 3], [6, 7, 8, 9])
      ([0, 5, 4, 3], [6, 7, 8, 9])
      "padZero 4"

  , mkTest
      removeZero
      [0,0,0,1,0,0,2]
      [1,0,0,2]
      "removeZero 1"

  , mkTest
      removeZero
      [9,2]
      [9,2]
      "removeZero 2"

  , mkTest
      removeZero
      [9, 0 , 0, 0, 9]
      [9, 0 , 0, 0, 9]
      "removeZero 3"

  , mkTest
      (\(xs, ys) -> normalize (bigAdd xs ys))
      ([9, 9], [1, 0, 0, 2])
      [1, 1, 0, 1]
      "bigAdd 1"

  , mkTest
      (\(xs, ys) -> normalize (bigAdd xs ys))
      ([9, 9, 9, 9], [9, 9, 9])
      [1, 0, 9, 9, 8]
      "bigAdd 2"

  , mkTest
     (\(xs, ys) -> normalize (bigAdd xs ys))
     ([1, 2, 3, 4, 5], [5, 4, 3, 2, 1])
     [6, 6, 6, 6, 6]
     "bigAdd 3"

  , mkTest
      (\(xs, ys) -> normalize (bigAdd xs ys))
      ([0, 0, 0, 0, 0, 1], [9, 9, 9])
      [1, 0, 0, 0]
      "bigAdd 4"

  , mkTest
      (\(xs, ys) -> normalize (bigAdd xs ys))
      ([2, 1, 4, 7, 4, 8, 3, 6, 4, 7], [2, 1, 4, 7, 4, 8, 3, 6, 4, 7])
      [4, 2, 9, 4, 9, 6, 7, 2, 9, 4]
      "bigAdd 5"

  , mkTest
      (\(d, xs) -> normalize (mulByDigit d xs))
      (1, [0,0,0,1, 7, 1, 7, 9, 8, 6, 9, 1, 7, 6, 0, 0, 1, 8, 9])
      [1, 7, 1, 7, 9, 8, 6, 9, 1, 7, 6, 0, 0, 1, 8, 9]
      "mulByDigit 1"

  , mkTest
      (\(d, xs) -> normalize (mulByDigit d xs))
      (8, [2, 1, 4, 7, 4, 8, 3, 6, 4, 7])
      [1, 7, 1, 7, 9, 8, 6, 9, 1, 7, 6]
      "mulByDigit 2"

  , mkTest
      (\(d, xs) -> normalize (mulByDigit d xs))
      (1, [1, 7, 1, 7, 9, 8, 6, 9, 1, 7, 6, 0, 0, 1, 8, 9])
      [1, 7, 1, 7, 9, 8, 6, 9, 1, 7, 6, 0, 0, 1, 8, 9]
      "mulByDigit 33"

  , mkTest
      (\(d, xs) -> normalize (mulByDigit d xs))
      (1, [2, 1, 4, 7, 4, 8, 3, 6, 4, 7, 8, 9])
      [2, 1, 4, 7, 4, 8, 3, 6, 4, 7, 8, 9]
      "mulByDigit 4"

  , mkTest
      (\(xs, ys) -> normalize (bigMul xs ys))
      ([9, 9, 9, 9], [9, 9, 9, 9])
      [9, 9, 9, 8, 0, 0, 0, 1]
      "bigMul 1"

  , mkTest
      (\(xs, ys) -> normalize (bigMul xs ys))
      ([9, 9, 9, 9, 9], [9, 9, 9, 9, 9])
      [9, 9, 9, 9, 8, 0, 0, 0, 0, 1]
      "bigMul 2"

  , mkTest
     (\(xs, ys) -> normalize (bigMul xs ys))
      ([8], [2, 1, 4, 7, 4, 8, 3, 6, 4, 7])
      [1, 7, 1, 7, 9, 8, 6, 9, 1, 7, 6]
      "bigMul 3"

  , mkTest
     (\(xs, ys) -> normalize (bigMul xs ys))
      ([8,0], [2, 1, 4, 7, 4, 8, 3, 6, 4, 7])
      [1, 7, 1, 7, 9, 8, 6, 9, 1, 7, 6,0]
      "bigMul 4"

  , mkTest
      (\(xs, ys) -> normalize (bigMul xs ys))
      ([0,0,0,0,0,8,0,0], [0,2, 1, 4, 7, 4, 8, 3, 6, 4, 7])
      [1, 7, 1, 7, 9, 8, 6, 9, 1, 7, 6,0,0]
     "bigMul 5"
     
  ]


  where

    mkTest :: (Show b, Eq b) => (a -> b) -> a -> b -> String -> TestTree
    mkTest = mkTest' sc

    normalize :: [Int] -> [Int]
    normalize xs = dropWhile (== 0) xs