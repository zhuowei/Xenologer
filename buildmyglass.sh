#!/bin/sh
rm myglass-modded.apk
apktool b myglass myglass-unsigned.apk
./dosignapk.sh myglass-unsigned.apk
zipalign -v 4 myglass-unsigned.apk myglass-modded.apk
adb install -r myglass-modded.apk
