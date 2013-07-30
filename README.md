sampleapp
====================

To install the sample application:

Install servers and unit testing platform:
------------------------------------------
- install a CFML engine (We used Railo in this example http://www.getrailo.org.  This app assumes that Railo runs on port 7777)
- install MXUnit (download zip from mxunit.org.  Copy mxunit folder to {RailoDir}/tomcat/webapps/ROOT
- install MySQL 
- install Java 7  (http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html (Java SE Development Kit 7u25).
- install Maven http://maven.apache.org/download.cgi (binary 3.1.0 should work)
- install Tomcat to a different directory than Railo (we will install jenkins here)


Create Database:
----------------
- execute /database/create_database.sql to create the sample_app database and user account for the datasource connection
- To execute from Windows Command Shell:
	- cd to /sample_app/database/ directory
	- log into mysql using:  mysql -u root -p
	- execute the script using:  \. create_database.sql;

Create Datasource Connection:
-----------------------------
- log into your ColdFusion server and create a datasource connection on the ColdFusion server using the sample_app MySQL user credentials established when creating the database
	- type: MySQL
	- datasource name: sample_app
	- host/server: localhost
	- user: sa_cf_user
	- password:  sa_cf_pw (Note: change the password once the application is installed and verified)
	
	
Install initial version of sampleapp to Railo
------------------------
- cd {Railo Tomcat Directory}/bin
- shutdown(.bat or .sh)
- cd {Your Workspace}/sampleapp
- mvn -DskipTests install
- Now you should see a .war file in your {Your Workspace}/sampleapp/target directory. 
- Copy .war to {Railo Tomcat Directory}/webapps/ROOT directory and rename war to sampleapp.war
- cd {Railo Tomcat Directory}/bin
- startup(.bat or .sh)

Verify Application Runs:	
------------------------
- open a browser window and navigate to the sample application at http://localhost:7777/sampleapp/index.cfm
	- You should see an HTML dropdown menu containing a list of 50 US states + DC

	
Verify Tests Run:
-----------------	
- browse to the MXUnit test runner at http://localhost:7777/mxunit/runner/index.cfm
- specify the path to /sampleapp/test/mxunit in the 'TestCase, TestSuite or Directory' field (sampleapp.test.mxunit) and click the 'Run Tests' button
- the results should show 3 tests have been executed, all of which pass 

Verify Tests Run (using Maven build process)
- cd {Your Workspace}/sampleapp
- mvn install

//TODO:  Still need to clean this following section up
-----------------------------------------------------------
##Selenium Tests  

The maven project has been configured to support selenium integration tests, with an included example test.  To run the tests, simply run this:

    mvn integration-test

## MXUnit Test

mvn install:install-file -DgroupId=org.mxunit -DartifactId=mxunit-ant -Dpackaging=jar -Dversion=1.0 -Dfile={path to your workspace}/sampleapp/mxunit-ant.jar -DgeneratePom=true

---------------------
For Continuous Integration using Jenkins, install following:
- install Jenkins by copying jenkins war to Tomcat webapps directory (NOTE: if you are in a Windows environment, you will need to install Unix Utils)
- install git (for Windows, you will need to install msysgit)

To Test Jenkins
-------------------
- Go to http://localhost:8080/jenkins/

Configure Jenkins
-------------------
- Click Manage Jenkins in left menu
- Manage Plugins
- Click Available Tab
- Search for "GitHub Plugin" and check that box
- Search for "Git Plugin" and check that box
- Install without restart
- Now check "Restart Jenkins when installation is complete and no jobs are running"
- Go To http://localhost:8080/jenkins/configure
- Under Maven Installations, enter "Maven3" as Name and "/usr/share/maven" as MAVEN_HOME
 


Create New Job in Jenkins
-----------------------------
- Click Create New Job
- Select Maven 2/3 project
- Enter sampleapp as name
- Click OK
- In GitHub project, enter http://github.com/ambermanry/sampleapp
- Under SCM, choose Git
- Enter http://github.com/ambermanry/sampleapp.git for URL
- Under Repository Brower, select githubweb
- Under URL enter http://github.com/ambermanry/sampleapp
- Under Build Triggers, check "Build when a change is pushed to GitHub".  Uncheck others.

