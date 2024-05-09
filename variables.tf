variable "GOOGLE_REGION" {
  type        = string
  description = "GCP Region"
}
variable "GOOGLE_PROJECT" {
  type        = string
  description = "GCP project"
}

#variable "TARGET_PATH" {
#  type        = string
#  default     = "clusters"
#  description = "Flux manifests subdirectory"
#}

variable "GITHUB_OWNER" {
  type        = string
  description = "GitHub User"
}

variable "GITHUB_TOKEN" {
  type        = string
  description = "GitHub access token"
}

variable "FLUX_GITHUB_REPO" {
  type        = string
  description = "FLuxCD repo"
}

variable "GOOGLE_ZONE" {
  type        = string
  description = "GCP project"
}

variable "SRVC_JSON" {
  description = "The path to the service account key JSON file"
  type        = string
}

variable "VPC_NAME" {
  description = "The name of the VPC network"
  type        = string
}

variable "GKE_CLUSTER_NAME" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "GKE_SUBNET_NAME" {
  description = "The name of the GKE subnet"
  type        = string
}

variable "GKE_SUBNET_CIDR_BLOCK" {
  description = "The CIDR block for the GKE subnet"
  type        = string
}

variable "GKE_CLUSTER_PODS_IP_RANGE_NAME" {
  description = "Name of the IP range for pods in the GKE cluster"
  type        = string
}

variable "GKE_CLUSTER_SERVICES_IP_RANGE_NAME" {
  description = "Name of the IP range for services in the GKE cluster"
  type        = string
}

variable "GKE_CLUSTER_PODS_IP_RANGE_CIDR" {
  description = "CIDR block for the IP range for pods in the GKE cluster"
  type        = string
}

variable "GKE_CLUSTER_SERVICES_IP_RANGE_CIDR" {
  description = "CIDR block for the IP range for services in the GKE cluster"
  type        = string
}

variable "GKE_MACHINE_TYPE" {
  description = "The machine type for GKE nodes"
  type        = string
}

variable "GKE_POOL_NAME" {
  description = "The name of the GKE node pool"
  type        = string
}

variable "GKE_NUM_NODES" {
  description = "The number of nodes in the GKE node pool"
  type        = number
}

variable "GKE_MIN_COUNT" {
  description = "The minimum number of nodes in the GKE node pool"
  type        = number
}

variable "GKE_MAX_COUNT" {
  description = "The maximum number of nodes in the GKE node pool"
  type        = number
}