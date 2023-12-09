# Flutter ToDo App

This is for running the android version of the project.

**Guide to Install Android Studio on Windows**

1. Begin by downloading Android Studio:<br>
   • Visit the official Android Studio website: https://developer.android.com/studio.<br>
   • Click on the "Download" button.<br>
   • Download the Windows version.

2. Run the installer:<br>
   • Locate the downloaded installer file (usually a .exe file).<br>
   • Double-click the installer to initiate the setup.

3. Choose components:<br>
   • Opt for "Custom" installation to tailor components or choose "Standard" for default settings.<br>
   • Ensure "Android Virtual Device (AVD)" and "Performance (Intel® HAXM)" are selected.

4. Select installation location:<br>
   • Choose the destination folder for Android Studio installation.<br>
   • Click "Next".

5. Specify install type:<br>
   • Choose the setup type (Standard or custom).<br>
   • Click "Next".

6. Complete Installation:<br>
   • Initiate the installation process by clicking "Install".

7. Finalize setup:<br>
   • After installation completion, click "Next" and then "Finish".

8. Launch Android Studio:<br>
   • Find Android Studio in your Start Menu or desktop shortcuts.<br>
   • Upon the first run, Android Studio will download and install necessary Android SDK components.

9. Configure SDK:<br>
   • Follow the setup wizard to configure the Android SDK with required packages.<br>
   • Download the necessary SDK components for your development.

10. Finish Setup:<br>
    • Once SDK components are downloaded and installed, you are ready to begin Android development.

11. Configure Android Virtual Device (AVD):<br>
    • To test your applications, go to "Tools" > "AVD Manager" and create a new virtual device.

**How to add and use firebase for the project**
1. Create a Firebase project.
2. Now go to the ""Firebase console
3. Click on "Add Project" and follow the prompts to set up a new project. Give your project a name and
select your country or region.
4. Once your project is created, click on "Add app" to add your app to the project. Choose the platform
(iOS, Android, or Web) and follow the setup instructions.
5. For mobile apps, you need to provide package name (for Android) or bundle ID (for iOS).
6. You also need to generate SHA-1 key and enter it and then register.
7. After registering your app, you’ll be prompted to download configuration file like google-services.json for
Android. Place these files in the respective directories in your project.
8. For mobile apps, add the necessary dependencies in your app-level build.gradle
9. Run your app and verify that Firebase has been successfully integrated. You will findlogs in the console
indicating successful initialization.

**Establishing Connection to Firebase Realtime Database**

1. Database Creation:<br>
   • Access the Realtime Database section in the Firebase console, selecting an existing Firebase project as prompted. Follow the workflow to create the database.<br>
   • Choose a starting mode for Firebase Security Rules:<br>
     (a) Test mode:<br>
         – Ideal for initiating with mobile and web client libraries, though it permits anyone to read and overwrite your data.<br>
     (b) Locked mode:<br>
         – Denies all reads and writes from mobile and web clients, allowing authenticated application servers to access the database.<br>
   • Specify a location for the database:<br>
     (a) Depending on the database location, the URL will follow one of these formats:<br>
         – DATABASE NAME.firebaseio.com (for databases in us-central1)<br>
         – DATABASE NAME.REGION.firebasedatabase.app (for databases in other locations)<br>
   • Click "Done".

2. Adding Realtime Database SDK to your app:<br>
   • In your module (app-level) Gradle file (typically <project>/<app-module>/build.gradle.kts or <project>/<app-module>/build.gradle), include the dependency for the Realtime Database library for Android.

3. Configuring Realtime Database Security Rules:<br>
   • Utilize the declarative rules language provided by the Realtime Database to define the structure of your data, its indexing, and control read and write access.

4. Writing to your database.

5. Reading from your database.


