#!/usr/bin/env sh


## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -c ~/.config/polybar/config side &
#polybar -c ~/.config/polybar/config center &
#polybar -c ~/.config/polybar/config left &
#polybar -c ~/.config/polybar/config monitor2 &
