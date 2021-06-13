# Chapter exercises

## Parenthesization

### 1

`2 + 2 * 3 - 1 == 2 + (2 * 3) - 1`

### 2

```haskell
(^) 10 $ 1 + 1
== (^) 10 $ 2
== (10^) $ 2
== 10 ^ 2
== 100

== (^) 10 (1 + 1)
```

### 3

```haskell
2 ^ 2 * 4 ^ 5 + 1
== (2 ^ 2) * (4 ^ 5) + 1
```

## Equivalent expressions

```haskell
-- 1
1 + 1
2
-- Equivalent

-- 2
10 ^ 2
10 + 9 * 10
-- Equivalent

-- 3
400 - 37
(-) 37 400
-- Not equivalent

-- 4
100 `div` 3
100 / 3
-- Not equivalent
-- `div` uses integral division
-- / however, use fractional division

-- 5
2 * 5 + 18
2 * (5 + 18)
-- Not equivalent
-- * has higher precedence than +, and the parentheses flips this order of execution.
```

## Fun with functions

```haskell
module Exercise210 where

z = 7

y = z + 8

x = y ^ 2

waxOn = x * 5

-- 1
10 + waxOn
-- 1035
(+10) waxOn
-- 1035
(-) 15 waxOn
-- -1010
(-) waxOn 15
-- 1010

-- 4

```