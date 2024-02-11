# Ontik Interview


## Firebase Setup

Setup Firebase for Push Notification
First you have to change your package name. If you didn’t then follow this.

Create your own firebase project from https://console.firebase.google.com and also add an android app there with your own package name and app name.

WARNING
Do not create multiple project if you have multiple app like User App, Delivery App. Create only one project and add multiple app under project.

Click register app and download google-services.json file from there.

Copy that file and paste it under <project>/android/app/ folder.

Create a totally white png logo for notification icon. Paste it on <project>/android/app/src/main/res/drawable/ and replace notification_icon.png with your whiter version logo.

For IOS again create an app under same project and download GoogleService-Info.plist and paste it under <project>/iOS/ folder. Also follow this documentation for full setup for IOS: https://firebase.flutter.dev/docs/messaging/apple-integration


After your setup please restart your IDE and uninstall your previously installed app then run it. Also don’t try to test it on emulator or simulator. Emulator and simulators are unable to get push. Use real device in this case.


# Google Login


Android Integration

To access Google Sign-In, you’ll need to make sure to register your application. visit - 👉 https://firebase.google.com/docs/android/setup

You don’t need to include the google-services.json file in your app unless you are using Google services that require it. You do need to enable the OAuth APIs that you want, using

👉 https://console.developers.google.com/
IOS Integration

First register your application - 👉 https://firebase.google.com/docs/ios/setup
Make sure the file you download in step 1 is named GoogleService-Info.plist.
Move or copy GoogleService-Info.plist into the [my_project]/ios/Runner directory.
Open Xcode, then right-click on Runner directory and select Add Files to "Runner".
Select GoogleService-Info.plist from the file manager.
A dialog will show up and ask you to select the targets, select the Runner target.
Then add the CFBundleURLTypes attributes below into the [your_project]/ios/Runner/Info.plist file.
<key>CFBundleURLTypes</key>
<array>
<dict>
<key>CFBundleTypeRole</key>
<string>Editor</string>
<key>CFBundleURLSchemes</key>
<array>
<!-- TODO Replace this value: -->
<!-- Copied from GoogleService-Info.plist key REVERSED_CLIENT_ID -->
<string>com.googleusercontent.apps.861823949799-vc35cprkp249096uujjn0vvnmcvjppkn</string>
</array>
</dict>
</array>