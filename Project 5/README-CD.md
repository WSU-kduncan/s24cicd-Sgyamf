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


