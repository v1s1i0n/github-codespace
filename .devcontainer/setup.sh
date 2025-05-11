#!/bin/bash
set -e

# Create Android directory
mkdir -p /workspaces/android-dev-codespace/android-sdk
cd /workspaces/android-dev-codespace/android-sdk

# Download command line tools
curl -O https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
unzip commandlinetools-linux-10406996_latest.zip -d cmdline-tools
mkdir -p cmdline-tools/latest
mv cmdline-tools/cmdline-tools/* cmdline-tools/latest/
rm commandlinetools-linux-10406996_latest.zip

# Set environment variables
echo "export ANDROID_SDK_ROOT=/workspaces/android-dev-codespace/android-sdk" >> ~/.bashrc
echo "export PATH=\$PATH:/workspaces/android-dev-codespace/android-sdk/cmdline-tools/latest/bin" >> ~/.bashrc
echo "export PATH=\$PATH:/workspaces/android-dev-codespace/android-sdk/platform-tools" >> ~/.bashrc

# Install required SDK packages (Java SDK, Build Tools, Platform Tools, NDK)
yes | /workspaces/android-dev-codespace/android-sdk/cmdline-tools/latest/bin/sdkmanager --sdk_root=/workspaces/android-dev-codespace/android-sdk \
    "platform-tools" \
    "platforms;android-34" \
    "build-tools;34.0.0" \
    "ndk;23.2.8568313"

