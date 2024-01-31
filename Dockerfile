FROM openjdk:8u151-jdk-alpine3.7

EXPOSE 8070

ENV APP_HOME /usr/src/app

WORKDIR $APP_HOME

COPY ${artifact} app.jar

ENTRYPOINT exec java -jar app.jar
