#!/bin/bash

systemctl enable sshd
systemctl start sshd
firewall-cmd --permanent --add-service=http
systemctl reload firewalld
systemctl enable postfix
systemctl start postfix 
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh |  bash
EXTERNAL_URL="https://gitlab.example.com" yum install -y gitlab-ee

