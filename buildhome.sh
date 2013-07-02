#!/bin/sh
rm glasshome-modded.apk
apktool b glasshome glasshome-unsigned.apk
7z -tzip a glasshome-unsigned.apk com >/dev/null
./dosignapk.sh glasshome-unsigned.apk
zipalign -v 4 glasshome-unsigned.apk glasshome-modded.apk >/dev/null
adb install -r glasshome-modded.apk
