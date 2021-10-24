import Data.Time
import GHC.Exts.Heap (GenClosure(dataArgs))

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
    [ DbDate (UTCTime 
                (fromGregorian  1911 5 1) 
                (secondsToDiffTime  34123))
    , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime
                (fromGregorian 1921 5 1)
                (secondsToDiffTime 34123))
    ]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate databaseItems =
    foldr dbDateFilter [] databaseItems
    where dbDateFilter dbItem dates =
            case dbItem of
            DbDate d -> d : dates
            _ -> dates

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber databaseItems =
    foldr dbNumberFilter [] databaseItems
    where dbNumberFilter dbItem numbers =
            case dbItem of
            DbNumber n -> n : numbers
            _ -> numbers

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent databaseItems =
    foldr max minDate $ filterDbDate databaseItems
    where
        minDate = UTCTime (fromGregorian 0 1 1) (secondsToDiffTime 0)

sumDb :: [DatabaseItem] -> Integer
sumDb databaseItems =
    foldr (+) 0 $ filterDbNumber databaseItems

avgDb :: [DatabaseItem] -> Double
avgDb databaseItems =
    sum/count
    where
        sum = fromIntegral $ sumDb databaseItems
        count = fromIntegral $ length $ filterDbNumber databaseItems
          