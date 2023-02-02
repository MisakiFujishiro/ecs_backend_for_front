# Docker Imageとしてcentos7
FROM centos:centos7

# git などのインストール
RUN yum install -y \
       wget tar iproute git

# java17のインストール
RUN yum install -y https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
RUN yum install -y zulu17-jdk

# mavenのインストール
RUN yum install -y ca-certificates
RUN wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
RUN sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
RUN curl -OL https://archive.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
RUN tar -xzvf apache-maven-3.5.2-bin.tar.gz
RUN mv apache-maven-3.5.2 /opt/

# PATHの追加
ENV JAVA_HOME /usr/lib/jvm/zulu17
ENV PATH $PATH:/opt/apache-maven-3.5.2/bin
ENV PATH $JAVA_HOME/bin:$PATH

# PJのコピー
RUN git clone https://github.com/MisakiFujishiro/ecs_backend_for_front
RUN mvn install -DskipTests=true -f /ecs_backend_for_front/pom.xml

# タイムゾーンの変更
RUN cp /etc/localtime /etc/localtime.org
RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# コンテナのポート解放
EXPOSE 8081

# Javaの実行
CMD java -jar -Dspring.profiles.active=production ecs_backend_for_front/target/mynavi-sample-aws-ecs-backend-for-front-0.0.1-SNAPSHOT.jar


