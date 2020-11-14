eksctl utils associate-iam-oidc-provider \
    --region ap-northeast-1 \
    --cluster eks-try-2020-1 \
    --approve

aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy-1 \
    --policy-document file://iam-policy.json

# {
#     "Policy": {
#         "PolicyName": "AWSLoadBalancerControllerIAMPolicy-1",
#         "PolicyId": "ANPARPKBYTMYRXJJLJKWF",
#         "Arn": "arn:aws:iam::101606529841:policy/AWSLoadBalancerControllerIAMPolicy-1",
#         "Path": "/",
#         "DefaultVersionId": "v1",
#         "AttachmentCount": 0,
#         "PermissionsBoundaryUsageCount": 0,
#         "IsAttachable": true,
#         "CreateDate": "2020-11-14T06:43:04+00:00",
#         "UpdateDate": "2020-11-14T06:43:04+00:00"
#     }
# }


eksctl create iamserviceaccount \
  --cluster=eks-try-2020-1 \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --attach-policy-arn=arn:aws:iam::101606529841:policy/AWSLoadBalancerControllerIAMPolicy-1 \
  --override-existing-serviceaccounts \
  --approve
