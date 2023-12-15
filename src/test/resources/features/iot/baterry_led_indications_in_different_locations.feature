@ignore
Feature: LED Blinking for Low Battery in Chosen Locations

  Background: Company account
    Given I am on login page
    When I navigate to battery page

  Scenario: Enable LED blinking for low battery in chosen locations
    And  I configure LED blinking feature in location "static.first.location"
    Then the system should allow enabling LED blinking for low battery in "static.first.location"

  Scenario: Ensure LED stops blinking after battery replacement
    And  I configure LED blinking feature in location "static.first.location"
    When the battery is replaced in that location
    Then the LED outside the logger at that "static.first.location" should stop blinking

  Scenario: Check LED behavior in locations not chosen for battery exchange
    And  I configure LED blinking feature in location "static.first.location"
    And dynamic battery level threshold settings are configured
    When a location's battery level falls below the threshold
    And the "static.first.location" is not chosen for a battery exchange
    Then the LED outside the logger at that "static.first.location" should continue blinking

  Scenario: Verify LED behavior when battery level rises above threshold
    And  I configure LED blinking feature in location "static.first.location"
    When the battery level rises above the threshold
    Then the LED outside the logger at that "static.first.location" should continue blinking