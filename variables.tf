# הגדרת אזור ה-AWS
variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1" # ערך ברירת מחדל, ניתן לשנות ב-terraform.tfvars
}

# הגדרת CIDR עבור ה-VPC
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16" # ערך ברירת מחדל
}

# הגדרת CIDR עבור תת-רשת ציבורית 1
variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
  default     = "10.0.1.0/24" # ערך ברירת מחדל
}

# הגדרת CIDR עבור תת-רשת ציבורית 2
variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
  default     = "10.0.2.0/24" # ערך ברירת מחדל
}

# הגדרת אזור זמינות 1
variable "az1" {
  description = "Availability Zone 1"
  type        = string
  default     = "eu-central-1a" # ערך ברירת מחדל
}

# הגדרת אזור זמינות 2
variable "az2" {
  description = "Availability Zone 2"
  type        = string
  default     = "eu-central-1b" # ערך ברירת מודל
}

# שם משתמש לבסיס הנתונים (RDS)
variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
  default     = "admin" # ערך ברירת מחדל
}

# סיסמה לבסיס הנתונים (RDS)
variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true # מציין שהמשתנה רגיש ולא יודפס לפלט
}
