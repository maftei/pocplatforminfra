resource "aws_ecr_repository" "this" {
  name = var.name

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = merge(
  {
    Environment = var.environment
    Project     = "pocplatform"
  },
  var.tags
)

}
