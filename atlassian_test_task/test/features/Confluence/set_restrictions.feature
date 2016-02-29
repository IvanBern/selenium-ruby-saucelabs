Feature: Set restrictions on an existing page
  This feature lets a user to set restrictions on an existing page.

  Scenario: User can set restrictions on an existing page
    Given I am logged to Confluence
    When I change restrictions for page
    Then I verify that page has new restrictions