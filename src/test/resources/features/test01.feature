Feature: As a data consumer, I want the department information stored in postgress DB correctly in department table.

  Background:
    Given Establish the database connection

  @db
  Scenario: verify department names in database
    When Execute query to get all columns for "departments"
    Then verify the below columns are listed in result for name

      | tax                  |
      | bookkeeping          |
      | payroll              |
      | consultancy-services |

  @db
  Scenario: verify role names in database
    When Execute query to get all columns for "roles"
    Then verify the below columns are listed in result for name
      | client     |
      | admin      |
      | supervisor |
      | advisor    |
      | employee   |
      | test       |
      | cedric     |
      | fff        |


