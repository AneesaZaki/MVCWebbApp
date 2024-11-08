# Step 1: Use an official Maven image to build the project
FROM maven:3.8.4-openjdk-11-slim AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and the source code into the container
COPY pom.xml /app/
COPY src /app/src

# Build the project with Maven (this will produce the target/*.jar)
RUN mvn clean install -DskipTests

# Step 2: Use an OpenJDK image to run the application
FROM openjdk:11-jre-slim

# Set the working directory for the runtime container
WORKDIR /app

# Copy the JAR file from the builder container
COPY --from=builder /app/target/your-app-name.jar /app/your-app-name.jar

# Expose the port your app will be running on (default is 8080 for web apps)
EXPOSE 8080

# Command to run your app
ENTRYPOINT ["java", "-jar", "/app/your-app-name.jar"]
