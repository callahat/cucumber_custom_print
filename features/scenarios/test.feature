Feature: A simple test to show custom format methods

  Scenario: Run a google search
    Given I enter something into google
    When I run the search
    Then I tally up the number of results
    And I record results
    And I record results with custom formatting
