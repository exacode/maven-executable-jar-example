Example of executable jar built with maven
==========================================

Building jar
------------

* Build jar package and copy all dependencies into target/lib (and modify classpath):
		mvn clean package

* Build jar package and embedd all dependencies:
		mvn clean package -Dembedd-dependencies

Runing jar
----------
		java -jar target/executable-jar-0.0.1-SNAPSHOT.jar
