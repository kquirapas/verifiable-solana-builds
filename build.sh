#!/bin/bash

# get repo root for reference point
REPO_ROOT=$(git rev-parse --show-toplevel)

pushd $REPO_ROOT

# configuration
RUST_IMAGE_TAG=1.79
SOLANA_CLI=v1.18.18
# separate folder form target/ to prevent Permission Denied error
HOST_FOLDER_ABSOLUTE_PATH=$REPO_ROOT/verified/$PROGRAM_NAME
CONTAINER_FOLDER_ABSOLUTE_PATH=/programs/target
IMAGE_NAME=verifiable-solana-build

docker build --build-arg "RUST_IMAGE_TAG=$RUST_IMAGE_TAG" --build-arg "SOLANA_CLI=$SOLANA_CLI" -t $IMAGE_NAME $REPO_ROOT

popd
