region = "cn-north-1"
enviornment = "prod"
rds_sns_topic = "prod_RDS_instance_alerts"
#Value of the Ec2 Instance Id
InstanceId = ["", "", ""]

# Values for the RDS 
rds_instance_ids = [
     #   "prod-olympus-reader2",
#   "prod-device-writer",
#   "prod-atlas-db-green-8uy4zo",
#   "prod-atlas-reader-green-ozfoth",
#   "prod-ums-instance-1",
#   "prod-stemi-2"

]

#Value for the RDS clusters 
rds_cluster_ids = [
#    "prod-prodice-cluster" = "prod-prodice-writer",
#    "prod-echo-cluster"   = "prod-atlas-db-green-8uy4zo",
#    "prod-echo-cluster"   = "prod-atlas-reader-green-ozfoth",
#    "prod-ums"            = "prod-ums-instance-1",
#    "prod-stemi"          = "prod-stemi-2"
]



# #Value for the Redis Instance
 redis_instance_id = ""


#Value for the sqs Queue
sqs_queues = [
    #   "prod-case-timedout-submission",
#   "prod-device-to-cloud-raw-s3",
#   "prod-medical-ai-integration",
#   "prod-dicom-sr-s3-errored",
#   "prod-wfm-timedout-nodecision",
#   "prod-wfm-timedout",
#   "prod-AWS_SQS_TV_QUEUE",
#   "prod-case-append-errored",
#   "prod-case-timedout-submission-errored",
#   "prod-device-to-cloud-raw-s3-errored",
#   "prod-medical-ai-integration-errored",
#   "prod-dicom-sr-s3-errored-errored",
#   "prod-wfm-timedout-nodecision-errored",
#   "prod-wfm-timedout-errored",
#   "prod-AWS_SQS_TV_QUEUE-errored",
#   "prod-cds100-to-wfm-errored",
#   "prod-wfm-to-cds100-errored",
#   "wfmprod2-echo-qa-process-errored",
#   "prod-echo-submission-errored",
#   "prod-dicom-sr-s3-errored",
#   "wfmprod2-sema-generation-errored"
]



enviornment = "dev"

rds_sns_topic = "prod_RDS_instance_alerts"