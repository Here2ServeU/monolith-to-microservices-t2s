# T2S Microservices – Multi-Cloud Deployment (EKS + AKS + GKE)

## Overview

This project showcases the transformation of the [api-restful-nodejs-express](https://github.com/Here2ServeU/api-restful-nodejs-express) monolithic e-commerce API into a scalable, containerized microservices architecture. It’s deployed across **AWS EKS**, **Azure AKS**, and **Google GKE** using Helm, Terraform, and GitHub Actions.

## Microservices

- **Auth Service**: Manages user registration and authentication
- **Product Service**: Manages product catalog
- **Order Service**: Processes customer orders
- **Enrollment Service**: Handles course enrollment

## Architecture Diagram

```
                        +---------------------+
                        |   API Gateway/Ingress|
                        +----------+----------+
                                   |
        +--------------------------+--------------------------+
        |                          |                          |
+-------v-------+        +---------v---------+        +-------v-------+
|  Auth Service |        |  Product Service  |        |  Order Service |
+---------------+        +-------------------+        +---------------+
        |                          |                          |
        +--------------------------+--------------------------+
                                   |
                          +--------v--------+
                          | Enrollment Svc  |
                          +-----------------+
                                   |
                          +--------v--------+
                          |   MongoDB Atlas  |
                          +-----------------+
```

## Supported Cloud Platforms

- AWS EKS
- Azure AKS
- Google GKE

## Setup Instructions

1. Clone the Repository:
   ```bash
   git clone https://github.com/Here2ServeU/t2s-microservices-multicloud.git
   cd t2s-microservices-multicloud
   ```

2. Provision Infrastructure:
   - **EKS**: `cd terraform/aws-eks && terraform apply`
   - **AKS**: `cd terraform/azure-aks && terraform apply`
   - **GKE**: `cd terraform/gcp-gke && terraform apply`

3. Configure Kubernetes Context:
   - **AWS**: `aws eks update-kubeconfig --name t2s-eks-cluster`
   - **Azure**: `az aks get-credentials --resource-group t2s-rg --name t2s-aks-cluster`
   - **GCP**: `gcloud container clusters get-credentials t2s-gke-cluster --region us-central1`

4. Deploy with Helm:
   ```bash
   helm install auth-service helm-charts/auth-service
   helm install product-service helm-charts/product-service
   helm install order-service helm-charts/order-service
   helm install enrollment-service helm-charts/enrollment-service
   ```

## Terraform Structure

```
terraform/
├── aws-eks/
│   └── main.tf
├── azure-aks/
│   └── main.tf
└── gcp-gke/
    └── main.tf
```

---

## <div align="center">About the Author</div>

<div align="center">
  <img src="assets/emmanuel-naweji.jpg" alt="Emmanuel Naweji" width="120" height="120" style="border-radius: 50%;" />
</div>

**Emmanuel Naweji** is a seasoned Cloud and DevOps Engineer with years of experience helping companies architect and deploy secure, scalable infrastructure. He is the founder of initiatives that train and mentor individuals seeking careers in IT and has helped hundreds transition into Cloud, DevOps, and Infrastructure roles.

- Book a free consultation: [https://here4you.setmore.com](https://here4you.setmore.com)
- Connect on LinkedIn: [https://www.linkedin.com/in/ready2assist/](https://www.linkedin.com/in/ready2assist/)

Let's connect and discuss how I can help you build reliable, automated infrastructure the right way.


——-

MIT License © 2025 Emmanuel Naweji

You are free to use, copy, modify, merge, publish, distribute, sublicense, or sell copies of this software and its associated documentation files (the “Software”), provided that the copyright and permission notice appears in all copies or substantial portions of the Software.

This Software is provided “as is,” without any warranty — express or implied — including but not limited to merchantability, fitness for a particular purpose, or non-infringement. In no event will the authors be liable for any claim, damages, or other liability arising from the use of the Software.
