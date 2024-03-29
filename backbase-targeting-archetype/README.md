# Archetype backbase-targeting-archetype

Version **5.5.0.0**

##Overview
This archetype allows you to run as standalone and customize according to your specific needs Backbase Targeting. We are basically creating a standard Maven WAR overlay of Backbase Targeting WAR. More info on how WAR overlay works you can find [here](http://maven.apache.org/plugins/maven-war-plugin/overlays.html).

The archetype is currently pre-configured for Jetty and Tomcat 7. One can easily switch from Tomcat 7 to Tomcat 6 by changing a single line within the POM file. It also contains all necessery scripts and configuration files required for forther configuration changes. 

Backbase Targeting is not using database, therefore no database configurations are supplied.

The reason why you would want to use Standalone Targeting and therefore use this archetype is if you plan to run this module in a standalone JVM separate from Portal Foundation.

##Usage
Follow the steps below to get started with this archetype. Some of these steps refer to [Development Setup](https://my.backbase.com/resources/documentation/portal/devd_mave.html) or [Install Targeting Stand-Alone](https://my.backbase.com/resources/documentation/portal/inst_tcat.html#N63C55). You should get familiar with these topics before you start using this archetype.

1. Generate the project. Open a command shell and go to a location where you want to create the orchestrator project. Execute the following command:
    <pre>
    $ mvn archetype:generate
        -DarchetypeArtifactId=backbase-targeting-archetype
        -DarchetypeGroupId=com.backbase.expert.tools
        -DarchetypeVersion=5.5.0.0
    </pre>
Refer to [Development Setup](https://my.backbase.com/resources/documentation/portal/devd_mave.html) for more information.  
2. Optionally adjust JMV properties, differently configure the Logback, or make some changes to main configuration file (backbase.properties). For any of these steps refer to [Development Setup](https://my.backbase.com/resources/documentation/portal/devd_mave.html) or [Install Targeting Stand-Alone](https://my.backbase.com/resources/documentation/portal/inst_tcat.html#N63C55).  
3. Use the following command to prepare the project for running:
    <pre>
    $ mvn clean package
    </pre>
If you want to run Targeting on Jetty:  
    <pre>
    $ mvn jetty:run
    </pre>
Or, if you want to run Targeting on Tomcat 7:
    <pre>
    $ mvn tomcat7:run
    </pre>
Note that both Jetty and Tomcat use the 8084 port by default. In case you need to choose a different port since you maybe already have another process running on port 8084, make necessary changes in jetty and tomcat plugins within POM file before you run Targeting.  
4. Test Targeting by opening the Targeting contexts in a browser: [http://localhost:8084/targeting-webapp/contexts](http://localhost:8084/targeting-webapp/contexts) (pay attention to the port number).  
5. In order to integrate Targeting with your Portal Foundation that is running in its own standalone process, make sure to configure Portal Foundation’s Targeting Proxy within backbase.properties as it is explained in [Proxy Configuration](https://my.backbase.com/resources/documentation/portal/inst_conf.html#inst_conf_prox).  
##Anatomy
**project**  
-**configuration**  
--**jetty**  
---jetty.xml --> Jetty JNDI bindings for Targeting web application defined with this Maven project  
---webdefaults.xml --> Global Jetty configuration  
--**tomcat**  
---context.xml --> Tomcat 7 JNDI bindings for Targeting web application defined with this Maven project  
---server.xml --> Tomcat 7 server configuration  
--backbase.properties --> Main Backbase configuration file  
--logback.xml --> Logback configuration file  
-**src**  
--**main**  
---**java**  
----**com**  
-----**backbase**  
------**targeting**  
-------**collector**  
--------**examples**  
---------WeatherContextCollector.java --> Targeting collector example  
---**resources**  
----**META-INF**  
-----**spring**  
------**optional**  
-------targeting-connectorframework.xml --> Spring configuration for Targeting that refers to collector example  
---**webapp**  
----**static**  
----version.txt --> Build version info file  
--**test**  
---**java**  
----**com**  
-----**backbase**  
------**test**  
-------**targeting**  
--------InstallationValidationTestST.java --> Test used to validate Targeting on embedded server  
---**resources**  
-build.bat  
-build.sh  
-pom.xml  
-start.bat  
-start.sh  
