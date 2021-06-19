# Exercises

## 1

```haskell
++ [1, 2, 3] [4, 5, 6]
```

=> Will fail because `++` lacks `()` around it to be run as a prefix function.

## 2

```haskell
'<3' ++ ' Haskell'
```

=> Will fail because, `'` can only hold `Char` values and not `String` values.

## 3

```haskell
concat ["<3", " Haskell"]
```

=> Returns the `String` value `"<3 Haskell"`.