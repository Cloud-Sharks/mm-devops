Title: aline-eks
Description:
This is a collection of configuration files that allow for the creation of an Amazon EKS cluster, the deployment of a managed nodegroup on it,
and the deployment of Aline Financial's banking application's microservices onto them.

How-to: Install and Run
    1. Ensure base infrastructure is set-up so that the EKS cluster can be supported. 
    Base infrastructure includes a VPC, RDS instance, private and public subnets, route tables and route table associations,
    NAT gateways, Internet Gateways, security groups, and IAM roles.
    You can set-up your own base infrastructure or run deploy the base infrastructure defined in the "terraform" folder.
    2. Make sure that Kubernetes and eksctl are installed and that all variables in the files are set.
    3. Ensure that the Kubernetes ConfigMap and Secret are applied. 
    3. Create the cluster and nodegroup, then deploy the database service
        eksctl create cluster -f cluster.yml
        kubectl apply -f db-service.yml
    4. Go to the microservices directory and run the deploy shell script, this will deploy all the microservices with their respective services.

How it works.
    Doing this will deploy the Aline application's microservices onto a created EKS cluster. The cluster is created and a managed nodegroup is deployed.
    The nodegroup is an autoscaling group so the provisioning and lifecycle management of the nodes (EC2 instances) for the EKS cluster is automated.
    The services that are run, that typically live in a K8s etc, now live inside the EKS control plane. The deployments of the actual microservices reside
    inside the nodes, which are placed in the private subnets. 
    
    The way this environment is set-up, two nodes live together in each of the private subnets. Depending on the node/instance type specified, and the
    requests and limits specified in the K8s files, the amount of microservices living inside of each node will vary.

    For further information on how the networking works, refer to the terraform directory.