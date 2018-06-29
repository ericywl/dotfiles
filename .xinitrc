#!/bin/bash

xrdb ~/.Xresources
DISPLAY=:0.0 feh --bg-scale /usr/share/wallpapers/Breath/contents/images/2560x1440.png
DISPLAY=:0.1 feh --bg-scale /usr/share/wallpapers/Breath/contents/images/2560x1440.png

# Force KDE environment when running i3
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_PLUGIN_PATH=$HOME/.kde4/lib/kde4/plugins/:/usr/lib/kde4/plugins/
XDG_CURRENT_DESKTOP=KDE
export DESKTOP_SESSION=kde
