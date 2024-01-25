# syntax=docker/dockerfile:1

FROM ubuntu:22.04
WORKDIR /
COPY . /app
RUN apt-get update
RUN echo y | apt-get upgrade
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y maven
RUN apt-get install -f libpng16-16
RUN echo y | apt-get install -f libdc1394-dev
RUN cd /app
RUN mvn install:install-file -Dfile=/app/lib/opencv-3410.jar -DgroupId=org.opencv -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar
RUN cd /app && mvn package
EXPOSE 8080
CMD ["java", "-Djava.library.path=/app/lib/ubuntuupperthan18/", "-jar", "/app/target/fatjar-0.0.1-SNAPSHOT.jar"]