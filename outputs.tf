# פלט עבור ה-ID של ה-VPC שנוצר
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.vpc.vpc_id
}

# פלט עבור ה-Endpoint של בסיס הנתונים RDS
output "rds_endpoint" {
  description = "The endpoint of the RDS MySQL instance"
  value       = module.rds.db_instance_endpoint
}

# פלט עבור שם בסיס הנתונים
output "rds_db_name" {
  description = "The name of the RDS database"
  value       = module.rds.db_instance_name
}

# פלט עבור Security Group ID של ה-RDS
output "rds_security_group_id" {
  description = "The ID of the RDS Security Group"
  value       = module.rds.rds_security_group_id
}
