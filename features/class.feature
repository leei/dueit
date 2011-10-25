Feature: Classes
  In order to share homework with other students
  the User
  wants to be able to keep track of their Classes
  
  Scenario: A User can create a new class
    Given I am signed in
    When I am on the home page
    Then I should see "Create a Class"
    When I follow "Create a Class"
    Then I should see "Class Name"
    When I fill in the following:
     | Class Name | Gym       |
     | School     | Eric Hamber Secondary |
     | Teacher    | Some Guy   |
     | Year       | 2011 |
     | Term       | 1 |
     | Period     | 2-4 |
     And I press "Create Class"
	Then I should see a class named "Gym"
  
