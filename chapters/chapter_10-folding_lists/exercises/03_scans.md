# Scans

## 1 - 20 first Fibonacci numbers

```haskell
fibs = 1 : scanl (+) 1 fibs
```

```haskell
fibs = 1 : (take 19 (scanl (+) 1 fibs))
```

## 2 - Fibonacci numbers > 100

```haskell
fibs = 1 : [x | x <- scanl (+) 1 fibs, x < 100]
```

## 3 - Factorial

```haskell
factorial n = last . take (n+1) $ scanl (*) 1 [1..n]
```
