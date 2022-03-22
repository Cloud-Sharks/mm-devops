Title: aline-ecs
Description:
This is the docker-compose.yml that is used to deploy the Aline application's microservices on ECS. 

How-to: Install and Run
    1. Run Docker. 
    2. Once Docker is running, create an ECS context. 
        docker context create ecs <ecs_context_name>
    3. Switch to the ECS context (or specify the context flag when running the docker-compose.yml file with --context <ecs_context_name>)
        docker context use <ecs_context_name>
    4. Ensure that all variables are set. 
    5. Run docker compose up to start the Compose application and docker compose down to stop it. 

How it works.
The functionality behind this lies in Docker's ECS integration. The ECS integration automatically converts the Docker Compose model into a CloudFormation
template. To generate the template, one can actually use "docker compose convert" to view the specific template that is generated and used to launch the
ECS cluster with Fargate instances. 

Docker Compose to CloudFormation mappings:
Each of the microservices defined in the Docker Compose definition is mapped to a TaskDefinition. Keep in AWS (ECS), a TaskDefinition is a container configuration.
It defines what image to use, ports to expose, how much CPI and memory to be allocated, how to collect logs, and define environment variables.
A Task is then created for each of the microservices; this actually launches the container(s) defined in the TaskDefinition. 
All of the microservices' tasks and task definitions form a Service; A Service is reponsible for replacing failed Tasks, referencing TaskDefinitions, and creating
the new Tasks. 
Each of the ports that are used in the Docker Compose definition is mapped to an IngressRule and a load balancer's Listener. 
A TargetGroup is also created per service to dispatch traffic (via the load balancer) to the matching containers. 
IAM Roles are created and configured as TaskExecutionRoles which are assigned to each of the microservices, granting access to AWS resources. 

Environment variables.
Environment variables for each container are set using two .env files: .env and var.env
    - .env is a default environment file that is set in the base of the project directory (Version supported: 1.28+). This sets default values and thus
        can be used to set the PORTS each microservice uses. It sets environment variables for the host build
        i.e. UNDERWRITER_PORT is set in the .env file
    - var.env is an environment file that contains all other environment variables for the actual application. env_file can only set the environment variables
        for the Docker container itself
        i.e. DB_USERNAME is set in the var.env file