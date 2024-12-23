variable "rds_instance_ids" {
  description = "A list of RDS instance IDs"
  type        = list(string)
}

variable "rds_cluster_ids" {
  description = "A list of RDS cluster IDs"
  type        = list(string)
}

variable "enviornment" {
    type = string
  
}

variable "rds_sns_topic" {
    type = string
    description = "Sns Topic Name"
}