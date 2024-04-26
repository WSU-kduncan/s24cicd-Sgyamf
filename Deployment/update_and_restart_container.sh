#!/bin/bash

# Pull the latest image from DockerHub
docker pull sgyamf/sgyamf:latest

# Stop and remove the existing container
docker stop my_container
docker rm my_container

# Run a new container with the latest image
docker run -d --name my_container -p 8080:80 sgyamf/sgyamf:latest

