data Group = Group {
    idf :: Int,
    name :: String,
    point :: (Int, Int),
    nw :: Maybe Group,
    ne :: Maybe Group,
    sw :: Maybe Group,
    se :: Maybe Group
} deriving Show

-- Aux func
initG idf name (lat, long) = Group idf name (lat, long) Nothing Nothing Nothing Nothing
getLat (Group _ _ p _ _ _ _) = fst p
getLong (Group _ _ p _ _ _ _) = snd p

main = do
    let gList = []
    let g1 = initG 1 "Louisville" (38, 85)
    let g2 = initG 2 "Chicago" (41, 87)
    let gList = g1 : g2 : []
    let hd = head gList
    print $ name hd
