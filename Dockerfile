# Use OpenJDK base image
FROM openjdk:21-slim

# Set working directory
WORKDIR /app

# Copy the application jar
COPY target/spring-kafka-app-1.0.0.jar app.jar

# Copy application configuration
COPY src/main/resources/application.yml application.yml

# Expose the application port (assuming default Spring Boot port)
EXPOSE 8080

# Environment variable for Kafka bootstrap servers
ENV KAFKA_BOOTSTRAP_SERVERS=localhost:29092

# Set the entry point to run the application with environment variable support
ENTRYPOINT ["java", \
           "-jar", "app.jar", \
           "--spring.kafka.bootstrap-servers=${KAFKA_BOOTSTRAP_SERVERS}"]
