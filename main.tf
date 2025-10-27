module "state_backend" {
  source         = "./modules/state-backend"
  bucket_name    = "tf-state-${random_id.bucket_suffix.hex}" # using random suffix for uniqueness
  region         = var.region
  dynamodb_table = "terraform-lock-table-${random_id.bucket_suffix.hex}"
  account_id     = var.account_id
  user_name      = var.user_name
  role_name      = "terraform-backend-role-${random_id.bucket_suffix.hex}"
  policy_name    = "terraform-backend-policy-${random_id.bucket_suffix.hex}"
}


module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  az                 = var.az
  name_suffix        = var.name_suffix
}

module "ec2" {
  source    = "./modules/ec2"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_id
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}



module "site_bucket" {
  source            = "./modules/s3"
  bucket_name       = var.site_bucket_name != "" ? var.site_bucket_name : "my-tf-site-bucket-${random_id.bucket_suffix.hex}"
  acl               = var.site_bucket_acl
  enable_versioning = var.enable_versioning
}


# Run a local upload after apply (requires AWS CLI and credentials configured on the machine running terraform)
resource "null_resource" "upload_site" {
  # ensure bucket and instance are created first
  depends_on = [module.site_bucket]


  provisioner "local-exec" {
    command = "bash -c 'if [ -d \"./deploy\" ]; then aws s3 sync ./deploy s3://${module.site_bucket.bucket_name} --acl ${var.site_bucket_acl}; else echo \"./deploy folder not found — skipping s3 sync\"; fi'"
  }
}



