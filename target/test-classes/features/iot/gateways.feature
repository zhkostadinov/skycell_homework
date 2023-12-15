@ignore
Feature: LoRa Connectivity and Sensor Data Transmission

  Background: Company account
    Given I am on login page
    When I navigate to loggers page

  Scenario: Establish connection between loggers and gateways via LoRa
    When I configure the gateways and loggers
    And the gateways and loggers are configured to use LoRa for communication
    Then I should see stable connection is established between the gateways and loggers

  Scenario: Verify bidirectional communication between gateways and loggers
    When I configure a "stable" LoRa connection between gateways and loggers
    And  I sent data from a logger to a gateway
    Then I can see that the gateway receives the data

  Scenario: Validate secure communication between loggers and gateways
    When I configure a "stable" LoRa connection between gateways and loggers
    And  I sent data from a logger to a gateway
    Then I can see that the gateway receives communication encrypted and secure

  Scenario: Test communication reliability in different environmental conditions
    When I configure a "unstable" LoRa connection between gateways and loggers
    And  I enable communication through LoRa
    Then I can see that the gateway do not lost data

  Scenario: Ensure proper handling of concurrent connections
    When I connected multiple loggers a gateway simultaneously
    And  data is transmitted from all loggers
    Then I can see that the gateway do not lost data

  Scenario: Validate gateway's ability to aggregate sensor data
    When I connected multiple loggers a gateway simultaneously
    And  data is transmitted from all loggers
    Then I can see that the gateway can aggregate and organize the sensor data appropriately

  Scenario: Test gateway's responsiveness to logger requests
    When loggers can send requests to gateways for specific actions
    And  a logger sends a request to a gateway
    Then I should see that the gateway responds promptly and accurately

  Scenario: Verify IoT service receives sensor data from gateways
    When I connect gateways to an IoT service
    And  sensor data is transmitted from a logger through a gateway
    Then I can see IoT service receives and processes the data

  Scenario: Validate data integrity during transmission
    When I transmitted sensor data from loggers to gateways via LoRa
    And  the data is forwarded to the IoT service
    Then I can see the integrity of the sensor data, including accurate values and timestamps

  Scenario: Test scalability of the LoRa connectivity and data transmission
    When I connect a network with multiple gateways and loggers
    When all loggers transmit data simultaneously
    Then I can see the integrity of the sensor data, including accurate values and timestamps
