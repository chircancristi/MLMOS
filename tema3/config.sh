#!/bin/bash

systemctl enable sshd
systemctl start sshd
systemctl reload firewalld
systemctl enable postfix
systemctl start postfix 
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash
sudo EXTERNAL_URL="https://gitlab.example.com" yum install -y gitlab-ee

