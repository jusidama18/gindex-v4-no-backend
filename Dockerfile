FROM ubuntu:20.04
FROM iamliquidx/megasdk:latest

WORKDIR /usr/src/app/MirrorX

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
COPY requirements.txt .
COPY extract /usr/local/bin
COPY pextract /usr/local/bin
COPY . .
COPY netrc /root/.netrc
RUN apt-get -qq update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/* && \
    apt-add-repository non-free && \
    apt-get -qq update && \
    apt-get -qq install -y p7zip-full p7zip-rar aria2 curl pv jq ffmpeg locales python3-lxml && \
    apt-get purge -y software-properties-common
RUN chmod +x /usr/local/bin/extract && chmod +x /usr/local/bin/pextract
RUN pip3 install --no-cache-dir -r requirements.txt
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN mkdir /root/.netrc
RUN chmod +x aria.sh

CMD ["bash","start.sh"]
