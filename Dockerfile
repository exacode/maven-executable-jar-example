FROM openjdk:8-jre-alpine as run
WORKDIR /tmp/
COPY target/*.jar /tmp/
CMD  ["java","-jar","/tmp/maven-executable-jar-example-0.0.1-SNAPSHOT.jar"]
RUN  ["java","-jar","/tmp/maven-executable-jar-example-0.0.1-SNAPSHOT.jar"]
#RUN java -jar /tmp/maven-executable-jar-example-0.0.1-SNAPSHOT.jar 2>1 &
#EXPOSE 8080
ENTRYPOINT ["java","-jar","/tmp/maven-executable-jar-example-0.0.1-SNAPSHOT.jar"]
