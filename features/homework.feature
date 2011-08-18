Feature: Manage Homework
  In order to start keep track of my homework
  the User
  wants the to be able to create, view and manipulate his homework

  Scenario: I can create new homework
    Given I am signed in
    When I go to the new homework page
     And I fill in the following:
     | Name     | New Homework                    |
     | Criteria | Some criteria for this homework |
     | Due Date | 2011-09-01                      |
     And I press "Create Homework"
    Then I should be on the home page
     And I should see 1 piece of homework
     And I should see "New Homework" within ".homework"

  Scenario: I can't create homework without a due date
    Given I am signed in
    When I go to the new homework page
     And I fill in the following:
     | Name     | New Homework                    |
     | Criteria | Some criteria for this homework |
     And I press "Create Homework"
    Then I should see "Failed" within "#alerts .alert"
     And the "Name" field should contain "New Homework"
     And the "Criteria" field should contain "Some criteria for this homework"
