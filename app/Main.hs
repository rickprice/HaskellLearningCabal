module Main where

-- import HaskellSay (haskellSay)
import Database.HDBC
import Database.HDBC.Sqlite3

add a b = a + b

main :: IO ()
main =
    do
        putStrLn "About to open sqlite database test1.db"
        conn <- connectSqlite3 "test1.db"
        putStrLn "Creating a table"
        run conn "CREATE TABLE IF NOT EXISTS test (id INTEGER NOT NULL, desc VARCHAR(80))" []
        putStrLn "Inserting data"
        run conn "INSERT INTO test (id) VALUES (0)" []
        putStrLn "Commiting"
        commit conn
        putStrLn "Disconnecting"
        disconnect conn

