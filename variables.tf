variable "rds_instance_ids" {
  description = "A list of RDS instance IDs"
  type        = list(string)
}

variable "rds_cluster_ids" {
  description = "A list of RDS cluster IDs"
  type        = list(string)
}


# variable "redis_instance_id" {
#   description = "The ID of the Redis instance"
#   type        = string
# }

variable "sqs_queues" {
  description = "A list of SQS queue names"
  type        = list(string)
}

variable "topic_name" {
  type        = string
  description = "Sns topic name"

}

variable "region" {
   type = string
}

variable "InstanceId" {
  type        = list(string)
  description = "Instance id for which the alert is configure"
}

variable "enviornment" {
    type = string 
}