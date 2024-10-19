#!/bin/bash

# Remove existing local_manifests
rm -rf .repo/local_manifests/

# Initialize git lfs
git lfs install

# repo init manifest
repo init -u https://github.com/ProjectPixelage/android_manifest.git -b 15 --git-lfs --depth=1
echo "====================="
echo "= Repo init success ="
echo "====================="

# Local manifests
git clone https://github.com/Trijal08/local_manifests -b ProjectPixelage-15-shusky --depth=1 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh || exit 1
echo "================"
echo "= Sync success ="
echo "================"

# Private keys
git clone https://github.com/Trijal08/vendor_lineage-priv_keys.git vendor/lineage-priv/keys

# Export
export BUILD_USERNAME="GamerBoy1234294 • BlazingAndWorthGlazing"
export BUILD_HOSTNAME="crave"
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export PIXELAGE_BUILD="shusky"
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch and build
make installclean -j$(nproc --all)
lunch aosp_husky-ap3a-userdebug
croot
mka bacon
lunch aosp_shiba-ap3a-userdebug
croot
mka bacon
echo "============="
