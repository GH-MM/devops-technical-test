# Use Alpine Linux as the base image
FROM alpine:latest

# Set working directory
WORKDIR /app

# Install necessary packages
RUN apk update && \
    apk add curl && \
    rm -rf /var/cache/apk/*
EXPOSE 8080

# Download and install Adoptium JDK 11
RUN curl -L -o openjdk.tar.gz https://github.com/Adoptium/temurin11-binaries/releases/download/jdk-11.0.13%2B8/OpenJDK11U-jdk_x64_linux_hotspot_11.0.13_8.tar.gz && \
    tar -xf openjdk.tar.gz && \
    mv jdk-* /opt/openjdk && \
    rm openjdk.tar.gz

# Set environment variables
ENV PATH="/opt/openjdk/bin:${PATH}"

# Copy your application JAR into the container
COPY target/your-app.war /app/your-app.war


