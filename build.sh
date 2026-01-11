#!/bin/bash
set -e

IMAGE_NAME=$1
TAG=$2

docker pull ${IMAGE_NAME}:${TAG}

docker stop react-app || true
docker rm react-app || true

docker run -d \
  --name react-app \
  -p 80:80 \
  --restart always \
  ${IMAGE_NAME}:${TAG}

