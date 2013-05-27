#!/bin/sh
rm glassmaps-modded.apk
apktool b glassmaps glassmaps-unsigned.apk
7z -tzip a glassmaps-unsigned.apk com
./dosignapk.sh glassmaps-unsigned.apk
zipalign -v 4 glassmaps-unsigned.apk glassmaps-modded.apk
adb install -r glassmaps-modded.apk
