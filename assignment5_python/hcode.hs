import System.Environment

subtract1 :: [Int] -> [Int]
subtract1 [] = []
subtract1 (x:xs) = x-1 : subtract1 xs

main :: IO ()
main = do
    args <- getArgs
    let numbers = map read args :: [Int]
        result = subtract1 numbers
        output = unwords (map show result)
    putStrLn output
