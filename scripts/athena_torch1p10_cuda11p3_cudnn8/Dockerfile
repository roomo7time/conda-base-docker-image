# Use nvidia/cuda as the base image
FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-devel

# # Update and install wget and libpq-dev
# RUN apt-get update && \
#     apt-get install -y wget libpq-dev && \
#     rm -rf /var/lib/apt/lists/*

# Copy the install_packages.sh script into the container
COPY scripts/athena_torch1p10_cuda11p3_cudnn8/install_packages.sh /tmp/install_packages.sh
COPY scripts/athena_torch1p10_cuda11p3_cudnn8/requirements.txt /tmp/requirements.txt

WORKDIR /tmp

# Make sure the script is executable and execute the script
# RUN chmod +x ./install_packages.sh && ./install_packages.sh && rm ./install_packages.sh && rm ./requirements.txt
RUN chmod +x ./install_packages.sh && rm ./install_packages.sh

# Set the working directory to /app (assuming your app resides there)
WORKDIR /app

