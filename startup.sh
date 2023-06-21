#!/bin/bash
sudo yum update -y
sudo yum install git -y
sudo yum install python3-pip -y
pip3 install gunicorn
sudo yum install nginx -y
pip3 install django
git clone https://github.com/Conno732/AWS-Backend-Test.git
cd AWS-Backend-Test