import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Actions.Volume

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
        manageHook = manageDocks <+> manageHook defaultConfig,
        layoutHook = avoidStruts  $  layoutHook defaultConfig,
        logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        },
        modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [
            ((mod4Mask .|. shiftMask, xK_z), spawn "dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock"),
            ((mod4Mask .|. shiftMask, xK_s), spawn "/home/daniel/bin/suspend_and_lock"),
            ((controlMask, xK_Print), spawn "sleep 0.2; scrot -d 1"),
            ((mod4Mask, xK_Print), spawn "sleep 0.2; scrot screen_%Y-%m-%d-%H-%M-%S.png -d 1"),
            ((mod4Mask .|. controlMask, xK_Print), spawn "sleep 0.2; scrot window_%Y-%m-%d-%H-%M-%S.png -d 1 -u"),
            ((mod4Mask, xK_F3), toggleMute    >> return ()),
            ((mod4Mask, xK_F5), spawn "rhythmbox-client --volume-down"),
            ((mod4Mask, xK_F6), spawn "rhythmbox-client --volume-up"),
            ((mod4Mask, xK_equal), spawn "rhythmbox-client --next"),
            ((0, xK_Print), spawn "scrot")
        ]

