Feature: Create a new page
  This feature lets a user can create a new page.

  Scenario: User can create a new page
    Given I am logged to Confluence
    When I create a new page
    Then I should see a new page