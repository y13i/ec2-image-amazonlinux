#!/bin/sh

export SOURCE_AMI=$(curl -s https://s3.amazonaws.com/latest-ami/${AWS_REGION}.json | jq --raw-output '.LatestImage.ImageId')
packer build packer.json
