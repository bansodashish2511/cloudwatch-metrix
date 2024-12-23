module "cloudwatch_ec2" {
  source     = "./modules/ec2-cloudwatch"
  InstanceId = var.InstanceId

}

module "cloudwatch_rds" {
  source           = "./modules/rds-cloudwatch"
  rds_instance_ids = ["var.rds_instance_ids"]
  rds_cluster_ids  = ["var.rds_cluster_ids"]

}

# module "cloudwatch_redis" {
#   source            = "./modules/redis-cloudwatch"
#   redis_instance_id = var.redis_instance_id

# }

module "cloudwatch_sqs" {
  source     = "./modules/sqs-cloudwatch"
  topic_name = var.topic_name
  sqs_queues = var.sqs_queues

}

