double x = x + x
quadruple x = double (double x)

factorial n = product [1..n]
average ns = sum ns `div` length ns

a = b + c
    where
      b = 1 -- 局所定義
      c = 2 -- 局所定義
d = a * 2

-- a = b + c
--     where
--       {b = 1;
--        c = 2};
-- d = a * 2

n = a `div` length xs
    where
      a = 10
      xs = [1, 2, 3, 4, 5]

myLast xs = head (reverse xs)
myLast2 xs = xs !! (length xs - 1)

myInit xs = reverse (tail (reverse xs))
myInit2 xs = take (length xs - 1) xs
