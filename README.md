## Environment installation and compiling

Install CMake. Version 3.6.0 or higher is required. I got it from packages: ```apt install cmake```.

Install Qt. I installed the latest stable version from Qt Maintenance Tool.

Install JDK version 8 (later versions may lead to some issues, e.g., Qt doesn't accept Android SDK). I picked OpenJDK having executed ```apt install openjdk-8-jre openjdk-8-jdk```.

Install Yasm (FFmpeg dependency). I got it from packages: ```apt install yasm```.

Install Android Studio to get Android SDK https://developer.android.com/studio/index.html. Handling some Android stuff without Android Studio is painful.

Download and unpack Android NDK https://developer.android.com/ndk/downloads.

You also have to add the Android NDK and SDK paths in Qt Creator at **Tools > Options > Devices > Android**. If Qt Creator doesn't accept your SDK then try to download SDK tools using the link from `sdk_tools_url` from here https://github.com/qt-creator/qt-creator/blob/master/share/qtcreator/android/sdk_definitions.json and unpack into your SDK. After everything is green click **Update Installed** inside **SDK Manager** tab to accept licenses.

Create environment variables `OPENCV_SRC_DIR`, `FFMPEG_SRC_DIR`. Consider them to be the paths to future directories `opencv` and `FFmpeg` in a directory where you are going to execute the build scripts, e.g., directly in this repository. In order to register environment variables in my system I put these lines

```
export OPENCV_SRC_DIR=$HOME/opencv-with-ffmpeg-on-qt-for-android/opencv
export FFMPEG_SRC_DIR=$HOME/opencv-with-ffmpeg-on-qt-for-android/FFmpeg
```

to `~/.profile` and relogin.

Now edit `NDK_PATH` along with `ANDROID_SDK_ROOT` inside `build.sh` and run this script to build FFmpeg 4.2.1 and OpenCV 4.1.2 for x86 and armeabi-v7a using Clang. Sources are downloaded automatically.

## Running the sample application

Open `sample/sample.pro` in Qt Creator. Change `ARCHITECTURE` to the corresponding architecture for your current build. Note that this project uses your previously registered environment variable `OPENCV_SRC_DIR` in order to obtain libraries. Build and run. Device management is left on you. In case of success the application generates a sample video.
