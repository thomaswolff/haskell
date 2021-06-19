rvrs :: String -> String
-- Input: "Curry is awesome"
-- Output: "awesome is Curry"
rvrs sentence =
  let firstWord = take 5 sentence
      middleWord = take 4 (drop 5 sentence)
      lastWord = take 7 (drop 9 sentence)
  in concat [lastWord, middleWord, firstWord]