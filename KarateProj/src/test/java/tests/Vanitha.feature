@ignore
Feature: Login Details with POST method

  Background: detials
    * url 'https://reqres.in/api/login'

  Scenario: Login Successful
    Given url 'https://reqres.in/api/login'
    And request { email: 'eve.holt@reqres.in', password: 'cityslicka' }
    When method POST
    Then status 200

  Scenario: Login Unsuccessful
    Given url 'https://reqres.in/api/login'
    And request { email: 'peter@klaven'}
    When method POST
    Then status 400
