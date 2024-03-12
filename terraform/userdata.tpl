#!/bin/bash
# Install Docker
sudo apt-get update -y
sudo apt-get install -y docker.io

# Start Docker service
sudo systemctl start docker

# Pull Docker image
sudo docker pull ${docker_image}:latest

# Run Docker container
sudo docker run -d -p 5000:5000 ${docker_image}:latest