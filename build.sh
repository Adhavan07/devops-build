#!/bin/bash
set -e

IMAGE_NAME=$1
TAG=$2

if [ -z "$IMAGE_NAME" ] || [ -z "$TAG" ]; then
  echo "Usage: ./build.sh <image_name> <tag>"
  exit 1
fi

docker build -t ${IMAGE_NAME}:${TAG} .
docker push ${IMAGE_NAME}:${TAG}

