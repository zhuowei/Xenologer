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

Maps: http://zhuowei.github.io/Xenologer/glassmaps-modded.apk

Setup: http://zhuowei.github.io/Xenologer/glassmaps-modded.apk This one's been modified so that instead of scanning a barcode,
it uses the existing Google Account to setup and then force closes.

Install just like any other boring APK. None of the Google Glass apps need system privilages.
I do not recommend installing these APKs as system APKs, as the Glass apps will attempt to reboot the phone after a force close.

### Glass apps that won't be converted

GlassSound.apk: installs and runs without modification. Get a copy from any XE5 system dump. Not essential for Glass; Glass will just run muted without it.

GlassPhotosphere.apk: As stated by http://www.studio8apps.com/running-google-glass-photo-sphere-viewer-on-android-phone/ , runs (for the easter egg) without modification.
Again, any dumped copy from a XE5 should run fine. Not essential to Glass.

### Building these APKs from the modified dump

This area is still quite rough - I would love some help!

These sources are managed with a shell script (because I am not familiar with git submodules).

Run getsrc.sh then one of the build*.sh to build the APK you want. You need to modify them to suit your needs.
In particular, there's a dosignapk.sh script that they call, which signs the APKs with your key. Go to http://developer.android.com/tools/publishing/app-signing.html for details.

You must have APKTool, 7Zip, and the Android SDK in your path.

Finally, note that the build scripts copy the com folder into the resulting APKs, as APKTool is too dumb to get them from the original APK.

### Credits/License

While I don't have permission from the Glass team to post these, Google Glass is a device for explorers, 
thus, I believe it agrees with the spirit of discovery to post these APKs.

The APK was pulled from Android Police's dump at 
http://www.androidpolice.com/2013/05/08/download-google-glass-xe4-and-xe5-system-dumps-please-do-something-cool-with-these/
