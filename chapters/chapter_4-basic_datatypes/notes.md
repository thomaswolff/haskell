# Chapter 4 - Basic Datatypes

## Hvordan definere datatype

```haskell
data Bool = False | True
```

- `data` - keyword
- `Bool` - typekonstruktør (bruker aldri denne med mindre man definerer en typekonstruktør)
- `False | True` - datakonstruktør
- `|` - sumtype/union type

### Funksjoner

- `:info Bool` - info om typen `Bool`
- `:info False` - info om verdien `False`
- `:t False` - typen til en verdi

### Sidenote

`data Mood = Blah | Woot deriving Show` - `deriving Show` gjør at man kan skrive ut verdier av typen `Mood`

## Sammenlikning

`/=` er "ikke lik"
