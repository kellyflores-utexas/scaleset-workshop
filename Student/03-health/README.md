# Challenge 3: Checking your Health
[< Previous Challenge](../02-scaling/README.md) - **[Home](../../README.md)** - [Next Challenge >](../04-loadbalancing/README.md)

## Introduction
Let's put some health monitoring in place and then *break stuff* to see how VMSS helps keep our app running no matter what!

## Description

Remove `autoscale.tf` from our previous exercise, and comment out that lifecycle hook in `vmss.tf`! We want 3 instances running for this.

Modify your `vmss.tf` to add the health extension and enable automatic instance repair:
```
  # Enable automatic instance repair, so that if a VM instance fails, it will be replaced
  automatic_instance_repair {
    enabled      = true
    grace_period = "PT10M"
  }
  # Enable application health extension to report instance health Azure. This is required for automatic instance repair to work.
  extension {
    name                 = "health"
    publisher            = "Microsoft.ManagedServices"
    type                 = "ApplicationHealthLinux"
    type_handler_version = "1.0"
    settings = jsonencode({
      "protocol"    = "http"
      "port"        = 80
      "requestPath" = "/"
    })
  }
```
This sets up an HTTP health probe on port 80 to the root of the application, and will replace any instance that's unhealthy after 10 minutes.

This profile sets up the extension on *new* instances, not existing instances. You'll need to either separately install the extension on existing instances, or delete the instances and let them be recreated after `terraform apply`. We recommend doing a scale-to-0 with `az vmss scale`! If you don't feel like messing around with it, you can always do a `terraform destroy` to tear down all of the resources and then `terraform apply` to recreate *everything*.

Check out your instances in the portal to see if they start showing up as "healthy"
Once you have three healthy instances, SSH into the public IP of one of them and break it: `sudo /etc/init.d/apache2 stop`. This will stop the web server, which will definitely break your health probe on that instance! The instance will turn "unhealthy" after a little bit.

After 10-15 minutes, you should see the instance is gone, and a new, healthy instance has replaced it!

*Note*: A modified `vmss.tf` is available in `Resources/terraform` as a reference if you get stuck!
*Note*: The portal may not show the "automatic instance repair" as enabled, but it is!
*Note*: Your VMs have a username of `azureuser` and a password of `P@ssword123!`

## Success Criteria
1. You've turned off autoscaling
2. You've enabled application health monitoring and seen healthy instances
3. You've broken a health instance and seen it turn to unhealthy
4. You've seen the unhealthy instance get replaced