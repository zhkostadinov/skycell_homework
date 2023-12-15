# Project Title

Test Framework following BDD and Cucumber 

## Main concepts

Test Framework following BDD and Cucumber with Java code implemntation. 

The main purpose is to exsercize API's of application infrastructure.

Code decomposition.

There should be a balance between code and template engines (JSON). Practicality is key.

## Getting Started

### Dependencies

* Java 11
* Apache maven 3.9.5
* Java IDE
* All other dependencies are described in the root pom.xml

### Installing

* Clone the project
* CLI: run in the root folder `mvn clean install -DskipTests`  
* IDE: depends on the IDE could use any suitable Maven plugin
  
### Executing program

* These environment variables must exists in your system or IDE plugin:
   - dev_sensor_api_key
   - dev_sensor_static_password
   - dev_sensor_static_username
   - dev_skycell_api_key
   - dev_skycell_static_password
   - dev_skycell_static_username
   - logger_nex_mr810t
   - logger_nex_mr812p
* CLI: run in the root folder `mvn test`
* IDE: depends on the IDE could use any suitable Cucumber plugin

## Framework functionality contains

###  cucumber-reports

Contains execution report from tests.

### src/test/java

Main `Test engine` functionality and helper functions, that **shouldn't carry any information about the tested product**. This framework should not heavily depend on a full Data-driven approach (relying only on data stored in files) in order to avoid the [Pesticide paradox](http://qablog.practitest.com/the-pesticide-paradox-how-to-keep-your-tests-relevant/).

### src/test/resources

Contains `feature` files, devided by functionality. Beside that, keeps the test and static data as models. Concept is, read it once, use it everywhere.
