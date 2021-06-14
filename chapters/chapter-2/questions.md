# Questions

- Why is `mod (3-12) 7 == 5`?
=> Because it is defined as

```haskell
mod x y = x - (div x y)*y
```

where `div x y` is defined as integral division, truncated towards negative infinity.

- Explain the following based on the associativity and precedence rules of the involved operators

```haskell
2 ^ 2 * 4 ^ 5 + 1
== (2 ^ 2) * (4 ^ 5) + 1
== ((2 ^ 2) * (4 ^ 5)) + (1)
```

=> På samme måte som man evaluerer multiplikasjoner _før_ man legger sammen ting, evaluerer man eksponenter før man evaluerer multiplikasjoner. Derfor evalueres eksponentene først, deretter multiplikasjonene, og så addisjonene.
