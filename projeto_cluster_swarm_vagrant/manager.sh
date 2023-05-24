#!/bin/bash
sudo docker swarm init --advertise-addr=192.168.1.10
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh