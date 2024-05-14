FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

RUN apk add --no-cache git

RUN git clone --branch dev https://github.com/ProvedCode/backend.git 

WORKDIR /app/backend

ARG S3_REGION
ARG BUCKET
ARG S3_ACCESS_KEY
ARG S3_SECRET_KEY
ARG DB_URL
ARG DB_LOGIN
ARG DB_PASSWORD
ARG SPRING_PROFILES_ACTIVE
ARG EMAIL_USER
ARG EMAIL_PASSWORD

ENV S3_REGION=$S3_REGION \
    BUCKET=$BUCKET \
    S3_ACCESS_KEY=$S3_ACCESS_KEY \
    S3_SECRET_KEY=$S3_SECRET_KEY \
    DB_URL=$DB_URL \
    DB_LOGIN=$DB_LOGIN \
    DB_PASSWORD=$DB_PASSWORD \
    SPRING_PROFILES_ACTIVE=$SPRING_PROFILES_ACTIVE \
    EMAIL_USER=$EMAIL_USER \
    EMAIL_PASSWORD=$EMAIL_PASSWORD

RUN chmod 744 /app/backend/mvnw \
    && cd /app/backend \
    && ./mvnw liquibase:releaseLocks \
    && ./mvnw clean package

COPY /app/backend/target/*.jar /app/provedcode.jar

RUN ./mvnw liquibase:releaseLocks
CMD ["java", "-jar", "/app/provedcode.jar", "--server.port=80"]