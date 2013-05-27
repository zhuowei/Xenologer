#!/bin/sh
for aaa in *-modded.apk
do
adb install -r $aaa
done
