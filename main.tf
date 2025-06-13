# קריאה למודול VPC
module "vpc" {
  source = "./modules/vpc" # נתיב למודול VPC

  vpc_cidr           = var.vpc_cidr
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  az1                = var.az1
  az2                = var.az2
}

# קריאה למודול DB Subnet Group
module "db_subnet_group" {
  source = "./modules/db_subnet_group" # נתיב למודול DB Subnet Group

  subnet_ids = module.vpc.public_subnet_ids # מעביר את IDs של תתי-הרשתות הציבוריות מה-VPC
}

# קריאה למודול RDS
module "rds" {
  source = "./modules/rds" # נתיב למודול RDS

  vpc_id               = module.vpc.vpc_id # מעביר את ID ה-VPC
  vpc_cidr             = var.vpc_cidr # מעביר את CIDR של ה-VPC ל-Security Group של ה-RDS
  db_username          = var.db_username
  db_password          = var.db_password
  db_subnet_group_name = module.db_subnet_group.db_subnet_group_name # מעביר את שם קבוצת תתי-הרשתות
}
