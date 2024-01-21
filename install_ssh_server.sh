sudo apt update -y
sudo apt-get install openssh-server
sudo systemctl enable ssh
sudo systemctl enable ssh --now