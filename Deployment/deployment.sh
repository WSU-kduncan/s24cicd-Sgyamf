
#!/bin/bash

# Pull the latest image from DockerHub
docker pull sgyamf/webserver:latest

# Restart the Docker container (replace 'mynginx' with your container name)
docker restart mynginx
