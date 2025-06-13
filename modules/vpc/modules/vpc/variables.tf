# משתנה עבור CIDR של ה-VPC
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

# משתנה עבור CIDR של תת-רשת ציבורית 1
variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
}

# משתנה עבור CIDR של תת-רשת ציבורית 2
variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
}

# משתנה עבור אזור זמינות 1
variable "az1" {
  description = "Availability Zone 1"
  type        = string
}

# משתנה עבור אזור זמינות 2
variable "az2" {
  description = "Availability Zone 2"
  type        = string
}
