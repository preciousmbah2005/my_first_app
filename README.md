# My First App

A simple Flutter Material app that displays a centered greeting and a subtitle.
The app also logs the current screen width in logical pixels to the debug console.

## Run and test

```shell
flutter pub get
flutter test
flutter run
```

## Android setup

Android command-line tools are still being installed on the development machine,
and no physical phone was connected during setup. Once installation is complete,
connect and unlock the phone, enable USB debugging in Developer options, and
accept the USB debugging authorization prompt. Then use `flutter devices` to
find the device and `flutter run -d <device-id>` to launch the app.

Screenshots will be saved in the `screenshots` folder when a device is available.
