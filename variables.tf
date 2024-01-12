variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "secondary_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "List of secondary CIDR blocks for the VPC."
}

variable "enable_dns_hostnames" {
  default     = true
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
}

variable "enable_dns_support" {
  default     = true
  type        = bool
  description = "A boolean flag to enable/disable DNS support in the VPC."
}

variable "enable_private_db_subnet_routing_table" {
  description = "Should be true if you want to have dedicated routing table for private database subnets. This require to pupulate private routing table with proper routes"
  type        = bool
  default     = false
}

variable "enable_private_subnet_routing_table" {
  description = "Should be true if you want to have dedicated routing table for private subnets. This require to pupulate private routing table with proper routes"
  type        = bool
  default     = false
}

variable "enable_vpc_flow_logs" {
  default     = true
  type        = bool
  description = "A boolean flag to enable/disable VPC Flow Logs in the VPC."
}

variable "enabled_nat_gateway" {
  default     = true
  type        = bool
  description = "Set to false to prevent the module from creating NAT Gateway resources."
}

variable "enabled_single_nat_gateway" {
  default     = false
  type        = bool
  description = "Set to true to create single NAT Gateway resource."
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Type of environment, DEV, UAT, PROD, QA, etc "
}

variable "flow_log_traffic_type" {
  default     = "ALL"
  description = "https://www.terraform.io/docs/providers/aws/r/flow_log.html#traffic_type"
}

variable "instance_tenancy" {
  default     = "default"
  type        = string
  description = "A tenancy option for instances launched into the VPC."
}

variable "map_public_ip_on_launch" {
  default     = true
  type        = string
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
}

variable "private_db_subnet_cidr_blocks" {
  default     = ["10.150.13.0/24", "10.150.14.0/24"]
  type        = list(string)
  description = "The CIDR blocks for the database private subnets."
}

variable "private_subnet_cidr_blocks" {
  default     = ["10.150.1.0/24", "10.150.2.0/24"]
  type        = list(string)
  description = "The CIDR blocks for the private subnets."
}

variable "namespace" {
  default     = "all"
  type        = string
  description = "Resources namespace identifier(added to resources names)"
}

variable "public_subnet_cidr_blocks" {
  default     = ["10.150.11.0/24", "10.150.12.0/24"]
  type        = list(string)
  description = "The CIDR blocks for the public subnets."
}

variable "region" {
  type        = string
  default     = "eu-central-1"
  description = "AWS Region in which resources will be created, needed  for VPC peering"
}

# variable "peer_vpc_id" {
#   type = string
#   default = "???"
#   description = "???"
# }