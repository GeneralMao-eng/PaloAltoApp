variable "namespace" {
  description = "The namespace to deploy the resources"
  type        = string
  default     = "default"
}

variable "deployment_name" {
  description = "The name of the deployment"
  type        = string
  default     = "hello-deployment"
}

variable "service_name" {
  description = "The name of the service"
  type        = string
  default     = "hello-service"
}

variable "service_port" {
  description = "The port on which the service will be exposed"
  type        = number
  default     = 80
}

variable "pod_port" {
  description = "The port on which the pod is listening"
  type        = number
  default     = 80
}