--- IMPORTS ---
import XMonad
import Data.Monoid
import System.Exit

import System.IO
--- UTILS ---
import XMonad.Hooks.ManageDocks --- for xmobar
import XMonad.Layout.Spacing --- for spacing between windows

-- FOR FN KEYS
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog

import XMonad.Actions.SpawnOn
import XMonad.Util.SpawnOnce
import XMonad.Util.Run

--- OTHER IMPORTS ---
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "alacritty"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
--
myBorderWidth   = 2  

xmobarShowHide (XConfig {modMask = modKey}) = (modKey, xK_b)
myStatusBar = "xmobar /home/avi/.config/xmobar/.xmobarrc"
main = xmonad =<< statusBar myStatusBar myXmobarPP xmobarShowHide defaults

myXmobarPP =  xmobarPP
  { ppCurrent = xmobarColor "#f8f0f0" "" . wrap "[" "]"  -- currently focused workspace
  , ppHidden = xmobarColor "#82daff" "" . wrap "[" "]"
  , ppHiddenNoWindows = xmobarColor "#8288aa" "" .wrap "[" "]"
  , ppTitle   = xmobarColor "#FF4A36" "" . shorten 15   -- title of currently focused program
  , ppOrder = \(ws:_:_:_) -> [ws]
  , ppWsSep = " "
  -- ...
  }
  
myStartupHook = do
 spawnOnce "nitrogen --restore &" -- wallpapers
 spawnOnce "picom &" -- compositor
 spawnOnce "redshift -t 6500:3000"

------------------------------------------------------------------------
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = manageSpawn <+> manageHook def,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }

myModMask       = mod1Mask -- Windows/Super key
--
--
-- xmobarEscape = concatMap doubleLts
  -- where
        -- doubleLts '<' = "<<"
        -- doubleLts x   = [x]

myWorkspaces  = ["1:\61728", "2:\61508", "3:\61612", "4:\61441", "5:\61557", "6:\61459"] -- ++ map show [6..9]
-- clickable . map xmobarEscape
		-- where
	        -- clickable l = [ "<action=xdotool key super+" ++ show n ++ ">" ++ ws ++ "</action>" |
                      -- (i,ws) <- zip [1..9] l,
                      -- let n = i ]
                      -- 


-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#000000"
myFocusedBorderColor = "darkorange"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 	-- SLOCK
	[((modm, xK_z), spawn "i3lock -c 000000")]
	++
	-- SLEEP
	[((modm .|. shiftMask, xK_z), spawnHere "systemctl sleep")]
	++
	-- FN KEYS
	[
    -- brightness
	((0, xK_F5), spawn "lux -s 5%") -- down
	, ((0, xK_F6), spawn "lux -a 5%") -- up
	 -- volume
	, ((0, xK_F1), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle") -- mute
    , ((0, xK_F2), spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%") -- vol -
    , ((0, xK_F3), spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%") -- vol +
    -- microphone
    , ((0, xK_F4), spawn "amixer set Capture toggle")
	]
	++
	-- DEFAULT BINDINGS
    [
	-- launch a terminal
	 ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    -- launch dmenu
    , ((modm,               xK_f     ), spawn "rofi -show drun -show-icons")
    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)
     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)
    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)
    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)
    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )
    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )
    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)
    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)
    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_6]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts(tiled ||| Mirror tiled ||| Full)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = spacing 4 $ Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

--myManageHook = composeAll []
myEventHook = mempty

myLogHook = return ()
