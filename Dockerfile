# Use nvidia/cuda as the base image
FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04

# Set environment variables for Miniconda
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

# Update and install wget and libpq-dev
RUN apt-get update && \
    apt-get install -y wget libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py39_23.1.0-1-Linux-x86_64.sh && \
    bash Miniconda3-py39_23.1.0-1-Linux-x86_64.sh -b -p /root/miniconda3 && \
    rm -f Miniconda3-py39_23.1.0-1-Linux-x86_64.sh && \
    conda --version

# Ensure conda base environment activation on each new shell
RUN echo "source activate base" >> ~/.bashrc

# Copy the install_packages.sh script into the image
COPY install_packages.sh /tmp/install_packages.sh

# Give execution permissions to the script and execute it
RUN chmod +x /tmp/install_packages.sh && \
    /tmp/install_packages.sh

# Set the working directory to /app (assuming your app resides there)
WORKDIR /app
