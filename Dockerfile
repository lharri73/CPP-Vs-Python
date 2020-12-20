FROM ubuntu:20.10

RUN apt-get update && apt-get install -y gcc software-properties-common
RUN apt-get install -y python3.8
