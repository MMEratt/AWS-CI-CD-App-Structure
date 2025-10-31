# AWS CI/CD Pipeline Add-on for Scalable Auto-Healing WebApp

## Project Overview
This add-on extends your existing **AWS Scalable Auto-Healing WebApp** with a fully automated CI/CD pipeline built on AWS services.

### Continuous Integration & Deployment Flow
```
GitHub → Jenkins → Amazon S3 → AWS CodeDeploy → EC2 (Target)
```

With this setup, every new code commit triggers Jenkins to:
1. Pull the latest code from GitHub.
2. Package and zip the application files.
3. Upload the artifact to an Amazon S3 bucket.
4. Trigger an AWS CodeDeploy deployment to update your EC2 instance automatically.

---

## Core Components

| Layer | AWS Services | Purpose |
|--------|---------------|----------|
| **Source Control** | GitHub | Stores the source code |
| **CI (Build)** | Jenkins | Packages and uploads the artifact to S3 |
| **Artifact Storage** | S3 | Secure and versioned artifact storage |
| **CD (Deploy)** | CodeDeploy | Automatically deploys to EC2 |
| **Runtime** | EC2 | Hosts the live web application |

---

## Pipeline Structure

- **Jenkinsfile:** Defines build → upload → deploy stages.
- **appspec.yml:** Instructs CodeDeploy how to deploy the artifact.
- **scripts/**: Contains lifecycle hooks for deployment.
- **app/**: Simple web page demonstrating deployment success.

---

## Repository Layout

```
AWS-CICD-Addon/
├─ app/
│  └─ index.html
├─ scripts/
│  ├─ before_install.sh
│  ├─ after_install.sh
│  └─ restart_server.sh
├─ Jenkinsfile
├─ appspec.yml
└─ README.md
```

---

## Requirements
- AWS IAM roles configured:
  - `JenkinsEC2Role`
  - `CodeDeployServiceRole`
  - `TargetEC2Role`
- S3 bucket created (example: `mmeratt-cicd-artifacts`)
- EC2 instances with appropriate tags for CodeDeploy deployment group.

---

## How to Use

1. Clone the repository and merge this add-on with your existing WebApp repo.
2. Configure a Jenkins pipeline job that references this `Jenkinsfile`.
3. Push your code changes to GitHub.
4. Watch Jenkins automatically build, upload, and trigger CodeDeploy.
5. Open your EC2 public IP in a browser to verify successful deployment.

---

## Key Learnings
- Continuous Integration (CI) with Jenkins
- Continuous Deployment (CD) with CodeDeploy
- Secure service-to-service IAM roles
- Artifact management in S3
- Event-driven automation

---

## License
MIT License © 2025 Mustafa Erat
