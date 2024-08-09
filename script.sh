#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Trijal08/local_manifests -b RisingOS-4.x .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="


# Export
export BUILD_USERNAME=GamerBoy1234•RisingToSuccess
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
. build/envsetup.sh && gk -s
echo "====== Envsetup Done ======="

# Lunch
riseup Mi439_4_19 userdebug
echo "============="

# Build rom
rise b
