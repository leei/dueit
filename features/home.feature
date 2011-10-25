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
    Then I should see "To use DueIt, you must"

  Scenario: Be allowed to create homework if signed in
    Given I am signed in
    When I go to the home page
    Then I should see "Add New Homework"
     And I follow "Add New Homework"

  Scenario: See a list of my own homework
    Given I am signed in
    When I create 5 pieces of homework
     And I go to the home page
    Then I should see 5 pieces of homework

  Scenario: Don't show other account's homework on home page
    Given I am signed in
    When I create 5 pieces of homework by "other@gmail.com"
     And I go to the home page
    Then I should see 0 pieces of homework

  Scenario: Each homework should show its due date
    Given I am signed in
    When I create 5 pieces of homework due on "sep 10"
     And go to the home page
    Then I should see 5 pieces of homework
     And I should see "10 Sep" within the homework headers

  Scenario: Homework should appear soonest due first
    Given I am signed in
    When I create 1 piece of homework named "Third" due on "sep 12"
     And I create 1 piece of homework named "First" due on "sep 10"
     And go to the home page
    Then I should see 2 pieces of homework
     And I should see "First" before "Third" within the homework list
    When I create 1 piece of homework named "Second" due on "sep 11"
     And go to the home page
    Then I should see 3 pieces of homework
     And I should see "First" before "Second" within the homework list
     And I should see "Second" before "Third"
