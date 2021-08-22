addNormal :: (Int, Int) -> Int
addNormal (x, y) = x + y

addCurry :: Int -> (Int -> Int)
-- addCurry :: Int -> Int -> Int
-- 型定義は右結合だから括弧を省略可能
addCurry x y = x + y

{- add3 = addCurry 3
 - のように部分適用して便利な部分関数を作成することができる柔軟性がある -}

multCurry :: Int -> (Int -> (Int -> Int))
multCurry x y z = x * y * z

{- Polymorphism

length [1, 2, 3]
length ["Yes", "No"]
length [sin, cos, tan]
-}

{- Overload

 (+) :: Num a => a -> a-> a
1 + 2
1.0 + 2. 0

-}

{- Eq Type Class
 - (==) :: a -> a -> Bool
 - (\=) :: a -> a -> Bool
-}

{- Ord Type Class
 - (<) :: a -> a -> Bool
 - (>) :: a -> a -> Bool
 - (<=) :: a -> a -> Bool
 - (>=) :: a -> a -> Bool
 - min :: a -> a -> Bool
 - max :: a -> a -> Bool
 -}

{- Show Type Class
 - show :: a -> String
 -}

{- Read type Class
 - read :: String -> String
 -}

-- practice
bools :: [Bool]
bools = [True, False]

nums :: [[Int]]
nums = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

add :: Int -> Int -> Int -> Int
add x y z = x + y + z

copy :: a -> (a, a)
copy x = (x, x)

apply :: (a -> b) -> a -> b
apply x n= x n

second :: [a] -> a
second xs = head (tail xs)

swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)

pair :: a -> b -> (a, b)
pair x y = (x, y)

double :: Num a => a -> a
double x = x * 2

palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (a -> a) -> a -> a
twice f x = f (f x)
