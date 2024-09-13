#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/TenX-OS/manifest.git -b fourteen --git-lfs --depth=1
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Trijal08/local_manifests -b TenX_OS .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Git cherry-pick
cd vendor/lineage
git remote add los https://github.com/LineageOS/android_vendor_lineage
git fetch los
git cherry-pick 198966577ace63573e5be49e03a2e59e32997054
cd ../..
echo "===== Cherry-picking Success ====="

# Remove GMS/GApps to prevent ROM size issues
rm -rf vendor/gms

# Private keys
git clone https://github.com/Trijal08/vendor_lineage-priv_keys.git vendor/lineage-priv/keys

# Export
export BUILD_USERNAME=GamerBoy1234•10XBetter
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch 
breakfast mi439
make installclean

# Build
croot
brunch mi439 userdebug
