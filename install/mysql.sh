#!/usr/bin/env bash

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'

sudo apt-get update
sudo apt-get install -y vim mysql-server curl wget

sudo sed -i "/^bind-address/d" /etc/mysql/mysql.conf.d/mysqld.cnf
mysql -u root -ppassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED
BY 'password' WITH GRANT OPTION;GRANT ALL PRIVILEGES ON *.* TO 'root'@'*' IDENTIFIED BY 'password' WITH GRANT OPTION; FLUSH PRIVILEGES;"
sudo /etc/init.d/mysql restart
