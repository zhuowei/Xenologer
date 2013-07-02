#!/bin/sh
rm glassbrowser-modded.apk
apktool b glassbrowser glassbrowser-unsigned.apk
7z -tzip a glassbrowser-unsigned.apk com >/dev/null
./dosignapk.sh glassbrowser-unsigned.apk
zipalign -v 4 glassbrowser-unsigned.apk glassbrowser-modded.apk >/dev/null
adb install -r glassbrowser-modded.apk
