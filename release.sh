#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status.

VERSION_NAME='athena_torch2p1_cuda11p8_cudnn8'
IMAGE_NAME="aivsw/research:$VERSION_NAME"

# Stop and remove any existing containers with the same name
existing_containers=$(docker ps -aq -f name=^"${VERSION_NAME}"$)
if [ -n "$existing_containers" ]; then
   docker rm -f "$existing_containers"
fi

# Stop and remove any containers using the target image
containers_using_image=$(docker ps -aq -f ancestor="$IMAGE_NAME")
if [ -n "$containers_using_image" ]; then
   docker rm -f $containers_using_image
fi

# Remove the old image if it exists
existing_image=$(docker images -q "$IMAGE_NAME")
if [ -n "$existing_image" ]; then
   docker rmi -f "$existing_image"
fi

# Build the Docker image from the specified Dockerfile and context directory
docker build -t "$IMAGE_NAME" -f "scripts/$VERSION_NAME/Dockerfile" .

# Run the Docker container
docker run -it --gpus all --ipc host \
  -v /home/jay/projects:/app/projects \
  -v /home/jay/mnt/hdd/data:/app/data \
  --name "$VERSION_NAME" "$IMAGE_NAME" /bin/bash


