# terraform.code1

# you may get this errror and the solution of the problem is to use subnets that are recomende in the error. 

https://docs.aws.amazon.com/eks/latest/userguide/troubleshooting.html

Error: error creating EKS Cluster (my-cluster): UnsupportedAvailabilityZoneException: Cannot create cluster 'my-cluster' because us-east-1e, the targeted availability zone, does not currently have sufficient capacity to support the cluster. Retry and choose from these availability zones: us-east-1a, us-east-1b, us-east-1c, us-east-1d, us-east-1f
{
  RespMetadata: {
    StatusCode: 400,
    RequestID: "46dcc885-7bc6-4e4d-be72-b3b84bc8d388"
  },
  ClusterName: "my-cluster",
  Message_: "Cannot create cluster 'my-cluster' because us-east-1e, the targeted availability zone, does not currently have sufficient capacity to support the cluster. Retry and choose from these availability zones: us-east-1a, us-east-1b, us-east-1c, us-east-1d, us-east-1f",
  ValidZones: [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
    "us-east-1d",
    "us-east-1f"
  ]
}

  on .terraform/modules/my-cluster/terraform-aws-eks-12.0.0/cluster.tf line 9, in resource "aws_eks_cluster" "this":
   9: resource "aws_eks_cluster" "this" {