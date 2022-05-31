{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_gen_shutdown_program (
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

bindir     = "/home/rafael/Git/gen-shutdown-program/.stack-work/install/x86_64-linux-tinfo6/951f907bfae0cdf21227cdb7c328da2472d0fddb6daed508d390fb10dc9e5a03/9.0.2/bin"
libdir     = "/home/rafael/Git/gen-shutdown-program/.stack-work/install/x86_64-linux-tinfo6/951f907bfae0cdf21227cdb7c328da2472d0fddb6daed508d390fb10dc9e5a03/9.0.2/lib/x86_64-linux-ghc-9.0.2/gen-shutdown-program-0.1.0.0-JYlJi16QNAjIphNAaQ11FB-gen-shutdown-program-exe"
dynlibdir  = "/home/rafael/Git/gen-shutdown-program/.stack-work/install/x86_64-linux-tinfo6/951f907bfae0cdf21227cdb7c328da2472d0fddb6daed508d390fb10dc9e5a03/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/rafael/Git/gen-shutdown-program/.stack-work/install/x86_64-linux-tinfo6/951f907bfae0cdf21227cdb7c328da2472d0fddb6daed508d390fb10dc9e5a03/9.0.2/share/x86_64-linux-ghc-9.0.2/gen-shutdown-program-0.1.0.0"
libexecdir = "/home/rafael/Git/gen-shutdown-program/.stack-work/install/x86_64-linux-tinfo6/951f907bfae0cdf21227cdb7c328da2472d0fddb6daed508d390fb10dc9e5a03/9.0.2/libexec/x86_64-linux-ghc-9.0.2/gen-shutdown-program-0.1.0.0"
sysconfdir = "/home/rafael/Git/gen-shutdown-program/.stack-work/install/x86_64-linux-tinfo6/951f907bfae0cdf21227cdb7c328da2472d0fddb6daed508d390fb10dc9e5a03/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "gen_shutdown_program_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "gen_shutdown_program_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "gen_shutdown_program_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "gen_shutdown_program_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "gen_shutdown_program_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "gen_shutdown_program_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
