install:
	@kubectl apply -f cluster.yml
	@kubectl apply -f db-service.yml
	@kubectl apply -f configmap.yml
	@kubectl apply -f secret.yml
	@cd microservices
	@kubectl apply -f bank.yml
	@kubectl apply -f transaction.yml
	@kubectl apply -f underwriter.yml
	@kubectl apply -f user.yml

deploy:
	@kubectl apply -f user.yml
	@kubectl apply -f bank.yml
	@kubectl apply -f transaction.yml
	@kubectl apply -f underwriter.yml

destroy:
	@kubectl delete deployment user-deployment
	@kubectl delete deployment bank-deployment
	@kubectl delete deployment transaction-deployment
	@kubectl delete deployment underwriter-deployment