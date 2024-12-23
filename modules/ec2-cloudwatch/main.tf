
# Define CloudWatch alarm for EC2 CPU Utilization
resource "aws_cloudwatch_metric_alarm" "ec2_cpu_utilization" {
  alarm_name          = "EC2-CPUUtilization-High"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  dimensions = {
    InstanceId = var.InstanceId # Replace with your EC2 instance ID
  }
  alarm_description = "Alarm when CPU Utilization exceeds 80%"
}

# Define CloudWatch alarm for EC2 Status Check Failed (Instance)
resource "aws_cloudwatch_metric_alarm" "ec2_status_check_failed_instance" {
  alarm_name          = "${EC2-StatusCheckFailed_Instance}-${var.enviornment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "StatusCheckFailed_Instance"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Maximum"
  threshold           = 1
  dimensions = {
    InstanceId = var.InstanceId # Replace with your EC2 instance ID
  }
  alarm_description = "Alarm when Status Check Failed (Instance) is greater than or equal to 1"
}

# Define CloudWatch alarm for EC2 Status Check Failed (System)
resource "aws_cloudwatch_metric_alarm" "ec2_status_check_failed_system" {
  alarm_name          = "${EC2-StatusCheckFailed_System}-${var.enviornment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "StatusCheckFailed_System"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Maximum"
  threshold           = 1
  dimensions = {
    InstanceId = var.InstanceId # Replace with your EC2 instance ID
  }
  alarm_description = "Alarm when Status Check Failed (System) is greater than or equal to 1"
}

# Define CloudWatch alarm for EC2 Memory Utilization using CloudWatch agent
resource "aws_cloudwatch_metric_alarm" "ec2_memory_utilization" {
  alarm_name          = "${EC2-MemoryUtilization-High}-${var.enviornment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "mem_used_percent"
  namespace           = "CWAgent"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  dimensions = {
    InstanceId = var.InstanceId # Replace with your EC2 instance ID
  }
  alarm_description = "Alarm when Memory Utilization exceeds 80%"
}

# Define CloudWatch alarm for Disk Utilization using CloudWatch agent
resource "aws_cloudwatch_metric_alarm" "ec2_disk_utilization" {
  alarm_name          = "EC2-DiskUtilization-High"
  comparison_operator = "${GreaterThanOrEqualToThreshold}-${var.enviornment}"
  evaluation_periods  = 1
  metric_name         = "disk_used_percent"
  namespace           = "CWAgent"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  dimensions = {
    InstanceId = var.InstanceId # Replace with your EC2 instance ID
  }
  alarm_description = "Alarm when Disk Utilization exceeds 80%"
}