# 1단계: Maven을 사용해 jar 빌드
FROM maven:3.8.5-openjdk-17 AS build
COPY target .
RUN mvn clean package -DskipTests

# 2단계: 실제 실행할 이미지
FROM openjdk:17-slim
COPY --from=build /target/taco-cloud-0.0.5-SNAPSHOT.jar taco.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "taco.jar"]
