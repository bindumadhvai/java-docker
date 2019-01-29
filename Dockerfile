FROM ubuntu:16.04 as BUILD
USER root
RUN apt-get update && \
    apt-get -y install git openssh wget ant tomcat8
RUN mkdir app && cd app
RUN git init
RUN git clone https://github.com/jgraph/drawio.git
RUN cd /drawio/etc/build
CMD ["ant","war"]
