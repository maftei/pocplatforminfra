# Reserved for future variable declarations
variable "tags" {
  type        = map(string)
  description = "Tags to apply to the ECR repository"
  default     = {}
}