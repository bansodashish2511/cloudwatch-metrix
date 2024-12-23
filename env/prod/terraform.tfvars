#Value of the Ec2 Instance Id
InstanceId = "i-01578ee938808e378"

# Values for the RDS 
rds_instance_ids = [
    "aurora-mysql-306"

]

#Value for the RDS clusters 
rds_cluster_ids = [
    "aurora-mysql-306-cluster"
]



# #Value for the Redis Instance
# redis_instance_id = ""


#Value for the sns topic 
topic_name = "Prod_RDS_instance_alerts"

#Value for the sqs Queue
sqs_queues = [
    "cloudwatch-poc-01",
    "Cloudwatch-poc.fifo"
]

region = "cn-north-1"

enviornment = "prod"

rds_sns_topic = "Prod_RDS_instance_alerts"