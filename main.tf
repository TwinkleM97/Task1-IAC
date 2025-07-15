resource "aws_s3_bucket" "buckets" {
  for_each = { for config in var.bucket_configs : config.name => config }
  bucket = "${each.value.name}-${var.studentid}"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "buckets" {
  for_each = { for config in var.bucket_configs : config.name => config }
  bucket                  = aws_s3_bucket.buckets[each.key].id
  block_public_acls       = each.value.block_public_acls
  block_public_policy     = each.value.block_public_policy
  ignore_public_acls      = each.value.ignore_public_acls
  restrict_public_buckets = each.value.restrict_public_buckets
}

# Define the path to the file to upload
locals {
  file_path = "${path.module}/content/file1"
}

# Upload file1 to each S3 bucket
resource "aws_s3_object" "file1" {
  for_each = aws_s3_bucket.buckets

  bucket = each.value.bucket
  key    = "file1"  # This is the name/path the file will have in the bucket
  source = local.file_path
  acl    = "private"  # Adjust the ACL as needed, e.g., "public-read" if required
}

/*

bucket_configs: This variable is a list of objects, each containing configurations for one S3 bucket. Each object includes:
name: The base name for the S3 bucket.
block_public_acls, block_public_policy, ignore_public_acls, and restrict_public_buckets: These are boolean values specifying the public access settings for each bucket.
studentid: This variable holds a unique identifier (e.g., a student ID) to help create unique bucket names.
Creating S3 Buckets (aws_s3_bucket resource):

for_each loop: The code uses a for_each loop to iterate over each item in bucket_configs. This creates an individual S3 bucket for each configuration.
bucket: Sets the bucket name by appending studentid to each base name to ensure uniqueness.
Configuring Public Access Blocks (aws_s3_bucket_public_access_block resource):

for_each: This resource also uses for_each, iterating over the aws_s3_bucket.buckets resource created earlier. It links each aws_s3_bucket_public_access_block with its corresponding S3 bucket.
bucket: Assigns the ID of each corresponding bucket to the bucket attribute.
Public Access Settings: The attributes block_public_acls, block_public_policy, ignore_public_acls, and restrict_public_buckets are configured based on the values defined in each item of bucket_configs.
Summary
This code defines a Terraform configuration to create multiple S3 buckets with specific names and public access restrictions. Each bucket's name is customized with a unique identifier, and public access settings are applied according to the provided configurations. The configuration dynamically creates and manages the resources by using for_each and ensures each bucket has a corresponding public access block policy in line with its settings in bucket_configs. This approach ensures modularity, scalability, and a clear structure for managing multiple S3 buckets and their access restrictions efficiently.

*/