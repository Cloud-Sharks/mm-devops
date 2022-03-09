FROM openjdk:11-jre-slim

COPY ./user-microservice/target/user-microservice-0.1.0.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]