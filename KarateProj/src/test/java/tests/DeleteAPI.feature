Feature: Karate Del Functionality

  ### Delete Resource ###
  Scenario: Del Request
    Given url 'https://reqres.in/api/users'
    And request {"name": "Sachin","job": "Sports"}
    When method Post
    Then status 201
    And print response
    And print responseStatus
    And print responseTime
    
    * def id = response.id
    * def deleteurl = 'https://reqres.in/api/users/'+ id
    
    Given url deleteurl
    When method Delete
    Then status 204
    