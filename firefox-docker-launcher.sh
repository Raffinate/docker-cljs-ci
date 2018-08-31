#!/usr/bin/env sh

Xvfb :0 -screen 0 1920x1080x24 -ac +extension GLX +render -noreset &
DISPLAY=:0.0 firefox $@
killall Xvfb
