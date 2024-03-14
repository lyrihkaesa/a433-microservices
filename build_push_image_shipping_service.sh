#!/bin/bash

# GitHub username
GITHUB_USERNAME="lyrihkaesa"
# Nama image yang akan dibuat
IMAGE_NAME="shipping"
# Tag untuk image
TAG="latest"

# Mengubah nama image agar sesuai dengan format GitHub Packages (GitHub Container Registry)
IMAGE_NAME_FOR_GITHUB_PACKAGE="ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG"

# Membuat Docker image dari Dockerfile dengan nama dan tag yang telah ditentukan
docker build -t $IMAGE_NAME_FOR_GITHUB_PACKAGE .

# Login ke GitHub Packages (GitHub Container Registry)
echo $PAT | docker login ghcr.io --username $GITHUB_USERNAME --password-stdin

# Mengunggah image ke GitHub Packages (GitHub Container Registry)
docker push $IMAGE_NAME_FOR_GITHUB_PACKAGE