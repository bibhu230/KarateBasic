@SIT1
Feature: Get API Demo

  Background: 
    * url baseURL
    * header Accept = 'application/json'

  # With Background  and Path
  Scenario: Get demo with Config
    Given print name
    Given path "/users"
    And param page = 2
    When method GET
    Then status 200
    And print response
    And print responseStatus
