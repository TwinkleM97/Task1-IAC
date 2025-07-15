variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "aws_session_token" {
  description = "AWS session token (required for temporary credentials)"
  type        = string
}

variable "region" {
  description = "AWS region for bucket creation"
  type        = string
}

variable "studentid" {
  description = "AWS region for bucket creation"
  type        = string
}


variable "bucket_configs" {
  description = "List of bucket configurations"
  type = list(object({
    name                 = string
    block_public_acls    = bool
    block_public_policy  = bool
    ignore_public_acls   = bool
    restrict_public_buckets = bool
  }))
}
    