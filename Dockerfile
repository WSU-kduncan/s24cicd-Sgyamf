FROM ubuntu:latest

# Install Apache HTTP Server
RUN apt-get update && \
    apt-get install -y apache2 && \
    rm -rf /var/lib/apt/lists/*

# Copy your HTML files to the Apache document root directory
COPY html/ /var/www/html/

# Expose port 80
EXPOSE 80
