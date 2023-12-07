{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_assign2_haskell (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/blab/Documents/School/CS420/assignment2/Assign2/.stack-work/install/x86_64-linux-tinfo6/8bc4ec77efa434710acebc906718ead1f5060bb874038cffdc1cea51ff1ac688/8.10.7/bin"
libdir     = "/home/blab/Documents/School/CS420/assignment2/Assign2/.stack-work/install/x86_64-linux-tinfo6/8bc4ec77efa434710acebc906718ead1f5060bb874038cffdc1cea51ff1ac688/8.10.7/lib/x86_64-linux-ghc-8.10.7/assign2-haskell-0.1.0.0-5jgosrc5dSdD3IIQRh9Ksx"
dynlibdir  = "/home/blab/Documents/School/CS420/assignment2/Assign2/.stack-work/install/x86_64-linux-tinfo6/8bc4ec77efa434710acebc906718ead1f5060bb874038cffdc1cea51ff1ac688/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/home/blab/Documents/School/CS420/assignment2/Assign2/.stack-work/install/x86_64-linux-tinfo6/8bc4ec77efa434710acebc906718ead1f5060bb874038cffdc1cea51ff1ac688/8.10.7/share/x86_64-linux-ghc-8.10.7/assign2-haskell-0.1.0.0"
libexecdir = "/home/blab/Documents/School/CS420/assignment2/Assign2/.stack-work/install/x86_64-linux-tinfo6/8bc4ec77efa434710acebc906718ead1f5060bb874038cffdc1cea51ff1ac688/8.10.7/libexec/x86_64-linux-ghc-8.10.7/assign2-haskell-0.1.0.0"
sysconfdir = "/home/blab/Documents/School/CS420/assignment2/Assign2/.stack-work/install/x86_64-linux-tinfo6/8bc4ec77efa434710acebc906718ead1f5060bb874038cffdc1cea51ff1ac688/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "assign2_haskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "assign2_haskell_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "assign2_haskell_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "assign2_haskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "assign2_haskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "assign2_haskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
