#!/bin/bash

rm -rf .repo/local_manifests/

# Initialize git lfs
git lfs install

# repo init manifest
repo init -u https://github.com/TenX-OS/manifest.git -b fourteen --git-lfs --depth=1
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
#git clone https://github.com/Trijal08/local_manifests -b SigmaDroid-14 --depth=1 .repo/local_manifests
#echo "============================"
#echo "Local manifest clone success"
#echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Private keys
git clone https://github.com/Trijal08/vendor_lineage-priv_keys.git vendor/lineage-priv/keys

# Export
export BUILD_USERNAME=GamerBoy1234•10XBetter
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Clone trees
rm -rf device/google/shusky
rm -rf device/google/zuma
rm -rf device/google/gs-common
rm -rf device/google/gs101
git clone --depth=1 https://github.com/Trijal08/android_device_google_shusky.git -b TenX-OS device/google/shusky
git clone --depth=1 https://github.com/austineyoung2000/android_device_google_zuma.git -b RisingOS-4.x device/google/zuma
git clone --depth=1 https://github.com/LineageOS/android_device_google_gs-common.git device/google/gs-common
git clone --depth=1 https://github.com/Jrcable1/android_device_google_gs101.git device/google/gs101
git clone --depth=1 https://github.com/austineyoung2000/packages_apps_PixelParts.git packages/apps/PixelParts
git clone --depth=1 https://github.com/TogoFire/packages_apps_ViPER4AndroidFX.git packages/apps/ViPER4AndroidFX
git clone --depth=1 https://github.com/austineyoung2000/android_vendor_google_faceunlock.git -b sigma-14.3 vendor/google/faceunlock
git clone --depth=1 https://github.com/ashoss/vendor_bcr.git vendor/bcr
git lfs clone https://github.com/austineyoung2000/proprietary_vendor_google_husky.git -b RisingOS vendor/google/husky
breakfast husky
rm -rf device/google/shusky
rm -rf device/google/zuma
rm -rf device/google/gs-common
rm -rf device/google/gs101
git clone --depth=1 https://github.com/Trijal08/android_device_google_shusky.git -b TenX-OS device/google/shusky
git clone --depth=1 https://github.com/austineyoung2000/android_device_google_zuma.git -b RisingOS-4.x device/google/zuma
git clone --depth=1 https://github.com/LineageOS/android_device_google_gs-common.git device/google/gs-common
git clone --depth=1 https://github.com/Jrcable1/android_device_google_gs101.git device/google/gs101
git clone --depth=1 https://github.com/austineyoung2000/packages_apps_PixelParts.git packages/apps/PixelParts
git clone --depth=1 https://github.com/TogoFire/packages_apps_ViPER4AndroidFX.git packages/apps/ViPER4AndroidFX
git clone --depth=1 https://github.com/austineyoung2000/android_vendor_google_faceunlock.git -b sigma-14.3 vendor/google/faceunlock
git clone --depth=1 https://github.com/ashoss/vendor_bcr.git vendor/bcr
git lfs clone https://github.com/austineyoung2000/proprietary_vendor_google_husky.git -b RisingOS vendor/google/husky
echo "====== Cloning device trees done ======"

# Lunch
breakfast husky
make installclean
echo "============="

# Build ROM
croot
brunch husky
