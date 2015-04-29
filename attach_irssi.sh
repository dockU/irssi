#!/bin/bash

if [ -z "$STY" ]; then
    screen -list | grep 'There is a screen on' > /dev/null
    if [ $? -ne 0 ]; then
        screen -U -S irssi irssi
        exit 0
    fi

    screen -list | grep 'Attached' > /dev/null
    if [ $? -ne 0 ]; then
        screen -dr irssi
        exit 0
    fi

    screen -x irssi
    exit 0
fi
