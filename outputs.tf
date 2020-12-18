output public_dns_name {
  description = "Public DNS name of load balancer"
  value       = module.elb_http.this_elb_dns_name
}

output instance_ids {
  description = "IDs of EC2 instances"
  value       = [aws_instance.app.*.id]
}

output use-snapshot {
  value       = var.use-snapshot
}