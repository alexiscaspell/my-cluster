#!/bin/bash

apt update -y
apt-get install openssh-server sshpass -y
systemctl enable ssh --now