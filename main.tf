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

