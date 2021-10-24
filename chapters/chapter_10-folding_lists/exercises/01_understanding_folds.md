# Understanding folds

## 1 - foldr (*) 1 [1..5]

```haskell
foldr (*) 1 [1..5]
```

- a) `flip (*) 1 [1..5]` -> Kompilerer ikke
- b) `foldl (flip (*)) 1 [1..5]` -> Ettersom (*) er assosiativ vil hverken flip eller foldl endre resultatet. Derfor er b) lik det opprinnelige uttrykket.
- c) `foldl (*) 1 [1..5]` -> Av samme grunn som b), vil c) også returnere samme verdi som det opprinnelige uttrykket

## 2 - Evaluation steps

```haskell
foldl (flip (*)) 1 [1..3]
```

```txt
  foldl (flip (*)) 1 [1..3]
= foldl (*) 1 [1..3]
= foldl (*) 1 [1,2,3]
= foldl (*) ((*) 1 1) [2,3]
= foldl (*) ((*) ((*) 1 1) 2) [3]
= foldl (*) ((*) ((*) ((*) 1 1) 2) 3) []
= (*) ((*) ((*) 1 1) 2) 3
= ((1*1)*2)*3
= (1*2)*3
= 2*3
= 6
```

## 3 - difference between `foldr` and `foldl`

- a) foldr, but not foldl, traverses the spine of a list from right to left. -> Feil. Begge traverserer ryggraden i samme rekkefølge. I tillegg traverserer de fra venstre mot høyre.
- b) foldr, but not foldl, always forces the rest of the fold. -> Feil. Det kommer an på funksjonen som er oppgitt som første argument til `foldr`.
- c) foldr, but not foldl, associates to the right. -> Riktig. `foldr` assosierer mot høyre, mens `foldl` assosierer mot venstre.
- d) foldr, but not foldl, is recursive. -> Feil. Begge er rekursive.

## 4 - Folds are catamorphisms, which means they are generally used to

- a) Reduce structure. -> Riktig.
- b) Expand structure. -> Ikke i utgangspunktet, men man _kan_ bruke "folds" til det.
- c) Render you catatonic. -> 🤯
- d) Generate infinite data structures. -> Ikke i utgangspunktet, men man _kan_ bruke "folds" til det.

## 5 - Fix folds

### a

```haskell
foldr (++) ["woot", "WOOT", "woot"]
```

Mangler andre argument, "zero case"-verdi. "Zero case"-verdien `z` er vanligvis identiteten til funksjonen `f` som oppgis til `foldr`. Ettersom `f` i dette tilfellet er `(++)`, vil en naturlig "zero case"-verdi være `""`, eller `[]`, slik:

```haskell
foldr (++) "" ["woot", "WOOT", "woot"]
foldr (++) [] ["woot", "WOOT", "woot"]
```

### b

```haskell
foldr max [] "fear is the little death"
```

`max` tar inn to verdier av samme type, hvor typen må ha en instans av `Ord`. Listen som oppgis til `foldr` i dette tilfellet er av typen `[Char]`. Dvs. at hvert element i listen er `Char`. "zero case"-verdien som er oppgitt er `[]`. Både `Char` og `[]` har instanser av `Ord`, men de er ikke av samme type. Derfor er ikke dette uttrykket gyldig. Vi kan enten fikse det ved å oppgi en `Char` som "zero case"-verdi, eller så må vi endre input-listen til å være en liste av strenger istedenfor. Hvilket alternativ man går for avhenger av semantikken til det man ønsker å oppnå.

#### Alternativ 1

```haskell
foldr max 'a' "fear is the little death"
```

#### Alternativ 2

```haskell
foldr max [] ["fear", "is", "the", "little", "death"]
```

### c

```haskell
foldr and True [False, True]
```

`and` tar inn en `Foldable`, og returnerer om alle elementene i `Foldable`-verdien er `True`. Ettersom `foldr` forventer en funksjon som tar inn to argumenter, kan ikke `and` brukes. Man kan imidlertid bruke `(&&)`, slik:

```haskell
foldr (&&) True [False, True]
```

### d

```haskell
foldr (||) True [False, True]
```

Dette uttrykket returnerer alltid `True`, ettersom "zero case"-verdien er `True`. Da vil første evaluering av `(||)` være `(||) _ True`, som alltid vil være `True`. Uavhengig av hva verdiene i den oppgitte listen er, vil uttrykket alltid bli `True`.

Ettersom det ikke er oppgitt hva ønsket funksjonalitet er, er det ikke noe "rett" svar på denne oppgaven, men dersom man ønsker et uttrykk som sier om _noen_ av elementene i lista er `True` kan man oppgi `False` som "zero case"-verdi istedenfor, slik:

```haskell
foldr (||) False [False, True]
```

### e

```haskell
foldl ((++) . show) "" [1..5]
```

`(++) . show` har typen `Show a => a -> [Char] -> [Char]`.
`foldl` forventer en funksjon `b -> a -> b`, hvor `a` er typen til elementene i lista, og `b` er typen til `acc`. `(++) . show` oppfyller ikke kravene til `foldl`.

```haskell
foldl (\x y -> x ++ show y) "" [1..5]
```

### f

```haskell
foldr const 'a' [1..5]
```

Minner om `foldr` sin signatur: `foldr :: (a -> b -> b) -> b -> [a] -> b`.

`const` har signatur: `const :: a -> b -> a`.

Det medfører at `a` i dette tilfellet er `Num` og `Enum` (elementene i lista), mens `b` er `Char` ("zero case"-verdien).

Gitt at vi skal beholde `'a'` og `[1..5]` som input, må vi bytte om rekkefølgen på parameter-typene til `const`. Det kan vi gjøre ved bruk av `flip`, slik:

```haskell
foldr (flip const) 'a' [1..5]
```

### g

```haskell
foldr const 0 "tacos"
```

Samme som over, bare med andre typer:

```haskell
foldr (flip const) 0 "tacos"
```

### h

```haskell
foldl (flip const) 0 "burritos"
```

Samme argument som over, bare motsatt.

```haskell
foldl const 0 "burritos"
```

### i

```haskell
foldl (flip const) 'z' [1..5]
```

```haskell
foldl const 'z' [1..5]
```
