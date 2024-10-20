#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/sigmadroid-project/manifest.git -b sigma-14.3 --git-lfs --depth=1
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Trijal08/local_manifests -b SigmaDroid-14 --depth=1 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Use AOSP clang for no errors
rm -r prebuilts/clang/host/linux-x86
git clone https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86 --depth=1 prebuilts/clang/host/linux-x86

# Auto-sign build
wget https://raw.githubusercontent.com/Trijal08/crDroid-build-signed-script-auto/main/create-signed-env.sh
chmod a+x create-signed-env.sh
./create-signed-env.sh

# Export
export BUILD_USERNAME=GamerBoy1234•BecomingTooSigma
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch sigma_Mi439_4_19-ap2a-userdebug
make installclean
echo "============="

# Build ROM
make bacon
