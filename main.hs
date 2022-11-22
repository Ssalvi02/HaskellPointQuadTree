import Data.String

data Tree = 
      Leaf {
        name :: String, 
        lat :: Integer,
        long :: Integer}
    | Node { 
        name :: String  ,
        lat :: Integer, 
        long:: Integer,
        nw :: Tree,
        ne :: Tree,
        sw :: Tree,
        se :: Tree}
    | Empty
    deriving Show

main = do
    let maintree = Node{
                        name  = "Louisville",
                        lat = 38, 
                        long = 85,
                        nw = Leaf {         --NW RAIZ
                            name = "Chicago",
                            lat = 41,
                            long = 87},
                        ne = Node                   --NE RAIZ
                        {
                            name = "Washington",
                            lat = 38,
                            long = 77,
                            nw = Node                   --NW Wash
                            {
                                name = "Pittsburgh",
                                lat = 40, 
                                long = 79,
                                nw = Leaf {name = "Cleavland", lat = 41, long = 81}, --NW Pitt
                                ne = Empty,                   --NE Pitt
                                sw = Leaf{ name = "Dayton", lat = 39, long = 84},    --SW Pitt
                                se = Empty                   --SE Pitt
                            },
                            ne = Node                  --NE Wash 
                            {
                                name = "New York", 
                                lat = 40,
                                long = 74,
                                nw = Empty,                   --NW NY
                                ne = Leaf{name = "Montreal", lat = 45, long = 73},  --NE NY
                                sw = Empty,                   --SW NY
                                se = Empty                   --SE NY
                            },
                            sw = Empty,                   --SW Wash 
                            se = Empty                   --SE Wash 
                        },                  
                        sw = Leaf{name = "Nashville", lat = 36, long = 38}, --SW RAIZ
                        se = Leaf{name = "Atlanta", lat = 34, long = 84}    --SE RAIZ
                    }
    print maintree



