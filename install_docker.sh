#!/bin/bash

## On met à jour le systeme pour pouvoir installer

sudo apt update -y

## On installe Docker

sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release figlet

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update -y

sudo apt install -y install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker $USER
figlet Docker Is Ready

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose


## En cas d'erreur revoir https://docs.docker.com/engine/install/ubuntu/ ou pour la bonne distrib