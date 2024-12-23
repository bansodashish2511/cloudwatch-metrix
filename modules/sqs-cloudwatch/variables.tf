variable "sqs_queues" {
  description = "A list of SQS queue names"
  type        = list(string)
}

variable "topic_name" {
  type        = string
  description = "Sns topic name"

}

variable "enviornment" {
    type = string
  
}