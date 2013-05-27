#!/bin/sh
rm glasssetup-modded.apk
apktool b glasssetup glasssetup-unsigned.apk
7z -tzip a glasshome-unsigned.apk com
./dosignapk.sh glasssetup-unsigned.apk
zipalign -v 4 glasssetup-unsigned.apk glasssetup-modded.apk
adb install -r glasssetup-modded.apk
