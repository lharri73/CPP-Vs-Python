FROM ubuntu:20.10

RUN apt-get update && apt-get install -y gcc g++ software-properties-common jgraph time
RUN apt-get install -y python3.8 ghostscript imagemagick

RUN mkdir /opt/app
WORKDIR /opt/app
