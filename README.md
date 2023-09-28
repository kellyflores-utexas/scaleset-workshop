# ScaleSet Workshop
## Introduction
This workshop builds on the concept discussed during the training presentations by having you create a VM scaleset and progressively enable features so that you can see and experience how those features function. By the end, you'll have created a VM scaleset that auto-scales, monitors workload health, and evenly distributes balances traffic to the VM instances in the scaleset.

We'll be using Terraform for these exercises, so hopefully you're already familiar! If not, don't worry -- you can always ask for help!

## Learning Objectives

## Challenges
- Challenge 1: **[Creating a ScaleSet](./Student/01-scaleset/README.md)**
   - Create a basic scaleset 3 instances
- Challenge 2: **[Scaling your Set](./Student/02-scaling/README.md)**
   - Manually scale your scaleset, then auto-scale it!
- Challenge 3: **[Checking your Health](./Student/03-health/README.md)**
   - Enable health checks and instance repair, make an instance unhealthy, then sit back and watch the show!
- Challenge 4: **[Balancing your Load](./Student/04-loadbalancing/README.md)**
   - Enable load balancing for your scaleset

## Prerequisites
- Access to an Azure subscription
   - If you don't have one, [Sign Up for Azure HERE](https://azure.microsoft.com/en-us/free/)
- [**Azure CLI**](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
   - (Windows-only) Install Azure CLI on Windows Subsystem for Linux
   - Update to the latest
   - Must be at least version 2.7.x
- Alternatively, you can use the [**Azure Cloud Shell**](https://shell.azure.com/)
- [**Visual Studio Code**](https://code.visualstudio.com/)
- Terraform CLI
- PuTTY or another SSH client
