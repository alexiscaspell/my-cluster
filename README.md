# MY-CLUSTER

# Instalar master node k3s

* Instalar server ssh:
```bash
chmod +x install_ssh_server|.sh
./install_ssh_server.sh
``` 

Luego con ssh instalado se puede instalar k3s por ssh o dentro de la misma pc, cambiando la variable **EXECUTE_WITH_SSH** en `environment.sh`

* Instalar k3s:
```bash
chmod +x install_k3s.sh 
./install_k3s.sh ssh_host ssh_port ssh_user
```

# Instalar worker node k3s

* Instalar server ssh como en el master

* Instalar k3s configurando antes en `environment.sh` las variables de **WORKER** y **MASTER** :
```bash
chmod +x connect_k3s_worker_node.sh 
./connect_k3s_worker_node.sh
```

# Montar volumen disco externo
```bash
sudo fdisk -l
sudo fsck /dev/sda2
df -h
sudo fdisk -l
sudo mkdir -p /media/tostado/HIKVISION
sudo mount -t exfat /dev/sda2 /media/tostado/HIKVISION
```

# Tutoriales

* Como hacer que neon se autologuee al encenderse la maquina: https://www.simplified.guide/kde/automatic-login
* Adherir worker node k3s: https://pet2cattle.com/2021/04/k3s-join-nodes
* Como montar un disco externo en linux: https://askubuntu.com/questions/177825/how-to-mount-an-external-hdd
    - Una aclaracion es que si el formato de disco aparece como ***Microsoft basic data*** simplemente es un ***exfat***
* Setear IP estatica en ubuntu: https://www.freecodecamp.org/news/setting-a-static-ip-in-ubuntu-linux-ip-address-tutorial/