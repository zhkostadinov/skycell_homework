Feature: Authentication

  Scenario: User is able to authenticate
    When I register member with "static_username" and "static_password"
    Then I should see token is generated with status "successfully"

  Scenario: User is not able to authenticate without username
    When I register member with "wrong_username" and "static_password"
    Then I should see token is generated with status "invalid_grant"

  Scenario: User is not able to authenticate without password
    When I register member with "static_username" and "wrong_password"
    Then I should see token is generated with status "invalid_grant"

  Scenario: User is not able to authenticate without username and password
    When I register member with "wrong_username" and "wrong_password"
    Then I should see token is generated with status "invalid_grant"