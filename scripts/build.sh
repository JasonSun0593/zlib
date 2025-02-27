#!/bin/bash
set -e # Error handling mechanism inside this script

ROOT=$(dirname "$(dirname "${BASH_SOURCE[@]}")")
DIST="$ROOT/dist/package"
DIST_PKG="$DIST/zlib"

echo "Cleanup previous build"
rm -rf "$DIST_PKG"
mkdir -p "$DIST"

echo "Copy package sources"
rsync -a --exclude 'dist' --exclude 'scripts' --exclude '.github' "$ROOT" "$DIST_PKG"
