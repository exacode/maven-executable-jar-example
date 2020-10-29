Example of executable jar built with maven
==========================================


Building jar
------------

* Build jar package and copy all dependencies into target/lib (and modify classpath):
		
		mvn clean package

* Build jar package and embed all dependencies:
		
		mvn clean package -Dembedd-dependencies
* deploy to nexus

          
     <servers>
       <!--your existing servers are here if any-->
       <server>
         <id>nexus</id>
         <username>admin</username>
         <password>admin123</password>
       </server>
     </servers>
        
    mvn deploy:deploy-file -DgroupId=eam -DartifactId=ant-contrib -Dversion=1.0b3 -DgeneratePom=true -Dpackaging=jar -DrepositoryId=nexus -Durl=http://localhost:8081/repository/thirdparty -Dfile=ant-contrib-1.0b3.jar
    
     
    add in pom.xml 
    
     <distributionManagement>
            <repository>
                <id>nexus</id>
                <name>Releases</name>
                <url>http://nexus.34.98.108.14.xip.io/repository/maven-releases</url>
            </repository>
            <snapshotRepository>
                <id>nexus</id>
                <name>Snapshot</name>
                <url>http://nexus.34.98.108.14.xip.io/repository/maven-snapshots/</url>
            </snapshotRepository>
        </distributionManagement>
       
       mnv clean deploy 

Runing jar
----------
	
	java -jar target/maven-executable-jar-example-0.0.1-SNAPSHOT.jar
