module Reverse where

rvrs :: String -> String
rvrs x =
  let firstWord = take 5 x
      middleWord = take 4 (drop 5 x)
      lastWord = take 7 (drop 9 x)
  in concat [lastWord, middleWord, firstWord]

main :: IO ()
main = print $ rvrs "Curry is awesome"