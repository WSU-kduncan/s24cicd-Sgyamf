# Project 5: Milestone Dates & EC

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

```bash
git tag -a v1.0.0 -m "Version 1.0.0"
git push origin --tags


---
## Behavior of GitHub Workflow

The GitHub Actions workflow (`main.yml`) is configured to execute when the following events occur:

- Push to the `main` branch.
- Push of tags that match the pattern `v*.*`.

The workflow performs the following actions:

1. Checks out the repository code.
2. Gathers metadata about the image using `docker/metadata-action`.
3. Logs in to DockerHub using Docker credentials.
4. Builds and pushes the Docker image based on the specified tags.
---
