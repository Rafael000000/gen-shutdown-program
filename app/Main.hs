{-# LANGUAGE OverloadedLabels  #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.GI.Base
import qualified GI.Gtk as Gtk
import System.Directory
import System.Posix.User
import System.Process


main :: IO ()
main = do
  Gtk.init Nothing
 
  home <- getHomeDirectory
  user <- getEffectiveUserName

-- Window

  window <- Gtk.windowNew Gtk.WindowTypeToplevel
  Gtk.setContainerBorderWidth window 10
  Gtk.setWindowTitle window "gen-shutdown-program"
  Gtk.setWindowResizable window False
  Gtk.setWindowDefaultWidth window 750
  Gtk.setWindowDefaultHeight window 225
  Gtk.setWindowWindowPosition window Gtk.WindowPositionCenter
  Gtk.windowSetDecorated window False

-- Images 

  img1 <- Gtk.imageNewFromFile $ home ++ "/Git/gen-shutdown-program/images/system-cancel.png"
  img2 <- Gtk.imageNewFromFile $ home ++ "/Git/gen-shutdown-program/images/system-log-out.png"
  img3 <- Gtk.imageNewFromFile $ home ++ "/Git/gen-shutdown-program/images/system-reboot.png"
  img4 <- Gtk.imageNewFromFile $ home ++ "/Git/gen-shutdown-program/images/system-shutdown.png"
  img5 <- Gtk.imageNewFromFile $ home ++ "/Git/gen-shutdown-program/images/system-suspend.png"
  img6 <- Gtk.imageNewFromFile $ home ++ "/Git/gen-shutdown-program/images/system-hibernate.png"
  img7 <- Gtk.imageNewFromFile $ home ++ "/Git/gen-shutdown-program/images/system-lock-screen.png"

-- Labels

  label1 <- Gtk.labelNew Nothing
  Gtk.labelSetMarkup label1 "<b>Cancel</b>"

  label2 <- Gtk.labelNew Nothing
  Gtk.labelSetMarkup label2 "<b>Logout</b>"

  label3 <- Gtk.labelNew Nothing
  Gtk.labelSetMarkup label3 "<b>Reboot</b>"

  label4 <- Gtk.labelNew Nothing
  Gtk.labelSetMarkup label4 "<b>Shutdown</b>"

  label5 <- Gtk.labelNew Nothing
  Gtk.labelSetMarkup label5 "<b>Suspend</b>"

  label6 <- Gtk.labelNew Nothing
  Gtk.labelSetMarkup label6 "<b>Hibernate</b>"

  label7 <- Gtk.labelNew Nothing
  Gtk.labelSetMarkup label7 "<b>Lock</b>"

-- Buttons

  btn1 <- Gtk.buttonNew
  Gtk.buttonSetRelief btn1 Gtk.ReliefStyleNone
  Gtk.buttonSetImage btn1 $ Just img1
  Gtk.widgetSetHexpand btn1 False
  on btn1 #clicked $ do
    putStrLn "User chose: Cancel"
    Gtk.widgetDestroy window

  btn2 <- Gtk.buttonNew
  Gtk.buttonSetRelief btn2 Gtk.ReliefStyleNone
  Gtk.buttonSetImage btn2 $ Just img2
  Gtk.widgetSetHexpand btn2 False
  on btn2 #clicked $ do
    putStrLn "User chose: Logout"
    callCommand $ "pkill -u " ++ user
    --callCommand "killall xmonad-x86_64-linux"

  btn3 <- Gtk.buttonNew
  Gtk.buttonSetRelief btn3 Gtk.ReliefStyleNone
  Gtk.buttonSetImage btn3 $ Just img3
  Gtk.widgetSetHexpand btn3 False
  on btn3 #clicked $ do
    putStrLn "User chose: Reboot"
    callCommand "reboot"

  btn4 <- Gtk.buttonNew
  Gtk.buttonSetRelief btn4 Gtk.ReliefStyleNone
  Gtk.buttonSetImage btn4 $ Just img4
  Gtk.widgetSetHexpand btn4 False
  on btn4 #clicked $ do
    putStrLn "User chose: Shutdown"
    callCommand "shutdown -h now"

  btn5 <- Gtk.buttonNew
  Gtk.buttonSetRelief btn5 Gtk.ReliefStyleNone
  Gtk.buttonSetImage btn5 $ Just img5
  Gtk.widgetSetHexpand btn5 False
  on btn5 #clicked $ do
    putStrLn "User chose: Suspend"
    callCommand "systemctl suspend"

  btn6 <- Gtk.buttonNew
  Gtk.buttonSetRelief btn6 Gtk.ReliefStyleNone
  Gtk.buttonSetImage btn6 $ Just img6
  Gtk.widgetSetHexpand btn6 False
  on btn6 #clicked $ do
    putStrLn "User chose: Hibernate"
    callCommand "systemctl hibernate"

  btn7 <- Gtk.buttonNew
  Gtk.buttonSetRelief btn7 Gtk.ReliefStyleNone
  Gtk.buttonSetImage btn7 $ Just img7
  Gtk.widgetSetHexpand btn7 False
  on btn7 #clicked $ do
    putStrLn "User chose: Lock"
    --callCommand "slock"
    callCommand "i3lock-fancy -p"

-- Grid

  grid <- Gtk.gridNew
  Gtk.gridSetColumnSpacing grid 10
  Gtk.gridSetRowSpacing grid 10
  Gtk.gridSetColumnHomogeneous grid True

  -- Attach
  #attach grid btn1   0 0 1 1
  #attach grid label1 1 0 1 1
  #attach grid btn2   0 1 1 1
  #attach grid label2 1 1 1 1
  #attach grid btn3   0 2 1 1
  #attach grid label3 1 2 1 1
  #attach grid btn4   2 0 1 1
  #attach grid label4 3 0 1 1
  #attach grid btn5   2 1 1 1
  #attach grid label5 3 1 1 1
  #attach grid btn6   2 2 1 1
  #attach grid label6 3 2 1 1
  #attach grid btn7   4 0 1 1
  #attach grid label7 5 0 1 1

  #add window grid

  Gtk.onWidgetDestroy window Gtk.mainQuit
  #showAll window


  Gtk.main
