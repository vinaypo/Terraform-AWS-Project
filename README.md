# Terraform-AWS-Project
Terraform-AWS-Project
![aws_terraform project](https://github.com/user-attachments/assets/f351c0b8-215a-4439-933f-d69055f09d07)

In a Terraform project for deploying AWS resources, the structure is organized to separate different components and configurations for better manageability and reusability.

```
terraform-aws-project/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── backend.tf
├── modules/
│   ├── VPC/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── EC2-Instances/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── IAM-Role/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf

```

main.tf: It is the main configuration file where I have defined the root module and include other modules. It typically contains high-level resources and module calls.

variables.tf: I have used this file to define the input variables for the project. Variables allow you to parameterize your configuration and make it reusable.

outputs.tf: This file defines the output values that are exported from the project. Outputs are useful for displaying information and passing data between modules.

provider.tf: This file configures the provider like AWS that Terraform will use to manage resources. It includes provider-specific settings such as region.

backend.tf: This file configures the backend for storing the Terraform state. Common backends include S3 for AWS.

modules/: This directory contains reusable modules. Each module is a self-contained package of Terraform configurations that manage a specific set of resources. The outputs of the modules has been used in the root(main.tf) file.

VPC: This module manages the Virtual Private Cloud (VPC) and related resources such as subnets, route tables, and gateways.

EC2-Instances: This module manages EC2 instances and related resources.

ELB: This module manges ELB and related resources such as targetgroups, ec2 instances attachments.

IAM-Role: This module manages IAM roles and policies.

-----------------------------------------------------------------------------------

## Important terraform commands to run the files


1. initialized a working directory containing Terraform configuration files including the backend for statefiles.
```
terraform init
```
2. validated the terraform files by using the below command
```
terraform validate
```
3. This command provides the preview of the execution files for the infrastructure variables,
-var-file is used as the .tfvars are in another folder
```
terraform plan -var-file= ./tester/testing.tfvars
```
4. This command is used to execute the actions proposed in a Terraform plan for creating the infrastructure.
```
terraform apply -var-file= ./tester/testing.tfvars
```

### Project is deployed on AWS using terraform🎉
