@ignore
Feature: Data Measurement and Transmission from Loggers to Gateway

  Background: Company account
    Given I am on login page
    And I navigate to loggers page

  Scenario: Logger measures sensor data
    When I enable functional logger with connected sensors
    And  the logger measures sensor data
    Then I can see that accurate measurements are recorded

  Scenario: Logger transmits measured data to the gateway
    When I enable functional logger with connected sensors
    And  logger with measured sensor data
    And  logger transmits the data to a gateway
    Then I can see gateway receives the transmitted data

  Scenario: Validate data integrity during transmission
    When I enable functional logger with connected sensors
    And  logger transmits the data to a gateway
    Then I can see gateway receives the transmitted data, including accurate values and timestamps

  Scenario: Test logger's ability to handle different types of sensor data
    When I enable functional logger with connected sensors
    And  logger transmits the data to a gateway
    Then I can see the logger can handle and transmit different types of sensor data appropriately

  Scenario: Validate logger's ability to buffer and transmit offline data
    When I enable functional logger with connected sensors
    And  the logger temporarily loses connection to the gateway
    And  the connection is restored
    Then I can see gateway receives the transmitted data

  Scenario: Verify logger's data transmission range
    When I enable functional logger with connected sensors with specified communication range
    And  the logger is positioned within the communication range
    Then I can see gateway receives the transmitted data