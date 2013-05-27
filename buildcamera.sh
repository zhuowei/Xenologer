#!/bin/sh
rm glasscamera-modded.apk
apktool b glasscamera glasscamera-unsigned.apk
./dosignapk.sh glasscamera-unsigned.apk
zipalign -v 4 glasscamera-unsigned.apk glasscamera-modded.apk
adb install -r glasscamera-modded.apk
