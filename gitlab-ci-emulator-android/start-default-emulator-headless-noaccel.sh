#!/bin/bash

echo "Starting default emulator"
$ANDROID_HOME/emulator/emulator-headless @default -verbose -no-accel -gpu swiftshader_indirect 2>&1 &

EMU_BOOTED="no"
while [[ ${EMU_BOOTED} != *"stopped"* ]]; do
    echo "Wating for emulator booted..."
    sleep 5
    EMU_BOOTED=$(adb shell getprop init.svc.bootanim || echo "no")
done

echo "Emulator booted"
