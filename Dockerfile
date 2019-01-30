FROM ubuntu:16.04 as FIRST
USER root
RUN apt-get update && \
    apt-get -y install git default-jre default-jdk ant tomcat8
RUN mkdir app && cd app
RUN git init
RUN git clone https://github.com/jgraph/drawio.git
RUN cd /drawio/etc/build && ant war

FROM tomcat:8.0
COPY --from=FIRST /drawio/build/draw.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
