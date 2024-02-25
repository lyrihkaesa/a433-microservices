#!/bin/bash

# Nama image yang akan dibuat
IMAGE_NAME="item-app"
# Tag untuk image
TAG="v1"

# Membuat Docker image dari Dockerfile dengan nama dan tag yang telah ditentukan
docker build -t $IMAGE_NAME:$TAG .

# Melihat daftar image di lokal
docker images

# Mengubah nama image agar sesuai dengan format GitHub Container Registry
NEW_IMAGE_NAME="ghcr.io/lyrihkaesa/$IMAGE_NAME:$TAG"
docker tag $IMAGE_NAME:$TAG $NEW_IMAGE_NAME

# Login ke GitHub Packages (GitHub Container Registry)
echo $PAT | docker login ghcr.io --username lyrihkaesa --password-stdin

# Mengunggah image ke GitHub Packages (GitHub Container Registry)
docker push $NEW_IMAGE_NAME
