resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name      = "${var.name_prefix}-vpc"
    Component = "network"
  }
}

resource "aws_flow_log" "main" {
  iam_role_arn    = aws_iam_role.vpc_flow_logs_role.arn
  log_destination = aws_cloudwatch_log_group.main.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.main.id
}

resource "aws_cloudwatch_log_group" "main" {
  name              = "/aws/vpc/main-flow-logs"
  retention_in_days = 365
  tags = {
    Name      = "${var.name_prefix}-vpc-flow-logs"
    Component = "observability"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.128.0/20"
  availability_zone = "${var.region}a"
  tags = {
    Name      = "${var.name_prefix}-private-subnet-a"
    Tier      = "private"
    Component = "network"
  }
}
resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/20"
  availability_zone = "${var.region}b"
  tags = {
    Name      = "${var.name_prefix}-private-subnet-b"
    Tier      = "private"
    Component = "network"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.16.0/20"
  availability_zone = "${var.region}a"
  tags = {
    Name      = "${var.name_prefix}-public-subnet-a"
    Tier      = "public"
    Component = "network"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.144.0/20"
  availability_zone = "${var.region}b"
  tags = {
    Name      = "${var.name_prefix}-public-subnet-b"
    Tier      = "public"
    Component = "network"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name      = "${var.name_prefix}-igw"
    Component = "network"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id
  tags = {
    Name      = "${var.name_prefix}-nat"
    Component = "network"
  }
}

resource "aws_eip" "nat_eip" {
  vpc = true
  tags = {
    Name      = "${var.name_prefix}-nat-eip"
    Component = "network"
  }
}

resource "aws_security_group" "main" {
  name        = "sagemaker_sg"
  description = "Security group for Sagemaker"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name      = "${var.name_prefix}-sagemaker-sg"
    Component = "security"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Egress Self for ML instances to talk to each other."
  }
  ingress {
    protocol    = "-1"
    self        = true
    from_port   = 0
    to_port     = 0
    description = "Ingress Self for ML instances to talk to each other."
  }
}

/* Routing table for private subnet */
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name      = "${var.name_prefix}-rtb-private"
    Tier      = "private"
    Component = "network"
  }
}
#  Routing table for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name      = "${var.name_prefix}-rtb-public"
    Tier      = "public"
    Component = "network"
  }
}
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}
resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}
# Route table associations */
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}
