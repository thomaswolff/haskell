myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f z [] = z
myFoldr f z (x:xs) = f x (myFoldr f z xs)

myScanr :: (a -> b -> b) -> b -> [a] -> [b]
myScanr f z [] = [z]
myScanr f z (x:xs) = 
    let nextScan = myScanr f z xs in
    case nextScan of
    [] -> [f x z]
    (h:_) -> f x h : nextScan

myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl f acc [] = acc
myFoldl f acc (x:xs) = myFoldl f (f acc x) xs

myScanl :: (b -> a -> b) -> b -> [a] -> [b]
myScanl f acc [] = [acc]
myScanl f acc (x:xs) =
    let nextScan = myScanl f (f acc x) xs in
    case nextScan of
    [] -> [f acc x]
    (h:tail) -> acc : nextScan