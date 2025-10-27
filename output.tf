output "instance_public_ip" {
    value = module.ec2.instance_public_ip
}


output "instance_id" {
    value = module.ec2.instance_id
}


output "site_bucket_name" {
    value = module.site_bucket.bucket_name
}