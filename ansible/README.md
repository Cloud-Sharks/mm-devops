Title: ansible
Description:
This is an Ansible collection that currently provisions base infrastructure for a cloud environment. This includes
Day 0 architecture such as: VPCs, subnets, gateways, etc.

Future plans:
- Going forward, I'm refactoring my playbook to primarily deploy and configure my microservice clusters, with Terraform handling the
static infrastructure. 
- Integrating Ansible with Jenkins 

How to run it:
    1. Ensure that Ansible is installed and you are in the root directory
    2. To run a specific 

Project organization:
    - There are three (3) main components that make up the Ansible project
    1. Inventory files
        - Files: dev, production
    2. Playbooks
    Playbooks are collections of tasks to be executed.
    3. Roles
    Roles are the most crucial aspect of the organization. Roles signal to Ansible to automatically load variable files, 
    handlers, tasks, etc. based on the known file structure.
    Roles expect files to be in certain directory names and must include at least one of these directories, although it is 
    fine to exclude any that aren't being used. When in use, each directory must contain a main.yml file.
    Currently the Role being used is the "infrastructure" role, which is in charge of provisioning the cloud's static infrastructure.
    It comes with a corresponding playbook file ("infrastructure.yml")
    This project utilizes two of the Roles directories: tasks and vars.
    - The tasks/main.yml contains the main list of tasks to be executed by the role
    - The vars/main.yml contains the variables used for the role