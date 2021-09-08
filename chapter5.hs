--内包表記

-- [x^2 | x <- [1..5]]

concat :: [[a]] -> [a]
concat xss = [x | xs <- xss, x <- xs]

firsts :: [(a, b)] -> [a]
firsts ps = [x | (x, _) <- ps]

length :: [a] -> Int
length xs = sum [1 | _ <- xs]

-- ガードの利用
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

prime :: Int -> Bool
prime n = factors n == [1, n]

primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]

find :: Eq a => a -> [(a, b)] -> [b]
find k t = [v | (k',v) <- t, k == k']

-- zipの利用
pairs :: [a] -> [(a, a)]
pairs xs = zip xs (tail xs)

sorted :: Ord a => [a] -> Bool
sorted xs = and [x <= y | (x, y) <- pairs xs]

positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (x', i) <- zip xs [0..], x == x']

-- 文字列
-- `"abc" :: String` は `['a', 'b', 'c'] :: [Char]` の略記法
lowers :: String -> Int
lowers xs = Main.length [x | x <- xs, x >= 'a' && x <= 'z']

count :: Char -> String -> Int
count x xs = Main.length [x' | x' <- xs, x == x']
