variable "name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, uat, prod)"
  type        = string
  default     = "dev"
}
variable "tags" {
  type        = map(string)
  description = "Tags to apply to the ECR repository"
  default     = {}
}
