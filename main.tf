module "orders_service_ecr" {
  source      = "./modules/ecr"
  name        = "orders-service"
  environment = "dev"
}

module "web_client_ecr" {
  source      = "./modules/ecr"
  name        = "web-client"
  environment = "dev"
  tags = {
    Owner = "maftei-razvan"
  }
}

module "base_app_ecr" {
  source      = "./modules/ecr"
  name        = "base-app"
  environment = "dev"
  tags = {
    Owner = "maftei-razvan"
  }
}


module "iam_ci_user" {
  source      = "./modules/iam"
  user_name   = "tpocplatform-ci-user"
  policy_file = "${path.module}/modules/iam/policy_ci_user.json"
}

module "iam_helm_user" {
  source      = "./modules/iam"
  user_name   = "tpocplatform-helm-user"
  policy_file = "${path.module}/modules/iam/policy_helm_user.json"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4" # ✅ latest stable at the time of writing

  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  subnet_ids      = local.private_subnet_ids
  vpc_id          = local.vpc_id

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 2
      desired_size   = 1
    }
  }

  tags = {
    Environment = "dev"
    Owner       = "Razvan"
  }
}
