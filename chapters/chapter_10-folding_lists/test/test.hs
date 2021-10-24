myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f z [] = z
myFoldr f z (x:xs) = f x (myFoldr f z xs)

myScanr :: (a -> b -> b) -> b -> [a] -> [b]
myScanr f z [] = [z]
myScanr f z (x:xs) = 
    let restOfScan = myScanr f z xs
        headOfScan = head restOfScan in
    f x headOfScan : restOfScan

myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl f acc [] = acc
myFoldl f acc (x:xs) = myFoldl f (f acc x) xs

myScanl :: (b -> a -> b) -> b -> [a] -> [b]
myScanl f acc [] = [acc]
myScanl f acc (x:xs) =
    let restOfScan = myScanl f (f acc x) xs in
    acc : restOfScan