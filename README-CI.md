# CI Project Overview

This project aims to create a Docker image for serving a website using Apache web server. The Docker image allows for easy deployment of the website in a containerized environment, providing consistency across different platforms and environments.

**Objective**: Serve a static website using Apache web server within a Docker container.

**Tools Used**:
- Docker: Containerization platform for building, distributing, and running applications.
- Apache HTTP Server: Web server software for serving web content.

# Run Project Locally

To run this project locally, follow the steps below:

## Prerequisites

Ensure that you have Docker installed on your system. If you're using Windows with WSL2, you'll need to have WSL2 installed and Docker Desktop configured to use the WSL2 backend.

## Installation

### Docker Installation

1. Follow the official Docker installation guide for your operating system: [Docker Installation Guide](https://docs.docker.com/get-docker/).

## Build Docker Image

To build the Docker image, execute the following command in the terminal:

```bash
docker build -t akuawebserver .

## Run Container
Once the Docker image is built successfully, you can run the container using the following command:

bash
docker run -d -p 80:80 akuawebserver

## How to View the Project Running in the Container
Open a web browser and navigate to http://localhost to access the website served by the Docker container.



This structure provides a clear overview of the project, instructions for running it 
