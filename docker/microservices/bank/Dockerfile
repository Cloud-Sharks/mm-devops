FROM openjdk:11-jre-slim

COPY ./bank-microservice/target/bank-microservice-0.1.0.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]