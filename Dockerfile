FROM maven:3.8.5-openjdk-17 AS build
COPY .  .
RUN mvn clean package -DskipTests

FROM openjdk:17-alpine
COPY --from=build /target/taco-cloud-0.0.5-SNAPSHOT.jar taco.jar
EXPOSE 8085
ENTRYPOINT ["java","-jar","taco.jar"]