Feature: Logger type 810T

  Scenario: User is able to register logger 810T
    When I register logger "type810T" with nex "staticLoggerNumberType810T" length of 16
    Then I should see request with status "created"

  @ignore
  Scenario: User is not able to duplicate logger 810T
    When I register logger "type810T" with nex "staticLoggerNumberType810T" length of 16
    Then I should see request with status "conflict"

  Scenario: User is not able to register not supported logger
    When I register logger "type80080801NT" with nex "newNexLoggerNumberType80080801NT" length of 16
    Then I should see request with status "bad request"

  Scenario: User is not able to register supported logger 810T without nex number
    When I register logger "type810T" with nex "" length of 16
    Then I should see request with status "bad request"

  Scenario: User is able to register supported logger 810T with nex length of 1
    When I register logger "type810T" with nex "valid" length of 1
    Then I should see request with status "created"

  Scenario: User is not able to register supported logger 810T with nex length of 17
    When I register logger "type810T" with nex "checkLength" length of 17
    Then I should see request with status "bad request"