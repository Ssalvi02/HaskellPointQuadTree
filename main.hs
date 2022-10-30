import Foreign.Ptr

-- AKA => Point
data City = City { 
    name :: String,
    id :: Int,
    x :: Int,
    y :: Int
} deriving (Show)

-- Nó para armazenar objetos
data Node = Node {
    c :: City,
    mem :: Int
} deriving (Show)

-- Quadtree
data Qtree = Qtree {
    -- fronteiras do nó
    top_left :: City,
    bot_right :: City,

    -- detalhes do nó
    n :: Ptr Node,

    -- filhos da arvore
    top_lt :: Ptr Qtree,
    top_rt :: Ptr Qtree,
    bot_lt :: Ptr Qtree,
    bot_lr :: Ptr Qtree

}



main = do
    let c1 = City "Louisville" 1 38 85
    let n1 = Node c1 23
    print $ mem n1