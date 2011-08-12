Feature: Home Page
  In order to start to use DueIt
  the User
  wants the home page to show him how to use it

  Scenario: See Sign In
    Given I am on the home page
    Then I should see "Sign In"
    And I follow "Sign In"

  Scenario: See instructions on home page if not signed in
    Given I am not signed in
    When I go to the home page
    Then I should see "To use DueIt, you must Sign In or Register an account."

  Scenario: Be allowed to create homework if signed in
    Given I am signed in
    When I go to the home page
    Then I should see "Add New Homework"
     And I follow "Add New Homework"
