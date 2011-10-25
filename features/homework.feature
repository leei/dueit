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
     And I should see "New Homework" within the list of homework

  Scenario: I can't create homework without a due date
    Given I am signed in
    When I go to the new homework page
     And I fill in the following:
     | Name     | New Homework                    |
     | Criteria | Some criteria for this homework |
     And I press "Create Homework"
    Then I should see "Failed" within the alerts
     And the "Name" field should contain "New Homework"
     And the "Criteria" field should contain "Some criteria for this homework"

  @javascript
  Scenario: I can destroy a homework that I created
    Given I am signed in
      And I have 2 pieces of homework
    When I go to the home page
    Then I should see 2 pieces of homework
    When I follow "Delete" within the first homework
    Then I should be on the home page
     And I should see 1 piece of homework

  @javascript
  Scenario: I can mark a homework as done
    Given I am signed in
      And I have 2 pieces of homework
    When I go to the home page
    Then I should see 2 pieces of homework
    When I follow "Done" within the first homework
    Then I should be on the home page
     And I should see 2 pieces of homework
     And I should see 1 pieces of done homework

  Scenario: I can edit a homework's name
     Given I am signed in
      And I have 1 piece of homework
     When I go to the home page
      And follow "Edit"
      And fill in "Name" with "New Name"
      And press "Update Homework"
     Then I should see "New Name"

