#!/bin/bash

check_wifi_status() {
    wifi_status=$(networksetup -getairportpower en0 | awk '{print $4}')
    if [ "$wifi_status" == "On" ]; then
        return 0
    else
        return 1
    fi
}

turn_off_wifi() {
    networksetup -setairportpower en0 off
    echo "WIFI is off!"
}

turn_on_wifi() {
    networksetup -setairportpower en0 on
    echo "WIFI is on!"
}

check_wifi_status
if [ $? -eq 0 ]; then
    turn_off_wifi
else
    turn_on_wifi
fi

