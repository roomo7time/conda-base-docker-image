# Use nvidia/cuda as the base image
FROM pytorch/pytorch:2.1.0-cuda11.8-cudnn8-devel

# Update and install wget and libpq-dev
RUN apt-get update && \
    apt-get install -y wget libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Copy the install_packages.sh script into the container
COPY install_packages.sh /install_packages.sh

# Make sure the script is executable and execute the script
RUN chmod +x /install_packages.sh &&  /install_packages.sh && rm /install_packages.sh

# Set the working directory to /app (assuming your app resides there)
WORKDIR /app

