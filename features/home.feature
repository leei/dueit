Feature: Home Page
  In order to start to use DueIt
  the User
  wants the home page to show him how to use it

  Scenario: See Sign In
    Given I am on the home page
    Then I should see "Sign In"
    And I follow "Sign In"
