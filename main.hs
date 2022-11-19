data Tree = Leaf Int String Int Int
    | Node Tree Tree Tree Tree
    deriving Show

height :: Tree -> Int
height (Leaf _ _ _ _) = 1
height (Node nw ne sw se) = 1 + (max (max (height nw) (height ne)) (max (height sw) (height se)))

