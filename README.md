# T2S Microservices - Multi-Cloud Deployment (EKS + AKS)

This project demonstrates how to migrate a Node.js/Express-based e-commerce monolithic app into containerized microservices and deploy them to **AWS EKS** and **Azure AKS** using **Helm**, **Terraform**, and **GitHub Actions**.

## Microservices

- **auth-service**: Handles user authentication and JWT
- **product-service**: Manages product catalog
- **order-service**: Handles order placement and stock deduction
- **enrollment-service**: Handles course enrollment

## Architecture

```
            +-----------------------+
            |   NGINX Gateway/API   |
            +-----------+-----------+
                        |
    +---------+---------+----------+---------+
    |         |         |          |         |
+---v--+  +---v--+  +---v---+  +----v---+  +---v---+
| Auth |  | Prod |  | Order |  | Enroll |  |  DB   |
| Svc  |  | Svc  |  | Svc   |  | Svc    |  | Mongo |
+------+  +------+  +-------+  +--------+  +-------+
```

Deployed on both AWS EKS and Azure AKS using Helm charts and GitHub Actions.

## Folders

- `auth-service/`, `product-service/`, etc: microservices
- `helm-charts/`: Helm deployment templates for each service
- `.github/workflows/`: CI/CD pipeline
- `terraform/aws-eks/`: Infrastructure as Code for EKS
- `terraform/azure-aks/`: Infrastructure as Code for AKS

## How to Use

1. Build and push Docker images
2. Configure AWS and Azure CLI + kubeconfig
3. Use Terraform to create EKS and AKS clusters
4. Deploy each service using Helm
5. Monitor deployments and scale as needed

## Next Steps

- Add Prometheus + Grafana monitoring
- Add Trivy and Kyverno for security
- Add API Gateway + Ingress controller
