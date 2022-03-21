deploy:
	@envsubst < cluster.yml | eksctl create cluster -f -
	@envsubst < db-service.yml | kubectl apply -f -
	@envsubst < configmap.yml | kubectl apply -f -
	@envsubst < secret.yml | kubectl apply -f -
	@cd microservices
	@envsubst < bank.yml | kubectl apply -f -
	@envsubst < transaction.yml | kubectl apply -f -
	@envsubst < underwriter.yml | kubectl apply -f -
	@envsubst < user.yml | kubectl apply -f -

destroy:
	@kubectl delete deployment user-deployment
	@kubectl delete deployment bank-deployment
	@kubectl delete deployment transaction-deployment
	@kubectl delete deployment underwriter-deployment