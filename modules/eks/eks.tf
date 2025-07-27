# modules/eks/main.tf
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
   version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id

  eks_managed_node_groups = {
    default = {
      desired_size = 1
      max_size     = 2
      min_size     = 1

      instance_types = ["t3.small"]
      capacity_type  = "ON_DEMAND"
    }
  }

  enable_irsa = true
}

# Fetch the OIDC provider info after EKS is up
resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.oidc.certificates[0].sha1_fingerprint]
  url             = module.eks.cluster_oidc_issuer_url
}

# Needed for the thumbprint
data "tls_certificate" "oidc" {
  url = module.eks.cluster_oidc_issuer_url
}
