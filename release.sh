CONTAINER_NAME='patchcore'
IMAGE_NAME='aivsw/research:cu11.8-cudnn8-u20'

# Stop and remove any existing container with the same name
if [ $(docker ps -aq -f name=^"$CONTAINER_NAME"$) ]; then
   docker stop "$CONTAINER_NAME"
   docker rm "$CONTAINER_NAME"
fi

# Remove the old image if it exists
if [ $(docker images -q "$IMAGE_NAME") ]; then
   docker rmi "$IMAGE_NAME"
fi

# Build the Docker image
docker build -t "$IMAGE_NAME" .

# Run the Docker container
docker run -it --gpus all --ipc host \
  -v /home/aivdl9/storage/research:/mnt/data \
  --name "$CONTAINER_NAME" "$IMAGE_NAME" /bin/bash
