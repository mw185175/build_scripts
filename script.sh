#!/bin/bash

rm -rf .repo/local_manifests/

# Initialize git lfs
git lfs install

# repo init manifest
repo init -u https://github.com/Project-PixelStar/manifest -b 14-qpr3 --git-lfs --depth=1
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Trijal08/local_manifests -b PixelStar_OS-shusky --depth=1 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Private keys
git clone https://github.com/Trijal08/vendor_lineage-priv_keys.git vendor/lineage-priv/keys

# Export
export BUILD_USERNAME=GamerBoy1234294•PixelsOfTheStars
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch lineage_husky-ap2a-userdebug
lunch lineage_husky-userdebug
make installclean -j$(nproc --all)
echo "============="

# Build ROM
croot
mka bacon -j$(nproc --all)
