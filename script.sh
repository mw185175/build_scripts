#!/bin/bash

# Remove existing local_manifests
rm -rf .repo/local_manifests/

# Initialize git lfs
git lfs install

# repo init manifest
repo init -u https://github.com/SkylineUI/manifest -b aosp-14 --git-lfs
echo "====================="
echo "= Repo init success ="
echo "====================="

# Local manifests
git clone https://github.com/mw185175/local_manifests -b SkylineUI-shusky --depth=1 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh || curl -s https://raw.githubusercontent.com/Trijal08/build_scripts/refs/heads/sync_script/resync.sh | bash
echo "================"
echo "= Sync success ="
echo "================"

# Auto-sign build
rm -rf vendor/lineage-priv/keys
wget https://raw.githubusercontent.com/Trijal08/crDroid-build-signed-script-auto/main/create-signed-env.sh
chmod a+x create-signed-env.sh
./create-signed-env.sh

# Export
export BUILD_USERNAME="GamerBoy1234294 • OrionStarsInTheSky"
export BUILD_HOSTNAME="crave"
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
breakfast husky
breakfast shiba
make installclean -j$(nproc --all)
echo "============="

# Build ROM
croot
brunch husky
brunch shiba
