locals {
  metrics = [
    {
      name        = "CPUUtilization"
      threshold   = 80
      comparison  = "GreaterThanOrEqualToThreshold"
      statistic   = "Average"
      period      = 300
      description = "CPU Utilization exceeds 80%"
    },
    {
      name        = "DBLoad"
      threshold   = 70
      comparison  = "GreaterThanOrEqualToThreshold"
      statistic   = "Average"
      period      = 300
      description = "DB Load exceeds 70%"
    },
    {
      name        = "FreeableMemory"
      threshold   = 500000000
      comparison  = "LessThanOrEqualToThreshold"
      statistic   = "Average"
      period      = 300
      description = "Freeable Memory less than 500MB"
    },
    {
      name        = "RowLockTime"
      threshold   = 1000000
      comparison  = "GreaterThanOrEqualToThreshold"
      statistic   = "Sum"
      period      = 300
      description = "Row Lock Time exceeds 1 second"
    }
  ]
}

locals {
  instance_metric_pairs = flatten([
    for instance_id in var.rds_instance_ids : [
      for metric in local.metrics : {
        instance_id = instance_id
        metric      = metric
      }
    ]
  ])

  cluster_metric_pairs = flatten([
    for cluster_id, instance_id in var.rds_cluster_ids : [
      for metric in local.metrics : {
        cluster_id  = cluster_id
        instance_id = instance_id
        metric      = metric
      }
    ]
  ])
}

resource "aws_sns_topic" "sns_topic" {
  name = var.rds_sns_topic
  # Additional configurations for SNS topic if needed
}

# Create alarms for individual RDS instances
resource "aws_cloudwatch_metric_alarm" "rds_instance_alarms" {
  for_each = {
    for pair in local.instance_metric_pairs :
    "${pair.instance_id}-${pair.metric.name}" => pair
  }

  alarm_name          = "${each.value.instance_id}-${each.value.metric.name}-${var.enviornment}-alarm"
  comparison_operator = each.value.metric.comparison
  evaluation_periods  = 1
  metric_name         = each.value.metric.name
  namespace           = "AWS/RDS"
  period              = each.value.metric.period
  statistic           = each.value.metric.statistic
  threshold           = each.value.metric.threshold
  alarm_description   = "${each.value.metric.description} for instance ${each.value.instance_id}"
  alarm_actions       = [aws_sns_topic.sns_topic.arn]
  ok_actions          = [aws_sns_topic.sns_topic.arn]
  dimensions = {
    DBInstanceIdentifier = each.value.instance_id
  }
}

# Create alarms for RDS clusters
resource "aws_cloudwatch_metric_alarm" "rds_cluster_alarms" {
  for_each = {
    for pair in local.cluster_metric_pairs :
    "${pair.cluster_id}-${pair.instance_id}-${pair.metric.name}" => pair
  }

  alarm_name          = "${each.value.cluster_id}-${each.value.instance_id}-${each.value.metric.name}-${var.enviornment}-alarm"
  comparison_operator = each.value.metric.comparison
  evaluation_periods  = 1
  metric_name         = each.value.metric.name
  namespace           = "AWS/RDS"
  period              = each.value.metric.period
  statistic           = each.value.metric.statistic
  threshold           = each.value.metric.threshold
  alarm_description   = "${each.value.metric.description} for cluster ${each.value.cluster_id} and instance ${each.value.instance_id}"
  alarm_actions       = [aws_sns_topic.sns_topic.arn]
  ok_actions          = [aws_sns_topic.sns_topic.arn]
  dimensions = {
    DBClusterIdentifier  = each.value.cluster_id
    DBInstanceIdentifier = each.value.instance_id
  }
}