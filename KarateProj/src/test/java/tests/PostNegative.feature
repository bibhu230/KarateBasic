Feature: Post Negative Cases

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  ### Post Negative Req ###
  Scenario: Post Negative v1
    Given url "https://reqres.in/api/login"
    And request {"name": "karate","job": "automation"}
    When method POST
    Then status 400
    And print response
    And print responseStatus
    And print responseTime
