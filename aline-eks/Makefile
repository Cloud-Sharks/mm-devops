cluster:
	@envsubst < cluster.yml | eksctl create cluster -f -

data:
	@envsubst < db-service.yml | kubectl apply -f -
	@envsubst < configmap.yml | kubectl apply -f -
	@envsubst < secret.yml | kubectl apply -f -

services:
	@envsubst < bank.yml | kubectl apply -f -
	@envsubst < transaction.yml | kubectl apply -f -
	@envsubst < underwriter.yml | kubectl apply -f -
	@envsubst < user.yml | kubectl apply -f -


destroy:
	@kubectl delete deployment user-deployment -n mm-aline
	@kubectl delete deployment bank-deployment -n mm-aline
	@kubectl delete deployment transaction-deployment -n mm-aline
	@kubectl delete deployment underwriter-deployment -n mm-aline
