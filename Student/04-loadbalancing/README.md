# Challenge 4: Balancing your Load
[< Previous Challenge](../03-health/README.md) - **[Home](../../README.md)**

## Introduction
Now we have three healthy instances that get auto-healed when something goes wrong, and even the ability to auto-scale them based on load! But we still have to access each instance individually, which is no good. Ideally, we'd have a single IP address that would route traffic to *any one* of our scaleset instances, hopefully evenly distributing traffic and making sure that no users have a bad, slow experience. 

Enter: Load Balancing!

We're going to set up two services:
- A NAT gateway to allow *outbound* access from our VMs via a single public IP address, instead of giving each VM its own public IP address
- A Load Balancer to allow balanced *inbound* access to our VMs from a single public IP address

## Description

Review the resources in `Resources/terraform`. There's a definition for a load balancer, a NAT gateway, and an association for the load balancer's backend to the VMSS instance. Try to understand what's happening and why it's happening -- feel free to ask questions!

Setting up a load balancer is too tough to ask you to do in a workshop setting, so feel free to just copy those files over into your `Workspace` directory.

After you `terraform apply`, be sure to scale to 0 (`az vmss scale`, or use the portal), then back to 3 instances -- this is necessary so that the load balancer picks up the VMs. You only need to do this when you're adding a load balancer to an existing VMSS instance; if everything were being created net new, it would all seamlessly happen. You can even confirm that if you'd like by `terraform destroy`ing and recreating from scratch!

## Success Criteria
1. You've enabled load balancing 
2. You can load your application through the load balancer's public IP and see the VM instance change periodically on refresh