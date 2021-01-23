FROM jenkins/jenkins:lts

USER root

RUN apt-get update --assume-yes && apt-get install --assume-yes \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
RUN apt-get update --assume-yes && apt-get install docker-ce-cli --assume-yes

RUN curl -L https://github.com/docker/compose/releases/download/1.28.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

