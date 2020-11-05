Example of executable jar built with maven
==========================================


Building jar
------------

* Build jar package and copy all dependencies into target/lib (and modify classpath):
```
		mvn clean package
```
* Build jar package and embed all dependencies:
```		
		mvn clean package -Dembedd-dependencies`
```
* deploy to nexus
```
    #add in settings.xml
     <servers>
       <!--your existing servers are here if any-->
       <server>
         <id>nexus</id>
         <username>admin</username>
         <password>admin123</password>
       </server>
     </servers>
        
    mvn deploy:deploy-file -DgroupId=eam -DartifactId=ant-contrib -Dversion=1.0b3 -DgeneratePom=true -Dpackaging=jar -DrepositoryId=nexus -Durl=http://localhost:8081/repository/thirdparty -Dfile=ant-contrib-1.0b3.jar
    
     
   #add in pom.xml 
    
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
```

Full settings.xml  example for nexus, injected by config file provider
see https://github.com/pipeline-template-apps/pipeline-template-catalog-examples/blob/master/templates/multibranch-pripeline-parallel-sharedlib/Jenkinsfile  
```
<?xml version="1.0" encoding="UTF-8"?>
<settings>
        <servers>
                <server>
                        <id>nexus-snapshots</id>
                        <username>admin</username>
                         <password>admin123</password>
                </server>
                <server>
                        <id>nexus-releases</id>
                        <username>admin</username>
                         <password>admin123</password>
                </server>
                <server>
                        <id>nexus</id>
                        <username>admin</username>
                         <password>admin123</password>
                </server>
        </servers>
        <mirrors>
                <mirror>
                        <!--This sends everything else to /public -->
                        <id>nexus</id>
                        <mirrorOf>*</mirrorOf>
                        <url>http://nexus.34.98.108.14.xip.io/repository/maven-central/</url>
                </mirror>
        </mirrors>
        <profiles>
                <profile>
                        <id>nexus</id>
                        <!--Enable snapshots for the built in central repo to direct -->
                        <!--all requests to nexus via the mirror -->
                        <repositories>
                                <repository>
                                        <id>central</id>
                                        <url>http://central</url>
                                        <releases>
                                                <enabled>true</enabled>
                                        </releases>
                                        <snapshots>
                                                <enabled>true</enabled>
                                        </snapshots>
                                </repository>
                        </repositories>
                        <pluginRepositories>
                                <pluginRepository>
                                        <id>central</id>
                                        <url>http://central</url>
                                        <releases>
                                                <enabled>true</enabled>
                                        </releases>
                                        <snapshots>
                                                <enabled>true</enabled>
                                        </snapshots>
                                </pluginRepository>
                        </pluginRepositories>
                </profile>
        </profiles>
        <activeProfiles>
                <!--make the profile active all the time -->
                <activeProfile>nexus</activeProfile>
        </activeProfiles>
</settings>
```

* Run the jar
----------
```
	java -jar target/maven-executable-jar-example-0.0.1-SNAPSHOT.jar
```