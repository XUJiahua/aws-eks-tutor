test_loadbalancer:
	kubectl create namespace my-namespace && kubectl apply -f sample-service.yaml
test_ingress:
	kubectl apply -f 2048_full.yaml
