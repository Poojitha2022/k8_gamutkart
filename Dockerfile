FROM ubuntu:latest
RUN mkdir /var/tomcat
RUN apt update
RUN apt install openjdk-11-jdk -y
WORKDIR /var/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.67/bin/apache-tomcat-9.0.67.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.67.tar.gz
RUN mv apache-tomcat-9.0.67/* /var/tomcat
COPY target/cangk-1.1-RELEASE.war webapps
EXPOSE 8070
CMD ["/var/tomcat/bin/catalina.sh", "run"]



