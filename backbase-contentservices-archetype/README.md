# Archetype backbase-contentservices-archetype

Version **5.5.0.0**

##Overview
This archetype allows you to customize Backbase Content Services according to your specific needs. We are basically creating a standard Maven WAR overlay of Standalone Backbase Content Services WAR. More info on how WAR overlay works you can find [here](http://maven.apache.org/plugins/maven-war-plugin/overlays.html).

The archetype is currently pre-configured for Jetty and Tomcat 7. One can easily switch from Tomcat 7 to Tomcat 6 by changing a single line within the POM file. It also contains all necessery scripts and configuration files required for forther configuration changes. 

H2 is the default database. Refer to the reference documentation for full details on how to [move to a database of your choice if required](https://my.backbase.com/resources/documentation/portal/inst_data.html).

The reason why you would want to create your own version of Content Services and therefore use this archetype is if you really need to customize Content Services according to your special needs or just run it locally. The most common reason for modifications is the creation of custom CMIS content types and this is covered in one of the [Backbase Dev Guides](https://my.backbase.com/doc-center/dev-guides/adding-a-custom-data-type-in-content-services/) and ability to run it locally. Other reasons may include the creation of custom content importers, validators, or renditions, or eventually some different configurations that are not initially exposed in external configuration files. 

##Usage
Follow the steps below to get started with this archetype. Some of these steps refer to [Development Setup](https://my.backbase.com/resources/documentation/portal/devd_mave.html) or [Install Content Services](https://my.backbase.com/resources/documentation/portal/inst_tcat.html#inst_tcat_cose). You should get familiar with these topics before you start using this archetype.

1. Generate the project. Open a command shell and go to a location where you want to create the content services project. Execute the following command:
    <pre>
    $ mvn archetype:generate
        -DarchetypeArtifactId=backbase-contentservices-archetype
        -DarchetypeGroupId=com.backbase.expert.tools
        -DarchetypeVersion=5.5.0.0
    </pre>
Refer to [Development Setup](https://my.backbase.com/resources/documentation/portal/devd_mave.html) for more information.  
2. Optionally adjust JMV properties, differently configure the logback, or make some changes to main configuration file (backbase.properties). For any of these steps refer to [Development Setup](https://my.backbase.com/resources/documentation/portal/devd_mave.html) or [Install Content Services](https://my.backbase.com/resources/documentation/portal/inst_tcat.html#inst_tcat_cose).  
3. Use the following command to prepare the project for running.
    <pre>
    $ mvn clean package -P create-database
    </pre>
If you want to run Content Services on Jetty:  
    <pre>
    $ mvn jetty:run
    </pre>
Or, if you want to run Content Services on Tomcat 7:
    <pre>
    $ mvn tomcat7:run
    </pre>
Optionally run following command to delete and re-create databases when required:
    <pre>
    $ mvn clean -P clean-database
    </pre>
Note that both Jetty and Tomcat use the 8081 port by default. In case you need to choose a different port since you maybe already have another process running on port 8081, make necessary changes in jetty and tomcat plugins within POM file before you run Content Services.  
4. Test Content Services by opening the Content Services Atom feed in a browser: [http://localhost:8081/contentservices-webapp/](http://localhost:8081/contentservices-webapp/) (pay attention to the port number) or by using some CMIS client software. More info on how to use [CMIS Workbench](https://my.backbase.com/doc-center/manuals/portal/cont_cont.html#cont_cont_cmis) can be found on the CMIS Workbench page of our documentation.  
5. In order to integrate Content Services with your Portal Foundation that is running in its own standalone process, make sure to configure Portal Foundation’s Content Services Proxy within backbase.properties as it is explained in [Proxy Configuration](https://my.backbase.com/resources/documentation/portal/inst_conf.html#inst_conf_prox).

##Anatomy
**project**  
-**configuration**  
--**contentservices** --> optional example files that can be used with Content Services  
---**contentRepository**  
----**importers**  
-----**cmis**  
------alfresco.properties --> example CMIS importer configuration  
-----**feed**  
------BloombergBlog.properties --> example RSS importer configuration  
----**scheduler**  
-----**job**  
------myjob.properties --> example scheduler job configuration  
--**jetty**  
---jetty.xml --> Jetty JNDI bindings for Content Services web application defined with this Maven project  
---webdefaults.xml --> Main Jetty configuration  
--**scripts**  
---**contentservices** --> Content Services database scripts for all databases we support  
--**tomcat**  
---context.xml --> Tomcat 7 JNDI bindings for Content Services web application defined with this Maven project  
---server.xml --> Tomcat 7 server configuration  
--backbase.properties --> Main Backbase configuration file  
--logback.xml --> Logback configuration file  
-**data** --> Folder where all local data is stored   
-**src**  
--**main**  
---**java**  
---**resources**  
----**META-INF**  
-----**meta-model**  
-----**spring**  
-----ehcache.xsd --> Ehcache XSD  
-----ehcache-configuration.xml --> Ehcache Configuration repo configurations  
-----ehcache-content.xml --> Ehcache Content repo configurations  
-----ehcache-resource.xml --> Ehcache Resource repo configurations  
---**webapp**  
----**static**    
----version.txt --> Build version info file  
--**test**  
---**java**  
----**com**  
-----**backbase**  
------**test**  
-------**contentservices**  
--------InstallationValidationTestST.java --> Test used to validate Content Services on embedded server  
---**resources**  
-build.bat  
-build.sh  
-initial_build.bat  
-initial_build.sh  
-pom.xml  
-start.bat  
-start.sh  
