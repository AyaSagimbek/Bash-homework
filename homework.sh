#!/bin/bash 

function kpop() {
	sudo useradd jenny
	sudo useradd rose
	sudo useradd lisa
	sudo useradd jisoo
	sudo groupadd blackpink
	sudo usermod -aG blackpink jenny
	sudo usermod -aG blackpink rose
	sudo usermod -aG blackpink jisoo
	sudo usermod -aG blackpink lisa
	getent group blackpink
}
kpop

function wordpress() {
	sudo dnf install wget php-mysqlnd httpd php-fpm php-mysqli mariadb105-server php-json php php-devel -y 
	wget https://wordpress.org/latest.tar.gz 
	tar -xzf latest.tar.gz
	sudo systemctl start httpd
	sudo systemctl enable httpd
	sudo mv wordpress/* /var/www/html  
	sudo chown -R apache:apache wordpress/*
	sudo chmod -R 755 wordpress/*
	sudo systemctl restart httpd
} 

wordpress

function calculator() {
	echo $((12+4))
	echo $((12-4))
	echo $((12*4))
	echo $((12/4))
}

calculator

function binary() {
	sudo yum install tree -y > /dev/null
	sudo yum install -y yum-utils shadow-utils
	sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
	sudo yum -y install terraform > /dev/null
	terraform version

}

binary
