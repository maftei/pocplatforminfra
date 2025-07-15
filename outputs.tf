output "orders_service_ecr_url" {
  value = module.orders_service_ecr.repository_url
}

output "web_client_ecr_url" {
  value = module.web_client_ecr.repository_url
}
