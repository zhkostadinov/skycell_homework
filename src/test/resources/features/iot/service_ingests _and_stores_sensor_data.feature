@ignore
Feature: Ingestion and Storage of Sensor Data by IoT Service

  Background: Member account
    Given I am on web login page
    When I navigate to sensor data page

  Scenario: IoT service receives sensor data
    And  I enable the IoT service
    When sensor data is transmitted from loggers or gateways
    Then I can see IoT service receives the sensor data

  Scenario: Confirm data integrity during ingestion
    And  I enable the IoT service
    When sensor data is transmitted from loggers or gateways
    Then I can see IoT service receives the ingested data, including accurate values and timestamps

  Scenario: Test IoT service's ability to handle various sensor data types
    When I enable the IoT service
    And  sensor data of different types is transmitted
    Then I can see IoT service receives different types of sensor data

  Scenario: Validate proper storage of ingested sensor data
    When I enable the IoT service
    And  sensor data is ingested
    Then I can see that the IoT service stores the data appropriately for future retrieval

  Scenario: Test scalability of IoT service's data ingestion and storage
    When I enable the IoT service
    And  a large volume of sensor data is ingested one after another
    Then I can see that the IoT service stores the data appropriately for future retrieval

  Scenario: Ensure proper indexing and organization of sensor data
    When I enable the IoT service
    And  data is ingested
    Then I can see the data is properly indexed and organized for efficient retrieval

  Scenario: Test IoT service's response to wrong sensor data
    When I enable the IoT service
    When wrong or incomplete sensor data is ingested
    Then I can see that the IoT service handles errors