data Group = Empty | Group {
    idf :: Int,
    name :: String,
    point :: (Int, Int),
    nw :: Group,
    ne :: Group,
    sw :: Group,
    se :: Group
} deriving Show

-- Aux func
initG idf name (lat, long) = Group idf name (lat, long) Empty Empty Empty Empty
getLat (Group _ _ p _ _ _ _) = fst p
getLong (Group _ _ p _ _ _ _) = snd p

main = do
    let gList = []
    let g1 = initG 1 "Louisville" (38, 85)
    let g2 = initG 2 "Chicago" (41, 87)
    let g3 = initG 3 "Washington" (38, 77)
    let g4 = initG 4 "Nashville" (36, 87)
    let g5 = initG 5 "Atlanta" (34, 84)
    let g6 = initG 6 "Pittsburgh" (40, 79)
    let g7 = initG 7 "New York" (40, 74)
    let g8 = initG 8 "Cleveland" (41, 81)
    let g9 = initG 9 "Dayton" (39, 84)
    let g10 = initG 10 "Montreal" (45, 73)
    let gList = g1 : g2 : []
    let hd = head gList
    print $ name hd
