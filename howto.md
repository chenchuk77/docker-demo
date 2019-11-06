### prerequisites
1. aws account
2. aws credentials (at ~/.aws/credentials)


### creating a virtual machine in aws for docker

1. Create ec2 instance (vm) using aws-cli

```
# setup local variables
AMI=ami-02df9ea15c1778c9c
TYPE=t3.medium
KEY=dev_access_key
SUBNET=subnet-db6bf992
SECURITY_GROUP=sg-0dd8b70438998c681

# invoke ec2 request to create instance
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

4. Clone the repo into the new server. run script to add users

```
root@ip-10-29-16-253:~# git clone https://github.com/chenchuk77/docker-demo.git
root@ip-10-29-16-253:~# cd docker-demo
root@ip-10-29-16-253:~/docker-demo# ./make-users.sh avi eli ran
creating user: avi
creating user: eli
creating user: ran
done.
root@ip-10-29-16-253:~/docker-demo#
```

5. Try login as different user with simple password (1234)

```
root@ip-10-29-16-253:~/docker-demo# exit    # exit from root session
ubuntu@ip-10-29-16-253:~$ exit              # exit from ec2 vm
Connection to 54.194.95.172 closed.
$ ssh eli@54.194.95.172                     # login as different user
eli@54.194.95.172's password:               # 1234
eli@ip-10-29-16-253:~$
```

