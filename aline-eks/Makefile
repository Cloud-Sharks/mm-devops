deploy:
	@envsubst < cluster.yml | eksctl create cluster -f -
	@envsubst < db-service.yml | kubectl apply -f -
	@envsubst < configmap.yml | kubectl apply -f -
	@envsubst < secret.yml | kubectl apply -f -
	@envsubst < microservices/bank.yml | kubectl apply -f -
	@envsubst < microservices/transaction.yml | kubectl apply -f -
	@envsubst < microservices/underwriter.yml | kubectl apply -f -
	@envsubst < microservices/user.yml | kubectl apply -f -

destroy:
	@kubectl delete deployment user-deployment
	@kubectl delete deployment bank-deployment
	@kubectl delete deployment transaction-deployment
	@kubectl delete deployment underwriter-deployment
