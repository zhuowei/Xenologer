#!/bin/sh
rm glassvoice-modded.apk
apktool b glassvoice glassvoice-unsigned.apk
#7z -tzip a glassvoice-unsigned.apk com >/dev/null
./dosignapk.sh glassvoice-unsigned.apk
zipalign -v 4 glassvoice-unsigned.apk glassvoice-modded.apk
adb install -r glassvoice-modded.apk
