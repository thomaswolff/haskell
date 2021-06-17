# Exercises: Scope

# 1

```bash
Prelude> x = 5
Prelude> y = 7
Prelude> z = x * y
```

`y` is in scope for `z`.

# 2

```bash
f = 3
g = 6 * f + h
```

`h` is not in scope for `g`.

# 3

Code in source file:

```bash
area d = pi * (r * r)
r = d / 2
```

Everything is in scope to execute.

# 4

```bash
area d = pi * (r * r)
     where r = d / 2
```

`d` is in scope. However, `r` is not.