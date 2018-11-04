module Main where

main :: IO ()
main = return ()

factorial :: Integer -> Integer
factorial 0 = 1
factorial x = x * factorial(x - 1)

factorial2 :: Integer -> Integer
factorial2 x
  | x > 0 = x * factorial2(x - 1)
  | otherwise = 1

