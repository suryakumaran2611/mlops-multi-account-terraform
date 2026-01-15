data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
  aws_region = data.aws_region.current.name
  # Marker used only to trigger auto-architecture-diagram workflow
  diagram_trigger_tag = "auto-arch-diagram-dev"
}
