# EKS Cluster ID
output "cluster_id" {
  value = aws_eks_cluster.mycluster.id
  description = "EKS Cluster ID"
}

# EKS Node Group ID
output "node_group_id" {
  value = aws_eks_node_group.mynode.id
  description = "EKS Node Group ID"
}

# VPC ID
output "vpc_id" {
  value = aws_vpc.my_eks_vpc.id
  description = "VPC ID for the EKS cluster"
}

# Subnet IDs
output "subnet_ids" {
  value = aws_subnet.eks_subnet[*].id
  description = "Subnet IDs used by the EKS cluster"
}

output "cluster_endpoint" {
  value = aws_eks_cluster.mycluster.endpoint
  description = "EKS API server endpoint"
}

output "cluster_arn" {
  value = aws_eks_cluster.mycluster.arn
  description = "ARN of the EKS cluster"
}

