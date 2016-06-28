export INSTANCE_IDENTITY_DOCUMENT=`curl -s 169.254.169.254/latest/dynamic/instance-identity/document`
export AWS_ACCOUNT_ID=`echo $INSTANCE_IDENTITY_DOCUMENT | jq -r ".accountId"`
export AWS_REGION=`echo $INSTANCE_IDENTITY_DOCUMENT | jq -r ".region"`
export AVAILABILITY_ZONE=`echo $INSTANCE_IDENTITY_DOCUMENT | jq -r ".availabilityZone"`
export INSTANCE_ID=`echo $INSTANCE_IDENTITY_DOCUMENT | jq -r ".instanceId"`
export INSTANCE_TYPE=`echo $INSTANCE_IDENTITY_DOCUMENT | jq -r ".instanceType"`
export IMAGE_ID=`echo $INSTANCE_IDENTITY_DOCUMENT | jq -r ".imageId"`

export PUBLIC_HOSTNAME=`curl -s 169.254.169.254/latest/meta-data/public-hostname | head -n 1 | grep -e "^[^<]"`

_tagged_name=$(aws ec2 describe-instances --region $AWS_REGION --instance-ids $INSTANCE_ID --query 'Reservations[].Instances[].[Tags[?Key==`Name`].Value]' --output text 2>/dev/null)

if [ $? -eq 0 ]; then
  export TAGGED_NAME=$_tagged_name
fi
