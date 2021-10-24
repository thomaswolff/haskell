-- Warm up and review

-- 1

-- 1.a
triples =
    [(x, y, z) | x <- stops, y <- vowels, z <- stops]
    where
        stops = "pbtdkg"
        vowels = "aeiou"
-- 1.b
triplesWithPrefixP = [(x,y,z) | (x,y,z) <- triples, x == 'p']

-- 1.c
sentences =
    let nouns = ["programmer", "computer", "keyboard", "mouce", "table"]
        verbs = ["likes", "hates", "types", "moves", "clicks"] in
    [(x,y,z) | x <- nouns, y <- verbs, z <- nouns]

-- 2
seekritFunc :: [Char] -> Int
seekritFunc x =
    div (sum (map length (words x)))
        (length (words x))

-- seekritFunc 
    -- tar inn en tekststreng `x` som input
    -- `words x` splitter tekststrengen på mellomrom, og returnerer en liste
    -- `map length` map-er hvert innslag i listen til den korresponderende lengden av den gitte tekststrengen
    -- `sum` legger sammen lengdene til alle tekststrengene i listen
    -- `length (words x)` henter antall ord i tekststrengen
    -- `div` utfører heltallsdivisjon mellom lengden til alle tekststrengene i listen og antall ord i tekststrengen
    -- Dermed finner seekritFunc en slags gjennomsnittlig ordlengde, men runder nedover til nærmeste heltall.

-- 3
seekritFunc2 :: Fractional a => [Char] -> a
seekritFunc2 x =
    let mySum = fromIntegral (sum (map length (words x)))
        myCount = fromIntegral (length (words x)) in
    mySum / myCount

-- Rewriting functions using folds

-- 1: myOr

myOr :: [Bool] -> Bool
myOr = foldr (||) False

-- 2: myAny

myAny :: (a -> Bool) -> [a] -> Bool
myAny f l = myOr $ map f l

-- 3: myElem

myElem :: Eq a => a -> [a] -> Bool
myElem x = any (==x)

myElem2 :: Eq a => a -> [a] -> Bool
myElem2 x =
    foldr f False
    where f a b = b || a == x

-- 4: myReverse

myReverse :: [a] -> [a]
myReverse =
    foldr f []
    where f x y = y ++ [x]


-- 5: myMap

myMap :: (a -> b) -> [a] -> [b]
myMap mapFunc = foldr ((:) . mapFunc) []

-- 6: myFilter

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter filterFunc =
    foldr f []
    where f x y = if filterFunc x then x : y else y

-- 7: squish

squish :: [[a]] -> [a]
squish = foldr (++) []

-- 8: squishMap

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap mapFunc l =
    foldr (++) [] $ foldr ((:) . mapFunc) [] l
-- Alternatively: squishMap mapFunc l = squish $ myMap mapFunc l

-- 9: squishAgain

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 10: myMaximumBy

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy c xs =
    let f acc x =
            case c acc x of
            GT -> acc
            _ -> x
    in
    foldl f (head xs) xs

-- 11: myMinimumBy

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy c xs =
    let f acc x =
            case c acc x of
                LT -> acc
                _ -> x
    in 
    foldl f (head xs) xs