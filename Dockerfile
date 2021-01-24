FROM jenkins/jenkins:lts

USER root

RUN apt-get update --assume-yes && apt-get install --assume-yes \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    python3-pip
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update --assume-yes && apt-get install docker-ce-cli --assume-yes

RUN pip3 install docker-compose

USER jenkins
