# ========================
# EKS Cluster Outputs
# ========================

output "cluster_id" {
  description = "EKS Cluster ID"
  value       = aws_eks_cluster.eks.id
}

output "cluster_arn" {
  description = "ARN of the EKS cluster"
  value       = aws_eks_cluster.eks.arn
}

output "cluster_endpoint" {
  description = "EKS API server endpoint"
  value       = aws_eks_cluster.eks.endpoint
}

# ========================
# Node Group Outputs
# ========================

output "node_group_id" {
  description = "EKS Node Group ID"
  value       = aws_eks_node_group.eks_nodes.id
}

# ========================
# Networking Outputs
# ========================

output "vpc_id" {
  description = "VPC ID for the EKS cluster"
  value       = aws_vpc.my_eks_vpc.id
}

output "subnet_ids" {
  description = "Subnet IDs used by the EKS cluster"
  value       = aws_subnet.eks_subnet[*].id
}


