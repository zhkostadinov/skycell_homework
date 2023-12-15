Feature: Logger type 812P

  Scenario: User is able to register logger 812P
    When I register logger "type812P" with nex "staticLoggerNumberType812P" length of 16
    Then I should see request with status "created"

  @ignore
  Scenario: User is not able to duplicate logger 812P
    When I register logger "type812P" with nex "staticLoggerNumberType812P" length of 16
    Then I should see request with status "conflict"

  Scenario: User is not able to register not supported logger type
    When I register logger "type80128012P" with nex "newNexLoggerNumberType80080801NT" length of 16
    Then I should see request with status "bad request"

  Scenario: User is not able to register supported logger 812P without nex number
    When I register logger "type812P" with nex "" length of 16
    Then I should see request with status "bad request"

  Scenario: User is able to register supported logger 812P with nex length of 1
    When I register logger "type812P" with nex "valid" length of 1
    Then I should see request with status "created"

  Scenario: User is not able to register supported logger 812P with nex length of 17
    When I register logger "type812P" with nex "checkLength" length of 17
    Then I should see request with status "bad request"