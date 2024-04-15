Feature: Put API Projects

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  ### Simple Put Req ###
  Scenario: Put Proj v1
    Given url "https://reqres.in/api/users/2"
    And request {"name": "morpheus","job": "zion resident"}
    When method PUT
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And match responseStatus == 200

  ### To verify status 404 ###
  Scenario: Put Proj v2
    Given url "https://reqres.in"
    And request {"name": "morpheus","job": "zion resident"}
    When method PUT
    Then status 404
    And print response
    And print responseStatus
    And print responseTime
    And match responseStatus == 404
