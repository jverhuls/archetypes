# Archetype backbase-services-archetype

Version **5.5.0.0**

##Overview
This archetype allows you to develop custom Backbase Services based on Apache Camel bundled with Backbase CXP.

The archetype is currently pre-configured for Jetty and Tomcat 7. One can easily switch from Tomcat 7 to Tomcat 6 by changing a single line within the POM file. It also contains all necessery scripts and configuration files required for forther configuration changes. 

Backbase Services is not using database, therefore no database configurations are supplied.

In case you would have many services, a good practice is to group many Services modules within parent service module.

##Usage
Follow the steps below to get started with this archetype. Some of these steps refer to [Development Setup](https://my.backbase.com/resources/documentation/portal/devd_mave.html). You should get familiar with these topics before you start using this archetype.

1. Generate the project. Open a command shell and go to a location where you want to create the orchestrator project. Execute the following command:
    <pre>
    $ mvn archetype:generate
        -DarchetypeArtifactId=backbase-services-archetype
        -DarchetypeGroupId=com.backbase.expert.tools
        -DarchetypeVersion=5.5.0.0
    </pre>
Refer to [Development Setup](https://my.backbase.com/resources/documentation/portal/devd_mave.html) for more information.  
2. In order to integrate Services with your Portal Foundation you need to declare Maven dependencies inside Portal Foundation's POM toward this Services module.  
3. Use the following command to build the project:
    <pre>
    $ mvn clean package
    </pre>

##Anatomy
**project**  
-**configuration**  
--services.properties --> main services configuration file where specific properties are externalized  
-**src**  
--**main**  
---**java**  
---**resources**  
----**META-INF**  
-----backbase-mashup-service.xml --> Apache Camel routes  
----**template**  
-----**velocity**  
------sample-velocity.wsdl --> Sample Velocity template  
----**wsdl**  
-----weather.wsdl --> Sample WSDL  
----binding.xml--> Apache CXF helper file  
--**test**  
---**java**  
---**resources**  
-pom.xml  
