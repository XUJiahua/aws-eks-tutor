eksctl utils associate-iam-oidc-provider \
    --region ap-northeast-1 \
    --cluster eks-try-2020-2 \
    --approve

curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json

aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy-2 \
    --policy-document file://iam-policy.json

# {
#     "Policy": {
#         "PolicyName": "AWSLoadBalancerControllerIAMPolicy-2",
#         "PolicyId": "ANPARPKBYTMYVV2D3PMYP",
#         "Arn": "arn:aws:iam::101606529841:policy/AWSLoadBalancerControllerIAMPolicy-2",
#         "Path": "/",
#         "DefaultVersionId": "v1",
#         "AttachmentCount": 0,
#         "PermissionsBoundaryUsageCount": 0,
#         "IsAttachable": true,
#         "CreateDate": "2020-11-18T09:10:19+00:00",
#         "UpdateDate": "2020-11-18T09:10:19+00:00"
#     }
# }

eksctl create iamserviceaccount \
  --cluster=eks-try-2020-2 \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --attach-policy-arn=arn:aws:iam::101606529841:policy/AWSLoadBalancerControllerIAMPolicy-2 \
  --override-existing-serviceaccounts \
  --approve
