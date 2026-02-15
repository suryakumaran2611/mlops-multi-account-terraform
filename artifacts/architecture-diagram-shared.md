<!-- auto-arch-diagram -->

## Architecture Diagram (Auto)

Summary: Generated a dependency-oriented Terraform diagram from changed resources.

```mermaid
flowchart LR
  subgraph all_AWS[AWS]
    tf_aws_cloudwatch_log_group_main["aws_cloudwatch_log_group.main"]
    tf_aws_eip_nat_eip["aws_eip.nat_eip"]
    tf_aws_flow_log_main["aws_flow_log.main"]
    tf_aws_internet_gateway_main["aws_internet_gateway.main"]
    tf_aws_kms_key_key["aws_kms_key.key"]
    tf_aws_nat_gateway_main["aws_nat_gateway.main"]
    tf_aws_route_private_nat_gateway["aws_route.private_nat_gateway"]
    tf_aws_route_public_internet_gateway["aws_route.public_internet_gateway"]
    tf_aws_route_table_private["aws_route_table.private"]
    tf_aws_route_table_public["aws_route_table.public"]
    tf_aws_route_table_association_private["aws_route_table_association.private"]
    tf_aws_route_table_association_private_2["aws_route_table_association.private_2"]
    tf_aws_route_table_association_public["aws_route_table_association.public"]
    tf_aws_route_table_association_public_2["aws_route_table_association.public_2"]
    tf_aws_s3_bucket_bucket["aws_s3_bucket.bucket"]
    tf_aws_s3_bucket_lifecycle_configuration_artifacts_lifecycle["aws_s3_bucket_lifecycle_configuration.artifacts_lifecycle"]
    tf_aws_s3_bucket_policy_bucket["aws_s3_bucket_policy.bucket"]
    tf_aws_s3_bucket_public_access_block_bucket["aws_s3_bucket_public_access_block.bucket"]
    tf_aws_s3_bucket_server_side_encryption_configuration_bucket["aws_s3_bucket_server_side_encryption_configuration.bucket"]
    tf_aws_s3_bucket_versioning_bucket["aws_s3_bucket_versioning.bucket"]
    tf_aws_sagemaker_domain_sagemaker_domain["aws_sagemaker_domain.sagemaker_domain"]
    tf_aws_sagemaker_servicecatalog_portfolio_status_enable_sagemaker_servicecatalog_portfolio["aws_sagemaker_servicecatalog_portfolio_status.enable_sagemaker_servicecatalog_portfolio"]
    tf_aws_sagemaker_user_profile_data_scientist_sagemaker_user_profiles["aws_sagemaker_user_profile.data_scientist_sagemaker_user_profiles"]
    tf_aws_sagemaker_user_profile_lead_data_scientist_sagemaker_user_profiles["aws_sagemaker_user_profile.lead_data_scientist_sagemaker_user_profiles"]
    tf_aws_security_group_main["aws_security_group.main"]
    tf_aws_subnet_private["aws_subnet.private"]
    tf_aws_subnet_private_2["aws_subnet.private_2"]
    tf_aws_subnet_public["aws_subnet.public"]
    tf_aws_subnet_public_2["aws_subnet.public_2"]
    tf_aws_vpc_main["aws_vpc.main"]
  end
tf_aws_cloudwatch_log_group_main --> tf_aws_flow_log_main
tf_aws_eip_nat_eip --> tf_aws_nat_gateway_main
tf_aws_internet_gateway_main --> tf_aws_route_public_internet_gateway
tf_aws_nat_gateway_main --> tf_aws_route_private_nat_gateway
tf_aws_route_table_private --> tf_aws_route_private_nat_gateway
tf_aws_route_table_private --> tf_aws_route_table_association_private
tf_aws_route_table_private --> tf_aws_route_table_association_private_2
tf_aws_route_table_public --> tf_aws_route_public_internet_gateway
tf_aws_route_table_public --> tf_aws_route_table_association_public
tf_aws_route_table_public --> tf_aws_route_table_association_public_2
tf_aws_s3_bucket_bucket --> tf_aws_s3_bucket_lifecycle_configuration_artifacts_lifecycle
tf_aws_s3_bucket_bucket --> tf_aws_s3_bucket_policy_bucket
tf_aws_s3_bucket_bucket --> tf_aws_s3_bucket_public_access_block_bucket
tf_aws_s3_bucket_bucket --> tf_aws_s3_bucket_server_side_encryption_configuration_bucket
tf_aws_s3_bucket_bucket --> tf_aws_s3_bucket_versioning_bucket
tf_aws_sagemaker_domain_sagemaker_domain --> tf_aws_sagemaker_user_profile_data_scientist_sagemaker_user_profiles
tf_aws_sagemaker_domain_sagemaker_domain --> tf_aws_sagemaker_user_profile_lead_data_scientist_sagemaker_user_profiles
tf_aws_subnet_private --> tf_aws_route_table_association_private
tf_aws_subnet_private_2 --> tf_aws_route_table_association_private_2
tf_aws_subnet_public --> tf_aws_nat_gateway_main
tf_aws_subnet_public --> tf_aws_route_table_association_public
tf_aws_subnet_public_2 --> tf_aws_route_table_association_public_2
tf_aws_vpc_main --> tf_aws_flow_log_main
tf_aws_vpc_main --> tf_aws_internet_gateway_main
tf_aws_vpc_main --> tf_aws_route_table_private
tf_aws_vpc_main --> tf_aws_route_table_public
tf_aws_vpc_main --> tf_aws_security_group_main
tf_aws_vpc_main --> tf_aws_subnet_private
tf_aws_vpc_main --> tf_aws_subnet_private_2
tf_aws_vpc_main --> tf_aws_subnet_public
tf_aws_vpc_main --> tf_aws_subnet_public_2
```

Assumptions: Connections represent inferred references (including depends_on and attribute references).

Rendered diagram: available as workflow artifact

Rendered PNG/JPEG/SVG are uploaded as workflow artifacts.
Run: https://github.com/suryakumaran2611/mlops-multi-account-terraform/actions/runs/22038002647
