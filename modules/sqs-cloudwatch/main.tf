locals {
  metrics = [
    {
      name        = "ApproximateNumberOfMessagesVisible"
      threshold   = 20
      comparison  = "GreaterThanOrEqualToThreshold"
      period      = 60
      statistic   = "Maximum"
      description = "ApproximateNumberOfMessagesVisible exceeds 20"
    },
    {
      name        = "ApproximateAgeOfOldestMessage"
      threshold   = 120
      comparison  = "GreaterThanOrEqualToThreshold"
      period      = 60
      statistic   = "Maximum"
      description = "ApproximateAgeOfOldestMessage exceeds 120 seconds"
    }
  ]
}

locals {
  queue_metric_pairs = flatten([
    for queue in var.sqs_queues : [
      for metric in local.metrics : {
        queue  = queue
        metric = metric
      }
    ]
  ])
}

#SNS topoc for notification 
resource "aws_sns_topic" "sns_topic" {
  name = var.topic_name
  # Additional configurations for SNS topic if needed
}

# Create CloudWatch alarms for each SQS queue
resource "aws_cloudwatch_metric_alarm" "sqs_alarms" {
  for_each = {
    for pair in local.queue_metric_pairs :
    "${pair.queue}-${pair.metric.name}" => pair
  }

  alarm_name          = "${each.value.queue}-${each.value.metric.name}-${var.enviornment}"
  comparison_operator = each.value.metric.comparison
  evaluation_periods  = 1
  metric_name         = each.value.metric.name
  namespace           = "AWS/SQS"
  period              = each.value.metric.period
  statistic           = each.value.metric.statistic
  threshold           = each.value.metric.threshold
  alarm_description   = "${each.value.metric.description} for queue ${each.value.queue}"
  alarm_actions       = [aws_sns_topic.sns_topic.arn]
  ok_actions          = [aws_sns_topic.sns_topic.arn]
  dimensions = {
    QueueName = each.value.queue
  }
}