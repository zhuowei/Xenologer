#!/bin/sh
rm glasshangouts-modded.apk
apktool b glasshangouts glasshangouts-unsigned.apk
7z -tzip a glasshangouts-unsigned.apk com
./dosignapk.sh glasshangouts-unsigned.apk
zipalign -v 4 glasshangouts-unsigned.apk glasshangouts-modded.apk
adb install -r glasshangouts-modded.apk
