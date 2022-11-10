data Group = Empty | Group {
    idf :: Int,
    name :: String,
    lat :: Int,
    long :: Int,
    nw :: Maybe Group,
    ne :: Maybe Group,
    sw :: Maybe Group,
    se :: Maybe Group
} deriving Show


main = do
    let g1 = Group { idf = 0, name = "Ababa", lat = 32, long = 40, nw = Nothing, ne = Nothing, sw = Nothing, se = Nothing}
    print g1