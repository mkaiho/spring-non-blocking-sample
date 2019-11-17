FROM openjdk:11-jdk-slim-stretch as builder
ADD . /work
WORKDIR /work
RUN ./gradlew build -x test

FROM openjdk:11-jre-slim-stretch
COPY --from=builder /work/build /home/app/build
WORKDIR /home/app
ENTRYPOINT [ "java", "-jar", "./build/libs/spring-non-blocking-sample-0.0.1-SNAPSHOT.jar" ]