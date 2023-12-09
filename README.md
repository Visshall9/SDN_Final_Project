# Flutter ToDo App

This is for running the android version of the project.
# Android Project Setup Guide

## Running the Android Version

This guide provides step-by-step instructions for setting up and running the Android version of the project.

### Guide to Install Android Studio on Windows

1. Begin by downloading Android Studio:
   - Visit the official Android Studio website: [https://developer.android.com/studio](https://developer.android.com/studio).
   - Click on the "Download" button.
   - Download the Windows version.

2. Run the installer:
   - Locate the downloaded installer file (usually a .exe file).
   - Double-click the installer to initiate the setup.

3. Choose components:
   - Opt for "Custom" installation to tailor components or choose "Standard" for default settings.
   - Ensure "Android Virtual Device (AVD)" and "Performance (Intel® HAXM)" are selected.

4. Select installation location:
   - Choose the destination folder for Android Studio installation.
   - Click "Next".

5. Specify install type:
   - Choose the setup type (Standard or custom).
   - Click "Next".

6. Complete Installation:
   - Initiate the installation process by clicking "Install".

7. Finalize setup:
   - After installation completion, click "Next" and then "Finish".

8. Launch Android Studio:
   - Find Android Studio in your Start Menu or desktop shortcuts.
   - Upon the first run, Android Studio will download and install necessary Android SDK components.

9. Configure SDK:
   - Follow the setup wizard to configure the Android SDK with required packages.
   - Download the necessary SDK components for your development.

10. Finish Setup:
    - Once SDK components are downloaded and installed, you are ready to begin Android development.

11. Configure Android Virtual Device (AVD):
    - To test your applications, go to "Tools" > "AVD Manager" and create a new virtual device.


# How to Add and Use Firebase for the Project

Follow these steps to integrate Firebase into your project:

1. **Create a Firebase Project:**
   - Go to the [Firebase console](https://console.firebase.google.com/).
   - Click on "Add Project" and follow the prompts to set up a new project. Provide a name and select your country or region.

2. **Add Your App to the Project:**
   - Once your project is created, click on "Add app" to add your app. Choose the platform (iOS, Android, or Web) and follow the setup instructions.
   - For mobile apps, provide the package name (for Android) or bundle ID (for iOS).
   - Generate an SHA-1 key and enter it, then register your app.

3. **Download Configuration Files:**
   - After registering your app, you’ll be prompted to download configuration files like `google-services.json` for Android.
   - Place these files in the respective directories in your project.

4. **Add Dependencies:**
   - For mobile apps, add the necessary dependencies in your app-level `build.gradle` file.

5. **Run and Verify:**
   - Run your app and verify that Firebase has been successfully integrated.
   - Check the console for logs indicating successful initialization.

Now, your project is set up with Firebase, and you can start leveraging its features.

# Establishing Connection to Firebase Realtime Database

## Database Creation:

1. **Access the Realtime Database:**
   - Navigate to the Realtime Database section in the Firebase console.
   - Select an existing Firebase project as prompted and follow the workflow to create the database.

2. **Choose Security Rules Mode:**
   - Choose a starting mode for Firebase Security Rules:
      - (a) **Test Mode:**
         - Ideal for initiating with mobile and web client libraries, allowing anyone to read and overwrite your data.
      - (b) **Locked Mode:**
         - Denies all reads and writes from mobile and web clients, permitting authenticated application servers to access the database.

3. **Specify Database Location:**
   - Depending on the database location, the URL will follow one of these formats:
      - (a) `DATABASE NAME.firebaseio.com` (for databases in `us-central1`).
      - (b) `DATABASE NAME.REGION.firebasedatabase.app` (for databases in other locations).
   - Click "Done" to finalize.

## Adding Realtime Database SDK to Your App:

1. **Update Module (app-level) Gradle File:**
   - In your module (app-level) Gradle file (typically `//build.gradle.kts` or `//build.gradle`), include the dependency for the Realtime Database library for Android.

## Configuring Realtime Database Security Rules:

1. **Utilize Declarative Rules Language:**
   - Use the declarative rules language provided by the Realtime Database to define the structure of your data, its indexing, and control read and write access.

## Writing to Your Database:

1. **Perform Write Operations:**
   - Implement write operations in your application to store data in the Realtime Database.

## Reading from Your Database:

1. **Implement Read Operations:**
   - Develop read operations to retrieve data from the Realtime Database in your application.

5. Reading from your database.


