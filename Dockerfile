# # Step 1: Use an official Maven image to build the project
# FROM openjdk:21-jdk-slim AS build

# Step 1: Use an official Maven image to build the project
FROM maven:3.8.6-openjdk-21-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the project using Maven (this will produce the target/*.jar)
RUN mvn clean install

# Step 2: Use an OpenJDK image to run the application
FROM openjdk:21-jdk-slim

# Set the working directory for the runtime container
WORKDIR /app

# Copy the JAR file from the build container
COPY --from=build /app/target/*.jar app.jar

# Command to run your app
CMD ["java", "-jar", "app.jar"]
