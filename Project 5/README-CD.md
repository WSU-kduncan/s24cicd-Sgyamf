## Project 5: Milestone Dates & EC

### Project Overview

This project involves setting up a GitHub Actions workflow to automate the build and push of Docker images to DockerHub when specific Git tags are pushed to the repository. The workflow is designed to adhere to semantic versioning principles, focusing on versioning formats like `Major.Minor.Patch`, along with tags for `{{major}}`, `{{major}}.{{minor}}`, and `latest`.

### Semantic Versioning Format

The semantic versioning format used in this project follows the pattern of `Major.Minor.Patch`, where:
- `Major`: Represents significant changes or breaking changes.
- `Minor`: Represents new features or enhancements.
- `Patch`: Represents bug fixes or patches.

The workflow is configured to generate tags based on these version patterns when specific events occur.

### How to Generate a Tag in Git/GitHub

To generate a tag in Git/GitHub for triggering the workflow, use the following commands:

\```
git tag -a v1.0.0 -m "Version 1.0.0"
git push origin --tags
\```

#### Deleting a Tag

To delete a Git tag locally and on the remote repository, follow these steps:


# Delete a local tag
git tag -d <tag_name>

# Delete the tag on the remote repository
git push --delete origin <tag_name>
\```



### Updated `main.yml` File

\```yaml
name: Build and Push Docker Image

on:
  push:
    tags:
      - 'v*'  # Trigger workflow on tag push that starts with 'v'

jobs:
  build-and-push:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Login to DockerHub
        run: echo "${{ secrets.DOCKER_PASSWORD }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin

      - name: Extract tag version
        id: extract_tag
        run: |
          echo "Tag from GitHub ref: ${{ github.ref }}"
          TAG=$(echo "${{ github.ref }}" | sed 's/refs\/tags\/v//')
          echo "::set-output name=tag::$TAG"

      - name: Build Docker image
        run: |
          docker build -t sgyamf/sgyamf:${{ steps.extract_tag.outputs.tag }} .
          docker build -t sgyamf/sgyamf:latest .

      - name: Push Docker image to DockerHub
        run: |
          docker push sgyamf/sgyamf:${{ steps.extract_tag.outputs.tag }}
          docker push sgyamf/sgyamf:latest
\```

### Explanation of Updated `main.yml`

- **Workflow Trigger** (`on: push: tags`):
  - This workflow triggers only on `push` events with tags (`refs/tags/v*` pattern), which typically represent Git tag versions.

- **Jobs** (`build-and-push`):
  - Contains a single job named `build-and-push` that runs on an `ubuntu-latest` runner.

- **Steps**:
  1. **Checkout Repository**:
     - Uses `actions/checkout@v2` to checkout the repository code onto the runner.

  2. **Login to DockerHub**:
     - Uses `docker login` command with Docker Hub credentials stored in GitHub secrets.

  3. **Extract Tag Version**:
     - Extracts the tag version from the `github.ref` variable (e.g., `refs/tags/v1.0.0` becomes `1.0.0`).
     - Sets the extracted tag version as an output (`tag`) for later use.

  4. **Build Docker Images**:
     - Builds two Docker images:
       - One tagged with the extracted tag version (`sgyamf/sgyamf:${{ steps.extract_tag.outputs.tag }}`).
       - One tagged as `latest` (`sgyamf/sgyamf:latest`).

  5. **Push Docker Images to DockerHub**:
     - Pushes both Docker images to your DockerHub repository:
       - The image tagged with the extracted tag version.
       - The image tagged as `latest`.


Docker Image Push Documentation
Step 1: Tag Docker Images Locally
Tagging Docker images locally allows us to assign specific names (tags) to our images before pushing them to Docker Hub. This helps organize and identify our images more effectively.

Step 2: Log in to Docker Hub
Before pushing Docker images to Docker Hub, we need to authenticate by logging in with our Docker Hub credentials.

Step 3: Push Docker Images to Docker Hub
After logging in, we use the docker push command to upload our tagged Docker images to Docker Hub. This step makes our images publicly accessible and usable by others.

Step 4: Verify Pushed Images on Docker Hub
Once the images are pushed, we can verify their presence on Docker Hub by navigating to the respective repositories. This ensures that our images are successfully uploaded and available for use.  

##Proof

![image](https://github.com/WSU-kduncan/s24cicd-Sgyamf/assets/143733797/faf59ce1-91f8-4d59-990f-896c152520b1)


![image](https://github.com/WSU-kduncan/s24cicd-Sgyamf/assets/143733797/dcc24287-cb1d-4126-ac85-3fa5687c5879)

## Installation Guide and Documentation

### How to Install Docker on Your Instance

To install Docker on your instance, follow these steps:

1. **Update Package Index:**

   ```bash
   sudo apt update

## Install Required Packages
sudo apt install apt-transport-https ca-certificates curl software-properties-common


## Add Docker's GPG Key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
## Set Up the Docker Repository:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
## Install Docker Engine:
sudo apt update
sudo apt install docker-ce
## Verify Docker Installation:
sudo systemctl status docker
docker --version

## Container Restart Script
 Justification & Description

The container restart script (update_container.sh) is designed to pull the latest Docker image from DockerHub and restart a specified container.

What It Does
Pull Latest Image:
docker pull sgyamf/webserver:latest
## Restart Docker Container:
docker restart mynginx

## Location on Instance
The script should reside in /home/sgyamf/deployment/update_container.sh.

Setting Up a Webhook on the Instance
Installation of adnanh's Webhook
## Clone Webhook Repository:
git clone https://github.com/adnanh/webhook.git

#Build Webhook:
cd webhook
go build

# Starting the Webhook
Start the webhook with your configured hooks file:
./webhook -hooks hooks.json -port 9000 -verbose
# Handling Webhook Task Definition File
Description
The webhook task definition file (hooks.json) defines specific actions to be executed when triggered by events.

# Location on Instance
The hooks.json file should be located in /home/sgyamf/deployment.

# Configuring GitHub or DockerHub to Message the Listener
GitHub Configuration
Go to your GitHub repository settings.
Navigate to **Webhooks** and add a new webhook.
Set the payload URL to your instance's webhook endpoint.
Choose the events you want to trigger the webhook.

# DockerHub Configuration
Go to DockerHub repository settings.
Configure automated builds with webhook notifications.
Provide the payload URL and choose the events to trigger the webhook.

## CI/CD Workflow Proof
To demonstrate the CI/CD workflow:

# Starting with a Commit and Tag:

Make a change to your repository.
Commit the change and tag the commit.

# GitHub Workflow Success:
Push the tagged commit to GitHub.
Check GitHub Actions for the workflow status and success message.

# DockerHub Pushed Images
Ensure DockerHub receives the pushed images triggered by the workflow.

# Updated Container on Instance:

Verify that the Docker container on your instance is updated with the latest image.




