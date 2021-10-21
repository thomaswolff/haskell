# Chapter 10

```haskell
myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f z [] = z
myFoldr f z (x:xs) = f x (myFoldr f z xs)

myScanr :: (a -> b -> b) -> b -> [a] -> b
myScanr f z [] = [z]
myScanr f z (x:xs) = 
    let nextScanr = myScanr f z xs
    (f x nextScanr) : [nextScanr]

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

myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl f acc [] = acc
myFoldl f acc (x:xs) = myFoldl f (f acc x) xs

# Alternativ 1
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

# Alternativ 2
# myFoldl f "z" ["a", "b", "c"]
#
# 1. myFoldl f "z" ("a":["b", "c"]) = myFoldl f (f "z" "a") ["b", "c"]
#              acc   x :    xs
#
# 2. myFoldl f (f "z" "a") ("b":["c"]) = myFoldl f (f (f "z" "a") "b") ["c"]
#              acc    x : xs
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
```
