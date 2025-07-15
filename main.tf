module "orders_service_ecr" {
  source      = "./modules/ecr"
  name        = "orders-service"
  environment = "dev"
  tags = {
    Owner = "maftei"
  }
}

module "web_client_ecr" {
  source      = "./modules/ecr"
  name        = "web-client"
  environment = "dev"
    tags = {
        Owner = "maftei"
    }
}
