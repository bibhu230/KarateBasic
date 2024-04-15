@SIT2
Feature: Get API Projects

  Background: 
    #* url 'https://reqres.in/api'
    * url baseURL
    * header Accept = 'application/json'

  ### Simple Get Req ###
  Scenario: Get Proj v1
    Given url "https://reqres.in/api/users?page=2"
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  ### Get Req with Background ###
  Scenario: Get Proj v2
    Given path "/users?page=2"
    When method GET
    Then status 200
    And print response
    And print responseStatus

  ### Get Req with Params ###
  Scenario: Get Proj v3
    Given path "/users"
    And param page = 2
    When method GET
    Then status 200
    And print response
    And print responseStatus
