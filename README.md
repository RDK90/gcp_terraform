# Terraform Scripts for GCP

## Introduction
This project is to demonstrate how Terraform can be used to deploy resources into the Google Cloud Platform (GCP). 

## Prerequisites 
* A GCP Account
* A Service Account with access to the necessary APIs
    * For this initial example, only the Compute API is required
* Terraform
    * For this inital example, version 0.12.20 is being used

## GCP Authentication
Authenticaion is required in order for a remote resource to access the GCP APIs. This is the usage of the GCP service account. For more in depth information on authentication the GCP APIs, check out: https://cloud.google.com/docs/authentication/getting-started

The easiest way to get started is to:
1. Create a service account
2. Generate a JSON key for that service account
3. Download it to the environment where the Terraform scripts will be executed from.
4. Create a local environment variable GOOGLE_APPLICATION_CREDENTIALS and point it to the location of the service account JSON file. To create this environment variable on a Linux machine use:
```bash
export GOOGLE_APPLICATION_CREDENTIALS='/path/to/json/file'
```