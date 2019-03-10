#!/bin/bash

sudo apt-get update -y 

exec >2>&1 >> /var/log/system/bootstrap.log
