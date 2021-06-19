# Chapter exercises

## Reading syntax

## 1

- `concat [[1, 2, 3], [4, 5, 6]]` 
  - Incorrect, as `concat` takes two arguments. Wrong answer
  - `concat` takes one parameter, a list of lists, and returns a list of all the sublists.
- `++ [1, 2, 3] [4, 5, 6]`
  - Incorrect, as `++` is an infix operator, and is used here as a prefix operator, in which case it needs to be surrounded with parentheses.
  - Corrected: `(++) [1, 2, 3] [4, 5, 6]`
- `(++) "hello" " world"`
  - Correct.
- `["hello" ++ " world]`
  - Incorrect, as `" world` is missing a second `"`.
  - Corrected: `["hello" ++ " world"]` -> `["hello world"]`
- `4 !! "hello"`
  - Correct. Wrong answer.
  - Corrected: `"hello" !! 4`
- `(!!) "hello" 4`
  - Correct.
- `take "4 lovely"`
  - Incorrect, as `4` should not be included in the string.
  - Corrected: `take 4 "lovely"`
- `take 3 "awesome"`
  - Correct.

## 2

Expressions

```
a) concat [[1 * 6], [2 * 6], [3 * 6]]
b) "rain" ++ drop 2 "elbow"
c) 10 * head [1, 2, 3]
d) (take 3 "Julie") ++ (tail "yes")
e) concat [tail [1, 2, 3],
           tail [4, 5, 6],
           tail [7, 8, 9]]
```

Results

```
a) "Jules"
b) [2,3,5,6,8,9]
c) "rainbow"
d) [6,12,18]
e) 10
```

Matches

- a -> d
- b -> c
- c -> e
- d -> a
- e -> b

## Buildind functions

### 1

```
a) 
-- Given
"Curry is awesome"
-- Return
"Curry is awesome!"

function_a x = x ++ "!"

b) 
-- Given
"Curry is awesome!"
-- Return
"y"

function_b x = x !! 4

c) 
-- Given
"Curry is awesome!"
-- Return
"awesome!"

function_c x = drop 9 x
```

### 2

String operations

```haskell

addExclamationMark :: String -> String
addExclamationMark x = x ++ "!"

fifthLetter :: String -> Char
fifthLetter x = x !! 4

skipNineCharacters :: String -> String
skipNineCharacters x = drop 9 x

```

### 3

```haskell

thirdLetter :: String -> Char
thirdLetter x = x !! 2

```

### 4

```haskell

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome!" !! (x - 1)

```

### 5

```haskell

rvrs :: String -> String
-- Input: "Curry is awesome"
-- Output: "awesome is Curry"
rvrs sentence =
  let firstWord = take 5 sentence
      middleWord = take 4 (drop 5 sentence)
      lastWord = take 7 (drop 9 sentence)
  in concat [lastWord, middleWord, firstWord]

```