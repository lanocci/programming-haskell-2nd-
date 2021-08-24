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
