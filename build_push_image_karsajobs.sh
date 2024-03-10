#!/bin/bash

# Nama image yang akan dibuat
IMAGE_NAME="karsajobs"
# Tag untuk image
TAG="latest"

# Mengubah nama image agar sesuai dengan format GitHub Packages (GitHub Container Registry)
NEW_IMAGE_NAME="ghcr.io/lyrihkaesa/$IMAGE_NAME:$TAG"

# Membuat Docker image dari Dockerfile dengan nama dan tag yang telah ditentukan
docker build -t $NEW_IMAGE_NAME .

# Login ke GitHub Packages (GitHub Container Registry)
echo $PAT | docker login ghcr.io --username lyrihkaesa --password-stdin

# Mengunggah image ke GitHub Packages (GitHub Container Registry)
docker push $NEW_IMAGE_NAME
