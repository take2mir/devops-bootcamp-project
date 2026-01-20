# DevOps Bootcamp Final Project (2025)

## 📌 Project Overview

This project demonstrates a complete **end-to-end DevOps implementation** covering infrastructure provisioning, configuration management, containerization, monitoring, security, and documentation automation.

The solution is designed based on **best practices** and aligns fully with the final project requirements of the DevOps Bootcamp.

---

## 🏗️ High-Level Architecture

**Components:**

* AWS VPC with Public & Private Subnets
* EC2 Instances:

  * Web Server
  * Monitoring Server
  * Ansible Controller
* AWS Systems Manager (SSM)
* Docker & Amazon ECR
* Prometheus & Grafana
* Cloudflare DNS & Tunnel
* GitHub Actions & GitHub Pages

**Architecture Flow:**

* Infrastructure provisioned using **Terraform**
* Servers configured using **Ansible**
* Application containerized with **Docker** and stored in **ECR**
* Monitoring stack deployed on a private server
* Secure external access using **Cloudflare Tunnel**

---

## 🧱 Infrastructure as Code (Terraform)

### Provisioned Resources

* VPC
* Internet Gateway
* Route Tables
* Public & Private Subnets
* Security Groups
* EC2 Instances
* IAM Roles (SSM, ECR access)

### Key Security Design

* Web server: Public subnet, limited inbound access
* Monitoring server: Private subnet, **no public IP**
* SSH restricted to internal communication only
* SSM enabled for secure access and troubleshooting

---

## 🔐 Access & Connectivity

### AWS Systems Manager (SSM)

* Enabled on all EC2 instances
* Used for:

  * Secure access
  * Port forwarding
  * Troubleshooting

### Ansible Connectivity

* Ansible Controller communicates with servers using **SSH over private IPs**
* SSH keys injected post-provisioning using SSM
* No direct SSH exposure to the internet

---

## ⚙️ Configuration Management (Ansible)

### Ansible Controller Responsibilities

* Manage server configurations
* Install Docker on all servers

### Example Tasks

* Install Docker engine
* Enable and start Docker service
* Add user to Docker group

All playbooks are executed from the **Ansible Controller EC2**.

---

## 🐳 Application Containerization

### Steps Performed

1. Clone application source code
2. Build Docker image
3. Push image to Amazon ECR
4. Deploy container on Web Server

### Verification

* Application accessible via browser
* Container running successfully on port 80

---

## 📊 Monitoring & Observability

### Stack Components

* **Node Exporter** (Web Server)
* **Prometheus** (Monitoring Server)
* **Grafana** (Monitoring Server)

### Metrics Collected

* CPU usage
* Memory usage
* Disk usage

### Security Design

* Monitoring server has **no public access**
* Initial setup via **SSM Port Forwarding**
* Final access via **Cloudflare Tunnel only**

---

## 🌐 Domain & Cloudflare Integration

### DNS Configuration

* `labamir.com` → Web Server Elastic IP
* `grafana.labamir.com` → Cloudflare Tunnel

### Cloudflare Tunnel

* Securely exposes Grafana
* No inbound firewall rules required
* Monitoring server remains private

---

## 📄 Documentation & Automation

### GitHub Pages

* Documentation hosted using GitHub Pages
* Automatically updated on every commit

### GitHub Actions

* Workflow configured to deploy documentation updates

---

## 🔁 CI/CD (Optional Bonus)

### Implemented / Planned

* Docker image build
* Push to Amazon ECR
* Pull and deploy on Web Server

---

## ✅ Verification Checklist

* [x] Infrastructure provisioned via Terraform
* [x] Secure access using SSM
* [x] Configuration management using Ansible
* [x] Application deployed via Docker & ECR
* [x] Monitoring with Prometheus & Grafana
* [x] Secure access using Cloudflare Tunnel
* [x] Documentation published via GitHub Pages

---

## 🧠 Key Learning Outcomes

* Infrastructure as Code (IaC)
* Secure cloud networking
* Configuration management
* Containerization & registries
* Monitoring & observability
* Zero-trust access design
* Documentation automation

---

## 👤 Author

**Mohd Amiruddin**
DevOps Bootcamp 2025

---

## 📌 Notes

This project follows industry best practices and demonstrates real-world DevOps workflows suitable for production environments.

