# Challenge 1: Create a Scaleset
**[Home](../../README.md)** - [Next Challenge >](../02-scaling/README.md)

## Introduction

In this exercise, we're going to create and explore a Virtual Machine Scaleset using Terraform. 

## Description

Let's start things off on the right foot! Since our subsequent exercises will build on this one by adding or changing resources, let's make sure we're set up.

1. Copy the contents of the `Resources/terraform` directory to the `Workspace` directory at the root of this repository. Since Terraform tracks resource state and we don't want to have to mess around with state storage, we'll keep all of our Terraform and TF state in the `Workspace` directory, then progressively tweak our `Workspace` Terraform.
2. Open up the `Workspace` directory in your editor of choice (we recommend VS Code!)
3. Take a minute. Breathe. Then review the Terraform and get a sense of what's going on here. You'll be digging around in there sooner or later, so it's a good idea to familiarize yourself with it!
4. There's only one thing we need to update for this exercise: the `terraform.tfvars` file has a value called `unique_identifier`. This will help ensure your resource names are unique and don't collide with any other participants. We recommend your initials and a few random numbers. 
5. Log in to Azure with the Azure CLI
6. Run `terraform init` to set up Terraform
7. Run a `terraform plan` and take a look at it. It's beautiful, isn't it? Of course, if you're really, *really* confident, you can skip right to `apply`.
8. Run a `terraform apply` and let 'er rip! You'll have a VMSS in a few minutes. Your resources will show up in the resource group `vmss-workshop-your-unique-identifier` The waiting is the hardest part...
9. Behold your glorious ScaleSet! Make sure to also behold it in the Azure Portal and poke around a bit!
10. Find one of your instances' public IPs and load it up in a browser (`http://<ip address>/index.php`). There's a wonderful surprise awaiting!

## Terraform layout

|File|Contents|
|--|--|
|`rg.tf`|Contains resource group definition|
|`network.tf`|Contains networking resources. This solution sets up a virtual network with one subnet and an NSG allowing inbound access on ports 80, 443, and 22|
|`vmss.tf`|Contains the scaleset definition|

## Success Criteria
1. You've set up a workspace and a unique ID for your Terraform
2. You've reviewed the Terraform
3. You've successfully run an `apply` and created the resources
4. You've looked over the various properties, knobs, and dials of the scaleset in the Azure Portal.
5. You've loaded the app on one or two of your scaleset instances