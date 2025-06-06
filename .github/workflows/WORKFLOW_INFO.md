# Workflow info
These GitHub actions use a few secrets and enviroment variables. This file lists them all and their purpose.

## Environment variables

| Name             | Purpose                                                                 | trigger.on-push-main | trigger.on-schedule-cron.weekly |
|:-----------------|:------------------------------------------------------------------------|:--------------------:|:-------------------------------:|
| IMAGE_REPOSITORY | The full OCI image repository path where the images should be pushed to |         `x`          |               `x`               |

## Secrets

| Name                  | Purpose                                                                       | action.image-build |
|:----------------------|:------------------------------------------------------------------------------|:------------------:|
| REGISTRY_USERNAME     | The username to use while authenticating with the image registry              |        `x`         |
| REGISTRY_ACCESS_TOKEN | The Personal Access Token to use while authenticating with the image registry |        `x`         |
