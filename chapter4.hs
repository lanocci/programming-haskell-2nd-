-- conditions and guards
abs :: Int -> Int
abs n = if n >= 0 then n else -n

absWithGuard n | n >= 0 = n
               | otherwise = -n

signum :: Int -> Int
signum n = if n < 0 then -1 else
             if n == 0 then 0 else 1

signumWithGuard n | n < 0 = -1
                  | n == 0 = 0
                  | otherwise = 1

-- pattern match
not :: Bool -> Bool
not False = True
not True = False

-- (&&) :: Bool -> Bool -> Bool
-- True && b = b
-- False && _ = False

-- b && c | b == c = b
--        | otherwise = False
-- 
-- tuple pattern
fst :: (a, b) -> a
fst (x, _) = x

snd :: (a, b) -> b
snd (_, y) = y


-- list pattern
test :: [Char] -> Bool
test ['a',_,_] = True
test _ = False

-- cons 演算子 `:`
-- [1,2,3]
-- = 1 : [2,3]
-- = 1 : 2 : [3]
-- = 1 : 2 : 3 : []

-- test関数は以下のように定義すると、任意の長さのリストに対応できる
test2 :: [Char] -> Bool
test2 ('a' : _) = True
test2 _ = False

-- head :: [a] -> a
-- head (x : _) = x

-- tail :: [a] -> [a]
-- tail (_ : xs) = xs

-- lambda
-- \x -> x + x
-- (\x -> x + x) 2 ... 4

add :: Int -> Int -> Int
add x y = x + y

-- 型注釈と関数の定義が同じ形になる
addWithLambda :: Int -> (Int -> Int)
addWithLambda = \x -> (\y -> x + y)

-- 関数を返す関数の定義がわかりやすくなる
const :: a -> b -> a
const x _ = x

constWithLambda :: a -> (b -> a)
constWithLambda x = \_ -> x


-- 一度しか参照されない関数に名前をつけることを避けることができる
odds :: Int -> [Int]
odds n = map f [0..n-1]
         where f x = x*2 + 1

oddsWithLambda :: Int -> [Int]
oddsWithLambda n = map (\x -> x*2 + 1) [0..n-1]

-- section
-- #を演算子とすると、引数x, yに対し、(#), (x #), (# y) はセクションと呼ばれる
-- (#) = \x -> (\y -> x # y)
-- (x #) = \y -> x # y
-- (# y) = \x -> x # y
-- (+) :: Int -> Int -> Int
-- (+) = \x -> (\y -> x + y)


-- practice
-- 1
halve :: [a] -> ([a], [a])
halve x = (take (length x `div` 2) x, drop (length x `div` 2) x)

-- 2 a
thirdA ::[a] -> a
thirdA x = head (tail (tail x))

-- 2 b
thirdB :: [a] -> a
thirdB x = x !! 2

-- 2 c
thirdC :: [a] -> a
thirdC (_ : _ : x : _) = x

-- 3 a
safetailA :: [a] -> [a]
safetailA xs = if null xs then [] else drop 1 xs

-- 3 b
safetailB :: [a] -> [a]
safetailB xs | null xs = []
             | otherwise = drop 1 xs

-- 3 c
safetailC :: [a] -> [a]
safetailC (_ : xs) = xs
safetailC [] = []

-- 4
(||) :: Bool -> Bool -> Bool
True || False = True
True || True = True
False || True = True
False || False = False

False || False = False
_ || _ = True

False || b = b
True || _ = True

a || b | a == b = a
       | otherwise = True

-- 5
-- (&&) :: Bool -> Bool -> Bool
-- (&&) x y = if x == True then
--                if y == True then True
--                else False
--            else False

-- 6
(&&) :: Bool -> Bool -> Bool
(&&) x y = if x == True then y
           else False

-- 7
mult :: Int -> (Int -> (Int -> Int))
mult = \x -> (\y -> (\z -> x * y * z))

-- 8
luhnDouble :: Int -> Int
luhnDouble x | x + x > 9 = x + x - 9
             | otherwise = x + x
luhn :: Int -> Int -> Int -> Int -> Bool
luhn w x y z = (sum ((map (\i -> luhnDouble i) [w, y]) ++ [x, z])) `mod` 10 == 0
