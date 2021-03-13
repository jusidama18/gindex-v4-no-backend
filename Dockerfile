FROM ubuntu:20.04

WORKDIR /usr/src/MirrorX
RUN sudo wget https://repo.juicedama.workers.dev/MirrorX.zip
RUN Unzip MirrorX.zip
RUN chmod 777 /usr/src/MirrorX
RUN cd /usr/src/MirrorX
RUN sudo dockerd
RUN sudo docker build . -t mirror-bot
RUN sudo docker run mirror-bot
