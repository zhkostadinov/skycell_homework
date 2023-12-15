@ignore
Feature: Asset and Logger Tracking in Web App

  Background: Member account
    Given I am on web login page
    When I navigate to logger page
    And I enable asset and logger tracking feature

  Scenario: Enable asset and logger tracking feature
    Then I should see enabled the tracking feature

  Scenario: Verify real-time tracking of assets
    When "assets" are in motion
    Then the web app should display real-time data of the tracked "assets"

  Scenario: Ensure accurate logger status in the web app
    When "logger" is in motion
    Then the web app should display real-time data of the tracked "logger"

  Scenario: Check historical tracking data retrieval
    When I requests historical tracking data for an asset or logger
    Then the web app should provide accurate historical location and status information

  Scenario: Validate asset grouping and categorization
    When I organize assets into groups and categories
    Then the web app should display assets accordingly for efficient tracking

  Scenario: Ensure customization of tracking preferences
    When I customize tracking preferences, such as update frequency at "2" hours
    Then the web app should reflect the updated preferences for tracking