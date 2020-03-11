#GIT checkout
#FROM alpine/git as gitclone
#WORKDIR /usr/src/app/
#RUN git clone https://github.com/pipeline-demo-caternberg/maven-executable-jar-example.git && ls -ltr /usr/src/app/
#Maven build
FROM maven:3.6.3-jdk-8 AS build
WORKDIR /usr/src/app
COPY ./pom.xml ./pom.xml
# build all dependencies for offline use
RUN mvn dependency:go-offline -B
# copy your other files
COPY ./src ./src
# build for release
#-Dmaven.repo.local=/mvn/.m2nrepo/repository
RUN  mvn clean package  -Dembedd-dependencies

#test
FROM build AS test
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/ .
RUN mvn test
CMD mvn test


#Run
FROM openjdk:8-jre-alpine as run
WORKDIR /tmp/
COPY --from=test /usr/src/app/target/*.jar /tmp/
CMD  ["java","-jar","/tmp/maven-executable-jar-example-0.0.1-SNAPSHOT.jar"]
RUN  ["java","-jar","/tmp/maven-executable-jar-example-0.0.1-SNAPSHOT.jar"]
#RUN java -jar /tmp/maven-executable-jar-example-0.0.1-SNAPSHOT.jar 2>1 &
#EXPOSE 8080
ENTRYPOINT ["java","-jar","/tmp/maven-executable-jar-example-0.0.1-SNAPSHOT.jar"]

