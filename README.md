# wsl2-tools | Ubuntu 20.04 | WSL 2



## Docker run at boot
- install docker and docker-compose
- eliminate the need for a password to start docker:
   > sudo usermod -a -G docker [username]
   > 
   > visudo
   
   add:
   > [username] ALL=(ALL) NOPASSWD: /usr/bin/dockerd,/etc/init.d/docker


- copy startdocker.sh script to home directory
- chmod +x startdocker.sh
