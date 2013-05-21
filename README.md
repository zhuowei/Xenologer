## Xenologer: repackaging Google Glass XE5 APKs to run on other devices

Google Glass's build process is fairly conservative - they don't use hidden APIs often, and when they do, they use reflection. 
Thus, it is relatively easy to repackage the Glass APKs for other devices.

### Modifications to the base APK

The use-library element in AndroidManifest is removed, as it refers to unused code.

com/google/glass/hidden/HiddenViewConfiguration.smali is patched to always return 0xffff instead of calling the nonexistent View.getDeviceTapTimeout

An instructional video (don_doff_background.mov, 8MB) is removed to save space. 

All native libraries required are shipped with the APK, as are all the Glass fonts.

For the camera, instead of calling Camera.open() to get the rear facing camera, Camera.open(0) is called to get the first camera,
 as the Nexus 7 doesn't have a rear camera.

### Install

Download the APK:

Home: http://zhuowei.github.io/Xenologer/glasshome-modded.apk
Camera: http://zhuowei.github.io/Xenologer/glasscamera-modded.apk

Install just like any other boring APK. Google Glass Home doesn't need system privilages, but it might force close less often if it is a system app,
as Google Glass apps frequently try to turn off the screen, causing force closes when they don't have the power permission. 
However, I do not recommend installing these APKs as system APKs, as the Glass apps will attempt to reboot the phone after a force close.

### Credits/License

While I don't have permission from the Glass team to post these, Google Glass is a device for explorers, 
thus, I believe it agrees with the spirit of discovery to post these APKs.

The APK was pulled from Android Police's dump at 
http://www.androidpolice.com/2013/05/08/download-google-glass-xe4-and-xe5-system-dumps-please-do-something-cool-with-these/
