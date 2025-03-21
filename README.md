# devops-assignment

## Objective

Design, implement, and manage a CI/CD pipeline, deploy infrastructure using Infrastructure as Code (IaC), and ensure scalability and monitoring of the application.

## Task Description

### Application Setup

1. A basic FastAPI Application is already setup inside `app/main.py`
2. Run pip install -r requirements.txt to install the dependencies
3. Run `make run-server` on the terminal in the root directory of the project
4. Ensure the application is available on port `8000`

1. Use Terraform or another IaC tool to provision infrastructure on a cloud platform of choice (AWS, Azure, or Google Cloud).
2. Include:
   - K8S Cluster on 3 VMs
   - Application containers using Docker
   - Load balancer configuration and setup

### CI/CD Pipeline

1. Set up a CI/CD pipeline using tools like Jenkins, GitHub Actions, or GitLab CI.
2. Automate the following when a change is pushed:
   - Code testing.
   - Building the application.
   - Deployment to the provisioned infrastructure.

### Monitoring & Logging

1. Integrate a monitoring tool like Prometheus to track application performance.

### Scalability

1. Visualise how the infrastructure can scale horizontally or vertically based on traffic demands. You can show a high level design to show this.

## Deliverables

1. Source code for the application hosted on a Git repository.
2. Terraform/IaC scripts for infrastructure provisioning.
3. CI/CD pipeline configuration files.
4. Documentation explaining:
   - The architecture and setup process.
   - Steps to scale the application.
   - Monitoring strategy.
