FROM centos:centos7


RUN yum install -y \
       wget tar iproute git

RUN yum install -y https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
RUN cat /etc/redhat-release
RUN yum install -y zulu17-jdk
       
RUN yum install -y ca-certificates
RUN wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
RUN sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo

RUN curl -OL https://archive.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
RUN tar -xzvf apache-maven-3.5.2-bin.tar.gz

RUN mv apache-maven-3.5.2 /opt/

ENV JAVA_HOME /usr/lib/jvm/zulu17
ENV PATH $PATH:/opt/apache-maven-3.5.2/bin
ENV PATH $JAVA_HOME/bin:$PATH

# ENV export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.17.0.8-2.el7_9.aarch64
# ENV export PATH=$JAVA_HOME/bin:$PATH
