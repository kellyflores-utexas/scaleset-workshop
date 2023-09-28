# Challenge 2: Scaling your Set
[< Previous Challenge](../01-scaleset/README.md) - **[Home](../../README.md)** - [Next Challenge >](../03-health/README.md)

## Introduction
We have three instances of our VM, which is cool and everything... but maybe we want more! Or fewer! Let's play with scaling!

## Description
In this exercise, we're going to manually scale our VMSS to 5 instances, then back to 3. Then we'll enable auto-scaling and see what happens.

**Hint**: You change the manual scale by modifying the `num_instances` in your `terraform.tfvars` file and running an `apply`, or you can use the `az` CLI (`az vmss scale`).
**Hint**: There is an auto-scale profile in the `Resources` directory for you to use for enabling autoscaling. Just copy it to your `Workspace`!

After you enable auto-scaling, you might notice that every time you run Terraform, it uses that `num_instances` field and resets whatever autoscale did to that number of instances! You can fix this with a Terraform lifecycle hook in `vmss.tf`, on the scaleset resource:

```
  lifecycle {
    ignore_changes = [
      instances
    ]
  }
```
We've left that in, commented out. You should probably uncomment it, and then see that no matter what you change `num_instances` to, it never messes with your autoscale rules!


## Success Criteria
1. You've manually scaled your VMSS
2. You've enabled autoscaling
3. You've seen the number of instances decrease over time