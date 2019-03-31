#!/bin/bash

#yum -y -q update

#exec 2>&1 >> /var/log/system-bootstrap.log

key=$(cat /home/ccristian/.ssh/id_rsa.pub ) 

mkdir -p /root/.ssh
echo $key > /root/.ssh/authorized_keys
chmod -R go= /root/.ssh

mkdir -p /home/ccristian/.ssh
echo $key > /home/ccristian/.ssh/authorized_keys
chmod -R go= /home/ccristian/.ssh
chown -R ccristian:ccristian /home/ccristian/.ssh

grep -q "ChallengeResponseAuthentication" /etc/ssh/sshd_config && sed -i "/^[^#]*ChallengeResponseAuthentication[[:space:]]yes.*/c\ChallengeResponseAuthentication no" /etc/ssh/sshd_config || echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config
grep -q "^[^#]*PasswordAuthentication" /etc/ssh/sshd_config && sed -i "/^[^#]*PasswordAuthentication[[:space:]]yes/c\PasswordAuthentication no" /etc/ssh/sshd_config || echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
systemctl restart sshd.service


sed -i 's/enfiring/disabled/g' /etc/selinux/config
setenforce 0
 
