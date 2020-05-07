#! /bin/bash
#set -x
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1> Terraform EC2 Instance </h1>" | sudo tee /var/www/html/index.html


