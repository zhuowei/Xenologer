#!/bin/sh
rm glasshome-modded.apk
apktool b glasshome glasshome-unsigned.apk
7z -tzip a glasshome-unsigned.apk com
./dosignapk.sh glasshome-unsigned.apk
zipalign -v 4 glasshome-unsigned.apk glasshome-modded.apk
adb install -r glasshome-modded.apk
