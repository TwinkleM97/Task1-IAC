aws_access_key = "key"
aws_secret_key = "secret"
aws_session_token= "token"
region = "us-east-1"
studentid = "8894858"
bucket_configs = [
  { 
    name                 = "bucket1", 
    block_public_acls    = true, 
    block_public_policy  = true, 
    ignore_public_acls   = true, 
    restrict_public_buckets = true 
  },
  { 
    name                 = "bucket2", 
    block_public_acls    = false, 
    block_public_policy  = true, 
    ignore_public_acls   = true, 
    restrict_public_buckets = false 
  },
  { 
    name                 = "bucket3", 
    block_public_acls    = true, 
    block_public_policy  = true, 
    ignore_public_acls   = false, 
    restrict_public_buckets = true 
  },
  { 
    name                 = "bucket4", 
    block_public_acls    = true, 
    block_public_policy  = false, 
    ignore_public_acls   = true, 
    restrict_public_buckets = true 
  }
]
