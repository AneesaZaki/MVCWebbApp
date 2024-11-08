# Step 1: Use an official Maven image to build the project
FROM maven:3.8.4-openjdk-17-slim AS build

# Set the working directory inside the container
WORKDIR /app


COPY - -

# Build the project with Maven (this will produce the target/*.jar)
RUN mvn clean install 

# Step 2: Use an OpenJDK image to run the application
FROM openjdk:17-jdk-slim

# Set the working directory for the runtime container
WORKDIR /app

# Copy the JAR file from the builder container
COPY --from=build /app/target/*.jar app.jar


# Command to run your app
CMD ["java", "-jar", "app.jar"]
