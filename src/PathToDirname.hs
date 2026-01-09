-- | Extracts directory names from file paths read from stdin.
module PathToDirname (
    -- * Main functions
    run,
) where

import System.FilePath (takeDirectory)
import System.IO (isEOF)

-- | Indicates if end-of-file has been reached.
newtype IsEof = IsEof {isEof :: Bool}

-- | Reads paths from stdin, extracts directory names, and prints them to stdout.
stdin2path2dirname2stdout :: IsEof -> IO ()
stdin2path2dirname2stdout (IsEof True) = return ()
stdin2path2dirname2stdout (IsEof False) = do
    path :: String <- getLine
    let dir :: String = takeDirectory path
    putStrLn dir
    eof :: Bool <- isEOF
    stdin2path2dirname2stdout (IsEof eof)

-- | Main entry point to process paths from stdin.
run :: IO ()
run = do
    eof :: Bool <- isEOF
    stdin2path2dirname2stdout (IsEof eof)
