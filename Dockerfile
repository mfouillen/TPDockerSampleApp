FROM adoptopenjdk/openjdk8:alpine as build-step

WORKDIR /app

COPY . .

RUN apk add maven
RUN mvn install:install-file -Dfile=/app/lib/opencv-3410.jar -DgroupId=org.opencv -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar
RUN mvn package

FROM adoptopenjdk/openjdk8:alpine
WORKDIR /app

RUN apk add libpng-dev libdc1394-dev

COPY --from=build-step /app/lib ./lib
COPY --from=build-step /app/haarcascades ./haarcascades
COPY --from=build-step /app/target ./target
# TODO : copy only usefull files from target folder

EXPOSE 8080

CMD ["java", "-Djava.library.path=/app/lib/ubuntuupperthan18/", "-jar", "/app/target/fatjar-0.0.1-SNAPSHOT.jar"]