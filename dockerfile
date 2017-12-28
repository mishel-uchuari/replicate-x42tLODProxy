FROM tomcat:8.0-jre8
MAINTAINER Mishel Uchuari <dmuv7@hotmail.com>

RUN mkdir /usr/local/git
USER root
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install git
RUN apt-get install -y openjdk-8-jdk
RUN apt-get -y update

#Clonamos el proyecto que se ejecutara en tomcat
RUN git clone https://github.com/opendata-euskadi/x42tLODProxy /usr/local/git

#Creamos el .war del proyecto para su despliegue en tomcat
RUN jar -cvf webapps/x42tLODProxy.war /usr/local/git/x42tLODProxyWAR

RUN rm conf/tomcat-users.xml
ADD tomcat-users.xml conf/tomcat-users.xml

#Copiamos el war al directorio webapps de tomcat
#RUN mv /usr/local/git/x42tLODProxy/x42tLODProxyWAR/x42tLODProxy.war webapps/
