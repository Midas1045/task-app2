#!/bin/bash

# Stop and remove the old container
sudo docker stop c90adc06b4be
sudo docker rm c90adc06b4be

# Rebuild the image from your frontend directory
sudo docker build -t clint7/projects-1-frontend:latest ./frontend

# Run it fresh
sudo docker run -d -p 3000:3000 clint7/projects-1-frontend:latest

# Check connectivity on Port 3000
curl http://localhost:3000

# Check connectivity on Port 80
curl http://localhost:80

