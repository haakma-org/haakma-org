# Docker

## Install new Docker version

https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository

Remove older versions:

`sudo apt-get remove docker docker-engine`

Add apt https support

```
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```

Add repository

`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`

`sudo apt-key fingerprint 0EBFCD88`

```sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

`sudo apt-get install docker-ce`

### Add user to docker group

`sudo groupadd docker`

`sudo gpasswd -a $USER docker`


## Install new docker-compose version

https://docs.docker.com/compose/install/

`sudo su`

`curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose`

`sudo chmod +x /usr/local/bin/docker-compose`
