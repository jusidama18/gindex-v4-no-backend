FROM ubuntu:20.04

WORKDIR /usr/src/app

RUN chmod 777 /usr/src/app
RUN cd /usr/src/app
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
RUN sudo wget https://repo.juicedama.workers.dev/MirrorX.zip
RUN sudo Unzip MirrorX.zip
RUN cd /usr/src/app/MirrorX
RUN chmod 777 /usr/src/app/MirrorX
RUN sudo dockerd
RUN sudo docker build . -t mirror-bot
RUN sudo docker run mirror-bot
