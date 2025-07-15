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
        Owner = "maftei"
    }
}
