FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean package

FROM openjdk:17

WORKDIR /app

COPY --from=build /app/target/Motorify-0.0.1-SNAPSHOT.jar .

CMD ["java", "-jar", "Motorify-0.0.1-SNAPSHOT.jar"]
