# Define CloudWatch alarm for Redis Database Memory Usage Percentage
resource "aws_cloudwatch_metric_alarm" "redis_memory_usage" {
  alarm_name          = "${Redis-DatabaseMemoryUsagePercentage-High}-${var.enviornment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "DatabaseMemoryUsagePercentage"
  namespace           = "AWS/ElastiCache"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  dimensions = {
    CacheClusterId = var.redis_instance_id
  }
  alarm_description = "Alarm when Redis Database Memory Usage Percentage exceeds 80%"
}