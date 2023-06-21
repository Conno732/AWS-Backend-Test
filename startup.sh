#!/bin/bash
sudo apt-get update -y
sudo apt install git -y
sudo apt-get install python3-pip apache2 libapache2-mod-wsgi-py3 python3-venv python3-virtualenv -y
###
cd /var/www
sudo mkdir sampleapp
cd sampleapp
sudo virtualenv env
source env/bin/activate
sudo env/bin/pip install django
sudo git clone https://github.com/Conno732/AWS-Backend-Test.git
cd AWS-Backend-Test/mysite
sudo python3 manage.py makemigrations
sudo python3 manage.py migrate

###
sudo bash -c "echo '  
<VirtualHost *:80>
        WSGIDaemonProcess sampleapp python-path=/var/www/sampleapp/AWS-Backend-Test:/var/www/sampleapp/env/lib/python3.10/site-packages
        WSGIProcessGroup sampleapp
        WSGIScriptAlias / /var/www/sampleapp/AWS-Backend-Test/mysite/wsgi.py
        
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

        #LogLevel info ssl:warn

        ErrorLog /error.log
        CustomLog /access.log combined

        #Include conf-available/serve-cgi-bin.conf

</VirtualHost>


# vim: syntax=apache ts=4 sw=4 sts=4 sr noet

' > /etc/apache2/sites-available/000-default.conf"
###
sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT





# 

