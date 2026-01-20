# DevOps Bootcamp Final Project (2025)

Web Server: https://labamir.com

Grafana: https://grafana.labamir.com

Githubs Pages: https://take2mir.github.io/devops-bootcamp-project/

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
* GitHub Pages

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

<img width="315" height="68" alt="image" src="https://github.com/user-attachments/assets/e1744454-13c8-4d88-a755-fc826d6186e2" />

<img width="286" height="106" alt="image" src="https://github.com/user-attachments/assets/9e5ea5e7-444c-4fd8-8db8-5cc82faca51b" />

<img width="272" height="313" alt="image" src="https://github.com/user-attachments/assets/54dceeeb-e260-476e-b20b-e25908026195" />





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

<img width="943" height="152" alt="image" src="https://github.com/user-attachments/assets/70f6c26a-b1d4-412b-be7a-fc93448764a0" />

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

<img width="875" height="227" alt="image" src="https://github.com/user-attachments/assets/a6c7560f-2870-4959-bee5-755fd9f1854e" />

<img width="883" height="292" alt="image" src="https://github.com/user-attachments/assets/f5e0e13d-08e3-4f1f-bf77-b535f5eabc6b" />



---

## 📄 Documentation & Automation

### GitHub Pages

* Documentation hosted using GitHub Pages
* Automatically updated on every commit

---

## 🔁 CI/CD (Optional Bonus)

### Implemented / Planned

* Docker image build
* Push to Amazon ECR
* Pull and deploy on Web Server

<img width="783" height="197" alt="image" src="https://github.com/user-attachments/assets/de100169-3fea-4063-a501-530373313111" />


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

**Mohd Amiruddin Bin Baki**
DevOps Bootcamp 2025

---

## 📌 Notes

Terima kasih Tuan Syafi dan Tuan Ariff atas ilmu yang diberikan. Mohon halalkan ya! Bermanfaat sangat.

