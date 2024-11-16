# Deploying `nginxdemos/hello` with Terraform

This repository contains Terraform configurations to deploy the `nginxdemos/hello` Docker image as a headless service in a Kubernetes cluster. The configuration includes variables for namespace, deployment name, service name, service port, and pod port.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- Access to a Kubernetes cluster
- `kubectl` configured to access your Kubernetes cluster

## Configuration

### Variables

The following variables can be configured in the `terraform.tfvars` file or passed directly to Terraform commands:

- `namespace`: The namespace to deploy the resources (default: `default`)
- `deployment_name`: The name of the deployment (default: `hello-deployment`)
- `service_name`: The name of the service (default: `hello-service`)
- `service_port`: The port on which the service will be exposed (default: `80`)
- `pod_port`: The port on which the pod is listening (default: `80`)

### Example `terraform.tfvars`

Create a `terraform.tfvars` file to override the default variable values:

```hcl
namespace       = "my-namespace"
deployment_name = "my-hello-deployment"
service_name    = "my-hello-service"
service_port    = 8080
pod_port        = 80
```


## Deployment Instructions

Follow these steps to deploy the `nginxdemos/hello` Docker image using Terraform:

1. **Clone the repository**:
    ```sh
    git clone 
    cd gokul_assessment
    ```

2. **Initialize Terraform**:
    ```sh
    terraform init
    ```

3. **Plan to verify what will be created**:
    

4. **Apply the Terraform configuration**:
    ```sh
    terraform apply
    ```

5. **Verify the deployment**:
    Use `kubectl` to verify that the deployment and service have been created successfully:
    ```sh
    kubectl get deployments -n <your-namespace>
    kubectl get services -n <your-namespace>
    ```
