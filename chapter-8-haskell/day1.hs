module Main where

main :: IO ()
main = return ()


-- the thing about allEven is boring so we're not doing that


colours = ["black", "white", "blue", "yellow", "red"]

colourPairs :: [([Char], [Char])]
colourPairs = [(a, b) | a <- colours, b <- colours, a < b]

multiplicationTables = [(b, a, a * b) | a <- [1..12], b <- [1..12]]

-- we're also not doing the map colouring problem for now
