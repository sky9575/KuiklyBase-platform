#!/bin/bash

# Usage: ./apply_patches.sh /path/to/patch/folder

# Check if we're in the skia-pack directory
if [ ! -d "skia" ] || [ ! -d "script" ]; then
    echo "Error: Must be run from within the skia-pack directory"
    echo "Please place this script in the skia-pack directory and run it from there"
    exit 1
fi


if [ $# -eq 0 ]; then
    echo "Error: Please provide the patch folder path as an argument"
    echo "Example usage: sh $0 /path/to/patch/folder"
    exit 1
fi

PATCH_DIR="$1"
PATCH_DIR=$(realpath "$PATCH_DIR")


echo "Applying patches from $PATCH_DIR..."


echo "Applying skia-pack"
# Main patch application process
( cd . && git apply --exclude=README.md --exclude=script/checkout.py "$PATCH_DIR/skia-pack.patch" ) || exit 1

echo "Applying skia"
( cd skia && git apply "$PATCH_DIR/skia.patch" ) || exit 1

echo "Applying icu"
( cd skia/third_party/externals/icu && git apply "$PATCH_DIR/third-party-icu.patch" ) || exit 1


echo "Applying dng_sdk"
( cd skia/third_party/externals/dng_sdk && git apply "$PATCH_DIR/third-party-dng_sdk.patch" ) || exit 1

echo "All patches applied successfully!"