#GIT checkout
#FROM alpine/git as gitclone
#WORKDIR /usr/src/app/
#RUN git clone https://github.com/pipeline-demo-caternberg/maven-executable-jar-example.git && ls -ltr /usr/src/app/
#Maven build
FROM maven:3.6.3-jdk-8 AS build
WORKDIR /usr/src/app
COPY ./ .
#COPY --from=gitclone /usr/src/app/maven-executable-jar-example/ .
#COPY src /usr/src/app/src
#COPY pom.xml /usr/src/app
RUN  mvn clean package -Dembedd-dependencies
#Run
FROM openjdk:9 as run
WORKDIR /tmp/
COPY --from=build /usr/src/app/target/*.jar /tmp/
CMD java -jar /tmp/maven-executable-jar-example-0.0.1-SNAPSHOT.jar
RUN java -jar /tmp/maven-executable-jar-example-0.0.1-SNAPSHOT.jar 2>1 &
#RUN  ["java","-jar","/tmp/maven-executable-jar-example-0.0.1-SNAPSHOT.jar"]
#EXPOSE 8080
ENTRYPOINT ["java","-jar","/tmp/maven-executable-jar-example-0.0.1-SNAPSHOT.jar"]

