#!/bin/bash

export NDK_PATH=$HOME/Android/android-ndk-r21
export NDK_COMPILER_VERSION=4.9
export NDK_PLATFORM_LEVEL=23
export HOST=linux-x86_64
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export CC=$NDK_PATH/toolchains/llvm/prebuilt/$HOST/bin/clang
export CXX=$NDK_PATH/toolchains/llvm/prebuilt/$HOST/bin/clang++
export NDK_MAKE=$NDK_PATH/prebuilt/$HOST/bin/make

for i in armeabi-v7a x86 arm64-v8a x86_64; do ./build-android-ffmpeg.sh $i && ./build-android-opencv.sh $i; done
