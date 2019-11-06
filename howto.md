### prerequisites
1. aws account
2. aws credentials (at ~/.aws/credentials)


### creating a virtual machine in aws for docker

1. Create ec2 instance (vm) using aws-cli

```
AMI=ami-02df9ea15c1778c9c
TYPE=t3.medium
KEY=dev_access_key
SUBNET=subnet-db6bf992
SECURITY_GROUP=sg-0dd8b70438998c681

aws ec2 run-instances --count 1 \
    --image-id ${AMI} \
    --instance-type ${TYPE} \
    --key-name ${KEY} \
    --security-group-ids ${SECURITY_GROUP} \
    --subnet-id ${SUBNET} \
    --associate-public-ip-address

### outputs json with instance params ###
```
2. Query for the public ip. u need to set the InstanceId from the output of the last command

```
# assuming InstanceId=i-0bea081618b29e49b
IID=i-0bea081618b29e49b
aws ec2 describe-instances \
    --instance-ids ${IID} \
    --query 'Reservations[*].Instances[*].PublicIpAddress' \
    --output text
### outputs ip, assuming 54.194.95.172 ###
```
3. Login to the instance with the key specified upon creation and enable password access for all users (its disabled by default)

```
ssh -i dev_access_key.pem ubuntu@54.194.95.172
ubuntu@ip-10-29-16-253:~$ sudo -i
root@ip-10-29-16-253:~# sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
root@ip-10-29-16-253:~# systemctl restart sshd.service



```
#ssh to server and enable password access via ssh


ubuntu@ip-10-29-16-253:~$ sudo useradd -m -p 1234 -s /bin/bash momo

root@ip-10-29-16-253:~#
root@ip-10-29-16-253:~# echo "momo1:1234" | chpasswd
root@ip-10-29-16-253:~#
root@ip-10-29-16-253:~#
root@ip-10-29-16-253:~#
root@ip-10-29-16-253:~# echo "momo:1234" | chpasswd

