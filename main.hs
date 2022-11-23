data Tree = 
      Leaf {
        name :: String, 
        lat :: Double,
        long :: Double
        }
    | Node { 
        self :: Tree,
        nw :: Tree,
        ne :: Tree,
        sw :: Tree,
        se :: Tree
        }
    | Empty
    deriving Show

pointDist :: Double -> Double -> Double -> Double -> Double
pointDist x1 x2 y1 y2 = sqrt(((x2-x1)^2) + ((y2 - y1)^2))

searchDistance :: Double -> Double -> Double -> Tree -> [String]
searchDistance _ _ _ Empty = []
searchDistance d x y (Leaf namel latl longl) =
    if d >= (pointDist latl x longl y)
        then [namel]
    else []
searchDistance d x y (Node l nws nes sws ses) = 
    [] ++ searchDistance d x y l ++ searchDistance d x y nws ++ searchDistance d x y nes ++ searchDistance d x y sws ++ searchDistance d x y ses 

searchDistanceCity :: Double -> Tree -> Tree -> [String]
searchDistanceCity _ _ Empty = []
searchDistanceCity d (Leaf name1 lat1 long1) (Leaf name2 lat2 long2) =
    if d >= (pointDist lat2 lat1 long2 long1)
        then [name2]
    else []
searchDistanceCity d pivot (Node l nws nes sws ses) = 
    [] ++ searchDistanceCity d pivot l ++ searchDistanceCity d pivot nws ++ searchDistanceCity d pivot nes ++ searchDistanceCity d pivot sws ++ searchDistanceCity d pivot ses 




main :: IO ()
main = do
    let tree = Node{
                        self = Leaf 
                        {
                            name  = "Louisville",
                            lat = 38, 
                            long = 85
                        },
                        nw = Leaf {                 --NW RAIZ
                            name = "Chicago",
                            lat = 41,
                            long = 87},
                        ne = Node                   --NE RAIZ
                        {
                            self = Leaf 
                            {
                                name = "Washington",
                                lat = 38,
                                long = 77
                            },
                            nw = Node                   --NW Wash
                            {
                                self = Leaf 
                                {
                                    name = "Pittsburgh",
                                    lat = 40, 
                                    long = 79
                                },
                                nw = Leaf {name = "Cleavland", lat = 41, long = 81}, --NW Pitt
                                ne = Empty,                   --NE Pitt
                                sw = Leaf{ name = "Dayton", lat = 39, long = 84},    --SW Pitt
                                se = Empty                   --SE Pitt
                            },
                            ne = Node                  --NE Wash 
                            {
                                self = Leaf 
                                {
                                    name = "New York", 
                                    lat = 40,
                                    long = 74
                                },
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
    let newCity = Leaf "Goianinha" 38 85
    let l = searchDistance 6 36 82 tree
    let l2 = searchDistanceCity 5 newCity tree
    print l
    print l2


