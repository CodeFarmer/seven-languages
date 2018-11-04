module Main where

main :: IO ()
main = return ()

fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib(n - 1) + fib(n - 2)

fibTuple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
fibTuple (x, y, 0) = (x, y, 0)
fibTuple (x, y, i) = fibTuple (y, x + y, i - 1)

fibResult (x, _, _) = x

fibR :: Integer -> Integer
fibR n = fibResult(fibTuple(0, 1, n))

fibNextPair :: (Integer, Integer) -> (Integer, Integer)
fibNextPair (x, y) = (y, x + y)

fibNthPair :: Integer -> (Integer, Integer)
fibNthPair 1 = (1, 1)
fibNthPair n = fibNextPair(fibNthPair(n - 1))

fibN = fst . fibNthPair
