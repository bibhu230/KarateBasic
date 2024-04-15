@SIT2
Feature: Post API Projects

  Background: 
    #* url 'https://reqres.in/api'
    * url baseURL
    * header Accept = 'application/json'

  ### Simple Post Req ###
  Scenario: Post Proj v1
    Given url "https://reqres.in/api/users"
    And request {"name": "karate","job": "automation"}
    When method POST
    Then status 201
    And print response
    And print responseStatus
    And print responseTime

  ### Post Req with Background ###
  Scenario: Post Proj v2
    Given path "/users"
    And request {"name": "maven","job": "build"}
    When method POST
    Then status 201
    And print response
    And print responseStatus
    And print responseTime

  ### Post Req with Assertions ###
  Scenario: Post Proj v3
    Given path "/users"
    And request {"name": "selenium","job": "plugin"}
    When method POST
    Then status 201
    And match response == {"name": "selenium","job": "plugin","createdAt": #ignore,"id": #string}
    And match responseStatus == 201
    And print response
    And print responseStatus
    And print responseTime
