run:
	@kubectl apply -f pvc.yaml
	@kubectl apply -f secret.yaml
	@kubectl apply -f back-deployment.yaml
	@kubectl apply -f back-service.yaml
	@kubectl apply -f data-deployment.yaml
	@kubectl apply -f data-service.yaml
	@kubectl apply -f front-deployment.yaml
	@kubectl apply -f front-service.yaml

fill-db:
	@kubectl apply -f data-script-deployment.yaml

stop:
	@kubectl delete -f back-deployment.yaml
	@kubectl delete -f back-service.yaml
	@kubectl delete -f data-deployment.yaml
	@kubectl delete -f data-service.yaml
	@kubectl delete -f front-deployment.yaml
	@kubectl delete -f front-service.yaml
	@kubectl delete -f secret.yaml
clean: stop
	@kubectl delete -f pvc.yaml
