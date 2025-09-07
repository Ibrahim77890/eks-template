# eks-sim — EKS Simulation Lab (Terraform + Helm)

Rehearse a production-grade EKS architecture locally — then flip a provider to run the exact same Terraform/Helm on AWS.

This repository contains a reproducible, Terraform + Helm driven lab that demonstrates VPC/networking, EKS-like cluster behavior, IAM/role-based access patterns, autoscaling (HPA + cluster-autoscaler style), ingress & TLS, and load-balancer flows — all testable locally using k3d/kind, MetalLB and optionally LocalStack. The same code can be targeted at AWS EKS by swapping the provider configuration.

## Key features

- Infrastructure-as-code (Terraform) for VPC/IAM simulation and Helm releases

- Local Kubernetes cluster using k3d / kind (kubernetes-in-docker)

- Ingress with ingress-nginx + MetalLB for LoadBalancer IPs

- TLS lifecycle with cert-manager (local or ACME)

- Metrics via metrics-server and HPA demonstration (autoscale pods)

- Cluster-autoscaler simulation via k3d node create (demonstrates add-node behaviour)

- Sample CPU-bound app (Fibonacci) with Deployment, Service, HPA manifests

- Option to run real AWS EKS by switching Terraform provider config

## Prerequisites

- Windows 10/11 with WSL2 (recommended) or macOS/Linux

- Docker Desktop (WSL2 backend enabled)

- kubectl (compatible with your cluster)

- k3d (or kind)

- helm (v3+)

- terraform (v1.4+ recommended)

- Optional: LocalStack (for local AWS API simulation)

- Optional: make / PowerShell for convenience scripts

- Use WSL shell for smoother path handling. If using PowerShell, some commands are shown below with PowerShell syntax.

## Flip to AWS EKS (high level)

To deploy the same setup to AWS:

- Replace/supplement the Terraform providers with the AWS provider and EKS module (configure provider "aws" with credentials).

- Replace MetalLB + NodePort with AWS Load Balancer Controller (install via Helm) and use ACM/Route53 for TLS.

- Create IAM roles/policies for EKS, node groups, Load Balancer Controller, cluster-autoscaler or Karpenter roles.

- Run terraform apply against real AWS account (beware of costs).

- The repo is structured so that TF_VAR_target=local|aws can be used to change provider behaviour (sample providers.tf shows this pattern).


Following images for local deployment :
<img width="1920" height="1020" alt="eks-1" src="https://github.com/user-attachments/assets/c1a20824-690b-462d-b1f2-8ca6266c7e64" />
<img width="1920" height="1020" alt="eks-2" src="https://github.com/user-attachments/assets/8d96dfb0-12e4-4be3-8edf-bd3aaf1969fe" />
<img width="1920" height="1020" alt="eks-3" src="https://github.com/user-attachments/assets/6749d289-331d-485c-9a14-ef732c28c12e" />
<img width="1920" height="1020" alt="eks-4" src="https://github.com/user-attachments/assets/a7ce2cc1-6e9d-4462-98a8-4b579a5ec65a" />
<img width="1920" height="1020" alt="eks-5" src="https://github.com/user-attachments/assets/f8cff351-4559-4a4a-ae72-9c275cf96918" />
<img width="1920" height="1020" alt="eks-6" src="https://github.com/user-attachments/assets/5c27c9a6-c921-4105-a039-b0580999514e" />
<img width="1918" height="1011" alt="eks-7" src="https://github.com/user-attachments/assets/0d31555c-c214-47f5-babf-46077df8d80e" />




