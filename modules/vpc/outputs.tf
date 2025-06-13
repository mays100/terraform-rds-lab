# פלט עבור ID של ה-VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

# פלט עבור ID של תת-רשת ציבורית 1
output "public_subnet_1_id" {
  description = "The ID of public subnet 1"
  value       = aws_subnet.public_1.id
}

# פלט עבור ID של תת-רשת ציבורית 2
output "public_subnet_2_id" {
  description = "The ID of public subnet 2"
  value       = aws_subnet.public_2.id
}

# פלט עבור IDs של כל תתי-הרשתות הציבוריות
output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}
