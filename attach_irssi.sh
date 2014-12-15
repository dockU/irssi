#!/bin/bash

if [ -z "$STY" ]; then
    screen -list 2>&1 /dev/null
    if [ $? -ne 0 ]; then
        screen -S irssi irssi
    fi

    screen -list | grep 'Attached' 2>&1 /dev/null
    if [ $? -ne 0 ]; then
        screen -dr irssi
    fi

    screen -x irssi
fi
