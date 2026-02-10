module Main where
    -- bundle of operations on expressions
    class ExprOps e where
        eval :: e -> Int
        pretty :: e -> String

    -- concrete expression types
    data Literal = Literal Int
    data Add = Add Int Int

    -- operations for Literal
    instance ExprOps Literal where
        eval :: Literal -> Int
        eval (Literal n) = n

        pretty :: Literal -> String
        pretty (Literal n) = show n

    -- operations for Add
    instance ExprOps Add where
        eval :: Add -> Int
        eval (Add x y) = x + y

        pretty :: Add -> String
        pretty (Add x y) = show x ++ " + " ++ show y

    -- helper tests
    assert :: Bool -> String -> IO ()
    assert True _ = return ()
    assert False msg = error ("Assertion failed: " ++ msg)

    main :: IO ()
    main = do
        let l1 = Literal 7
        let l2 = Literal 3
        let a1 = Add 4 5
        let a2 = Add (eval l1) (eval l2)

        putStrLn $ "literal eval (7) = " ++ show (eval l1)
        putStrLn $ "literal pretty = " ++ pretty l1

        assert (eval l1 == 7) "literal eval should be 7"
        assert (pretty l1 == "7") "Literal pretty should be \"7\""

        putStrLn "All checks passed."