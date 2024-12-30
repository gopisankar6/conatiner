# FROM openjdk:8-jre-slim
# WORKDIR /app
# COPY target/*.jar internship-0.0.1-SNAPSHOT.jar
# EXPOSE 8080
# CMD ["java", "-jar", "internship-0.0.1-SNAPSHOT.jar"]

# Use the official Maven image to build the application
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Use the official OpenJDK image to run the application
FROM openjdk:17-jdk-slim
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]