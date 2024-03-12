#!/bin/bash
# Install Docker
sudo apt-get update -y
sudo apt-get install -y docker.io

# Start Docker service
sudo systemctl start docker

# Pull Docker image
sudo docker pull precognition/gmt-time-app:latest

# Run Docker container
sudo docker run -d -p 5000:5000 precognition/gmt-time-app:latest