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

(&&) :: Bool -> Bool -> Bool
True && b = b
False && _ = False

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

head :: [a] -> a
head (x : _) = x

tail :: [a] -> [a]
tail (_ : xs) = xs

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
