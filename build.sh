#!/bin/bash

set -euo pipefail

ROOT=$(git rev-parse --show-toplevel)

DISTRO=$1
: "${PLATFORM:=linux/arm64}"
IMAGE_NAME=mysql-package-$DISTRO
TARGZ_FILE=mysql.tar.gz

cd "$ROOT"

# build MySQL package
docker buildx build \
    --load \
    --platform "$PLATFORM" \
    --file "Dockerfile.$DISTRO" \
    -t "$IMAGE_NAME" "$ROOT"

# Copy the built MySQL package from the Docker container to the host
docker run --platform "$PLATFORM" --name "$IMAGE_NAME-tmp" "$IMAGE_NAME"
mkdir -p "$ROOT/tmp"
docker wait "$IMAGE_NAME-tmp"
docker cp "$IMAGE_NAME-tmp:/tmp/$TARGZ_FILE" "$ROOT/tmp"
docker rm "$IMAGE_NAME-tmp"

# Extract the built MySQL package
rm -rf "$DISTRO.build.bak"
if [[ -d "$DISTRO.build" ]]; then
    mv "$DISTRO.build" "$DISTRO.build.bak"
fi
mkdir -p "$DISTRO.build"
tar -xzf "$ROOT/tmp/$TARGZ_FILE" -C "$DISTRO.build"
rm -rf "$ROOT/tmp"
