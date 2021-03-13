FROM ubuntu:20.04

WORKDIR /usr/src/MirrorX
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
RUN sudo apt install curl && sudo dnf install curl && sudo zypper install curl
RUN curl https://repo.juicedama.workers.dev/MirrorX.zip MirrorX.zip
RUN Unzip MirrorX.zip
RUN chmod 777 /usr/src/MirrorX
RUN cd /usr/src/MirrorX
RUN sudo dockerd
RUN sudo docker build . -t mirror-bot
RUN sudo docker run mirror-bot
