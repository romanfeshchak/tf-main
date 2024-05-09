module "tls_private_key" {
  source    = "github.com/romanfeshchak/tf-tls"
  algorithm = "RSA"
}

module "github_repository" {
  source                   = "github.com/romanfeshchak/tf-github-repo"
  github_owner             = var.GITHUB_OWNER
  github_token             = var.GITHUB_TOKEN
  repository_name          = var.FLUX_GITHUB_REPO
  public_key_openssh       = module.tls_private_key.public_key_openssh
  public_key_openssh_title = "terrash"
  
}


module "gke_cluster" {
  source                             = "github.com/romanfeshchak/terraform-gke-cluster"
  GOOGLE_REGION                      = var.GOOGLE_REGION
  GOOGLE_PROJECT                     = var.GOOGLE_PROJECT
  GOOGLE_ZONE                        = var.GOOGLE_ZONE
  GKE_NUM_NODES                      = 2
  SRVC_JSON                          = var.SRVC_JSON
  GKE_CLUSTER_NAME                   = var.GKE_CLUSTER_NAME
  GKE_MIN_COUNT                      = var.GKE_MIN_COUNT
  GKE_MAX_COUNT                      = var.GKE_MAX_COUNT
  GKE_CLUSTER_PODS_IP_RANGE_NAME     = var.GKE_CLUSTER_PODS_IP_RANGE_NAME
  GKE_CLUSTER_PODS_IP_RANGE_CIDR     = var.GKE_CLUSTER_PODS_IP_RANGE_CIDR
  VPC_NAME                           = var.VPC_NAME
  GKE_SUBNET_CIDR_BLOCK              = var.GKE_SUBNET_CIDR_BLOCK
  GKE_MACHINE_TYPE                   = var.GKE_MACHINE_TYPE
  GKE_SUBNET_NAME                    = var.GKE_SUBNET_NAME
  GKE_CLUSTER_SERVICES_IP_RANGE_NAME = var.GKE_CLUSTER_SERVICES_IP_RANGE_NAME
  GKE_CLUSTER_SERVICES_IP_RANGE_CIDR = var.GKE_CLUSTER_SERVICES_IP_RANGE_CIDR
  GKE_POOL_NAME                      = var.GKE_POOL_NAME
  depends_on = [module.github_repository]


}
module "flux_bootstrap" {
  source            = "github.com/romanfeshchak/tf-flux"
  github_repository = "${var.GITHUB_OWNER}/${var.FLUX_GITHUB_REPO}"
  private_key       = module.tls_private_key.private_key_pem
  depends_on = [module.gke_cluster]
}



