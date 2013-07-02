## Xenologer: repackaging Google Glass XE7 APKs to run on other devices

Google Glass's build process is fairly conservative - they don't use hidden APIs often, and when they do, they use reflection. 
Thus, it is relatively easy to repackage the Glass APKs for other devices.

### Modifications to the base APK

The use-library element in AndroidManifest is removed, as it refers to unused code.

com/google/glass/hidden/HiddenViewConfiguration.smali is patched to always return 0xffff instead of calling the nonexistent View.getDeviceTapTimeout

All native libraries required are shipped with the APK, as are all the Glass fonts.

For the camera, instead of calling Camera.open() to get the rear facing camera, Camera.open(0) is called to get the first camera,
 as the Nexus 7 doesn't have a rear camera.

### Install

Download the APK: These were extracted from the official XE7 system image.

Home: http://zhuoweizhang.net/Xenologer/glasshome-modded.apk

Voice: http://zhuoweizhang.net/Xenologer/glassvoice-modded.apk

Browser: http://zhuoweizhang.net/Xenologer/glassbrowser-modded.apk

People: http://zhuoweizhang.net/Xenologer/glasspeople-modded.apk

### Coming soon

Camera: http://zhuoweizhang.net/Xenologer/xe6/glasscamera-modded.apk

This is based on a XE6 APK, but have the XE6 features disabled as they crash the camera.

Bluetooth: http://zhuoweizhang.net/Xenologer/xe6/glassbluetooth-modded.apk 

this is modified to include an icon in the app grid in case it doesn't start on reboot.
Also, the Bluetooth headset functionality is disabled.

Install just like any other boring APK. None of the Google Glass apps need system privilages.
I do not recommend installing these APKs as system APKs, as the Glass apps will attempt to reboot the phone after a force close.

For more fun, Download the official MyGlass companion (can't download in your country? 
https://www.dropbox.com/s/5u88xt3iqd0wndw/com.google.glass.companion-130-v1.3.0.apk )
onto another companion phone and connect to the Glass device with MyGlass.

Thanks to @mralext20 for the copy of MyGlass!


Maps: use the XE5 version for now. http://zhuoweizhang.net/Xenologer/xe5/glassmaps-modded.apk

Setup: use the XE5 version for now. http://zhuoweizhang.net/Xenologer/xe5/glasssetup-modded.apk This one's been modified so that instead of scanning a barcode,
it uses the existing Google Account to setup and then force closes.

### Glass apps that won't be converted

Hangouts: crashes on Android 4.2 due to a change in the underlying Android code. 
If you have another version of Android, try http://zhuoweizhang.net/Xenologer/xe6/glasshangouts-modded.apk

GlassSound.apk: installs and runs without modification. Get a copy from any XE7 system dump, or at http://zhuoweizhang.net/Xenologer/xe7/GlassSound.apk Not essential for Glass; Glass will just run muted without it.

GlassPhotosphere.apk: As stated by http://www.studio8apps.com/running-google-glass-photo-sphere-viewer-on-android-phone/ , runs (for the easter egg) without modification.
Again, any dumped copy from a XE6 should run fine. Not essential to Glass.

GlassSettings.apk: installs and runs without modification. Get a copy from any XE6 system dump. Not essential for Glass.


### Tutorials and guides

Need help? Want to help? Check out the [Wiki page](https://github.com/zhuowei/Xenologer/wiki/Tips-and-Tricks).

Tutorial by tonystark23: http://www.youtube.com/watch?v=fNsu9xvpdNw

Virtual DPad app for navigating around Glass by Androguide: https://github.com/Androguide/GLASSInput/blob/master/GlassInput.apk?raw=true

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

Some APKs was pulled from Android Police's dump at 
http://www.androidpolice.com/2013/05/08/download-google-glass-xe4-and-xe5-system-dumps-please-do-something-cool-with-these/
