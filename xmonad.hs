import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

import XMonad.Hooks.EwmhDesktops

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Util.SpawnOnce

main :: IO ()
main = xmonad . ewmhFullscreen . ewmh . xmobarProp $ myConfig

myConfig = def
    { terminal = "alacritty"
    , startupHook = myStartupHook
    , focusedBorderColor = "#83adad"
    }

myStartupHook :: X ()
myStartupHook = do
    spawnOnce "bash ~/.xinitrc"
 
