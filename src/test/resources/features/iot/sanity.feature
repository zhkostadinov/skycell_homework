@ignore
Feature: Sanity checks for IoT project where the customer uses SkyCell’s LoRa-based loggers to track their asset fleet.

  Scenario: Customer can login successfully by providing valid credentials
    Given I am on web login page
    When I login with valid credentials
    Then I should see my dashboard

  Scenario: User can login with a newly created user
    Given I am on web login page
    When I login with valid credentials
    Then I should see my dashboard

  Scenario: User can successfully edit his profile
    Given I am logged in web with valid credentials
    When I edit my profile with "profile_data.static_first" and "profile_data.static_last" name
    Then I view the profile updated with "profile_data.static_first" and "profile_data.static_last" name

  Scenario: User can logout successfully
    Given I am logged in web with valid credentials
    When I logout
    Then I should see login page
