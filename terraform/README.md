Title: terraform
Description:
This is a collection of Terraform configuration files that creates base AWS cloud infrastructure. 

How-to: Install and Run
    1. Ensure Terraform is installed on your machine.
    2. Move to the deploy directory and initialize it. 
        terraform init
    3. Create an execution plan to preview the changes that Terraform plans to make with the infrastructure
        terraform plan
    4. Apply the execution plan 
        terraform apply

How it works.
    A core VPC is created with a CIDR block that can be configured.

    Two public subnets are created, and two private subnets are created; their CIDR blocks can also be configured. 
    The amount of subnets created also depends on how many CIDR blocks are specified for them in the list. The subnets and
    their related resources are placed in different availability zones. The logic behind this is so that if one were to go 
    down, the other availability zone is still up. 

    Route table associations are created. Every subnet must be associated with some route table. In this case, each private
    subnet has its own route table and isassociated with that. While the two public subnets share a route table. 

    Route tables are created. One for each private subnet, one that is shared between the public subnets, and main route 
    table for the VPC is created by default (though that too can be created with Terraform).

    A NAT gateway is created, to provide Internet access to all of the private resources. It is placed in a public subnet
    and a route/entry with the NAT gateway ID is created in each private subnet's route table.
    An Elastic IP is also created, which is necessary to create the NAT gateway. This is because the Elastic IP address
    (or EIP) will be used to replace the source IP address of the private resources. 

    An Internet gateway is created and attached to the VPC. A route/entry with the Internet gateway ID is then created in
    the route table(s) for the public subnets. Note that this association with the Internet gateway is what actually makes
    the subnets public.

    A security group is created that allows SSH inbound connections. This security group is then attached to the overall VPC.

    Necessary resource attribute references (such as id's) are saved and stored as secrets in AWS SecretsManager