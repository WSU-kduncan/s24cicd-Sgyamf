## CI Project Overview

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


docker build -t akuawebserver .


## Run Container
Once the Docker image is built successfully, you can run the container using the following command:


docker run -d -p 80:80 akuawebserver

## How to View the Project Running in the Container
Open a web browser and navigate to http://localhost to access the website served by the Docker container.

## Process to Create Public Repo in DockerHub
Sign in to DockerHub: DockerHub.
Click on the "Create Repository" button.
Fill in the repository details and set it to public.

## How to Authenticate with DockerHub via CLI Using Dockerhub Credentials
Open your terminal.
Run the following command and enter your DockerHub username and password when prompted:

docker login


## How to Push Container Image to Dockerhub (Without GitHub Actions)
After building the Docker image locally, you can push it to DockerHub using the following command:

docker push your-dockerhub-username/your-repo-name:tag

## Configuring GitHub Secrets
GitHub Secrets allow you to securely store sensitive information such as access tokens and credentials. To set a secret for your project:
Go to your GitHub repository.
Navigate to the "Settings" tab.
Click on "Secrets" in the left sidebar.
Click on the "New repository secret" button.
Enter the name and value of the secret and click "Add secret".

## Behavior of GitHub Workflow
The GitHub Actions workflow is triggered on every push to the main branch.
Custom variables in the workflow include:
DOCKER_USERNAME: DockerHub username.
DOCKER_PASSWORD: DockerHub password.
Image name and tag: Specifies the Docker image name and tag.
## DockerHub Repository Link
Your DockerHub Repository

This documentation now includes additional details such as the process to create a public repo in DockerHub, authentication with DockerHub via CLI, pushing container images to DockerHub without GitHub Actions, configuring GitHub Secrets, and the behavior of the GitHub workflow.
