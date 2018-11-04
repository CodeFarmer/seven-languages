module Main where

main :: IO ()
main = return ()

size [] = 0
size (h:t) = 1 + size t

prod [] = 1
prod (h:t) = h * prod(t)

allEven :: [Integer] -> [Integer]
allEven [] = []
allEven (h:t) = if even h then h:allEven(t)
                else allEven(t)

