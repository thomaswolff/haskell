# Chapter 10

## foldr

### Implementation

```haskell
myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f z [] = z
myFoldr f z (x:xs) = f x (myFoldr f z xs)

# f = (++)
#
# myFoldr f "z" ["a", "b", "c"]
#
# 1. myFoldr f "z" ("a":["b", "c"]) = f "a" (myFoldr f "z" ["b", "c"])
#               z    x :    xs
#
# 2. myFoldr f "z" ("b":["c"]) = f "b" (myFoldr f "z" ["c"])
#               z    x :  xs
#
# 3. myFoldr f "z" ("c":[]) = f "c" (myFoldr f "z" [])
#               z    x :xs
#
# 4: myFoldr f "z" [] = "z"
#
# 1      2      3      4
# f "a" (f "b" (f "c" "z"))
# f "a" (f "b" "cz")
# f "a" "bcz"
# f "a" "bcz"
# f "abcz"
```

### Questions

1. How does the spine for the following expression look?

```haskell
[1] ++ undefined ++ [2]
```

## foldl

```haskell
myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl f acc [] = acc
myFoldl f acc (x:xs) = myFoldl f (f acc x) xs

# foldl - utsetter evaluering av verdiene i ryggraden til den er ferdig med å traversere ryggraden
# f = (++)
# myFoldl f "z" ["a", "b", "c"]
#
# 1. myFoldl f "z" ("a":["b", "c"]) = myFoldl f (f "z" "a") ["b", "c"]
#              acc   x :    xs
#
# 2. myFoldl f (f "z" "a") ("b":["c"]) = myFoldl f (f (f "z" "a") "b") ["c"]
#              acc    x : xsd
#
# 3. myFoldl f (f (f "z" "a") "b") ("c":[]) = myFoldl f (f (f (f "z" "a") "b") "c") []
#               acc    x :xs
#
# 4. myFoldl f (f (f (f "z" "a") "b") "c") [] = f (f (f "z" "a") "b") "c"
#               acc
#
# f (f (f "z" "a") "b") "c"
# f (f "za" "b") "c"
# f "zab" "c"
# f "zab" "c"
# "zabc"

# foldl' - strict evaluation
# myFoldl f "z" ["a", "b", "c"]
#
# 1. myFoldl f "z" ("a":["b", "c"]) = myFoldl f (f "z" "a") ["b", "c"]
#              acc   x :    xs
#
# 2. myFoldl f "za" ("b":["c"]) = myFoldl f (f "za" "b") ["c"]
#              acc    x : xs
#
# 3. myFoldl f "zab" ("c":[]) = myFoldl f (f "zab" "c") []
#               acc    x :xs
#
# 4. myFoldl f "zabc" [] = "zabc"
#               acc
```

```haskell
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f z [] = z
foldr f z (x:xs) = f x (myFoldr f z xs)

foldr (\x b -> even x || b) False [1..]
```

```txt
f = (\x b -> even x || b)
z = False
foldr (\x b -> even x || b) False [1..]

foldr f z (1:[2..]) = f 1 (foldr f False [2..])
foldr f False (2, [3..]) = f 2 (fold f False [3..])
```