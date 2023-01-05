#!/usr/bin/env bash

while true ; do
    DISPLAY_RES=$(xrandr | grep +)
    if [ "$DISPLAY_RES" != "$DISPLAY_RES_LAST" ]; then
        DISPLAY_NAME=$(xrandr | awk '/ connected/{print $1; exit; }')
        for i in {1..4}; do
            xrandr --output "$DISPLAY_NAME" --auto
            sleep 0.5
        done
    done
    DISPLAY_RES_LAST=$DISPLAY_RES
    sleep 1
done
