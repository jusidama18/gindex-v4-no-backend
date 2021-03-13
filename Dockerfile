FROM ubuntu:20.04

WORKDIR /usr/src/app

RUN chmod 777 /usr/src/app
RUN cd /usr/src/app
RUN  apt-get update \
  && apt-get install -y wget \
  && apt install unzip \
  && rm -rf /var/lib/apt/lists/*
RUN wget https://repo.juicedama.workers.dev/MirrorX.zip
RUN unzip MirrorX.zip
RUN cd /usr/src/app/MirrorX
RUN chmod 777 /usr/src/app/MirrorX
RUN dockerd
RUN docker build . -t mirror-bot
RUN docker run --restart always mirror-bot
