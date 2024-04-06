## Project 5: Milestone Dates & EC

## Project Overview

This project involves setting up a GitHub Actions workflow to automate the build and push of Docker images to DockerHub when specific Git tags are pushed to the repository. The workflow is designed to adhere to semantic versioning principles, focusing on versioning formats like `Major.Minor.Patch`, along with tags for `{{major}}`, `{{major}}.{{minor}}`, and `latest`.

## Semantic Versioning Format

The semantic versioning format used in this project follows the pattern of `Major.Minor.Patch`, where:
- `Major`: Represents significant changes or breaking changes.
- `Minor`: Represents new features or enhancements.
- `Patch`: Represents bug fixes or patches.

The workflow is configured to generate tags based on these version patterns when specific events occur.

## How to Generate a Tag in Git/GitHub

To generate a tag in Git/GitHub for triggering the workflow, use the following commands:

git tag -a v1.0.0 -m "Version 1.0.0"
git push origin --tags

Deleting a Tag:
To delete a Git tag locally and on the remote repository, follow these steps:

# Delete a local tag
git tag -d <git tag -d v1.0.0>

# Delete the tag on the remote repository
git push --delete origin <git tag -d v1.0.0>


### Updated main.yml File:

Here is the updated main.yml file that automates the build and push of Docker images to DockerHub based on Git tag versions and latest:



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
         ---
