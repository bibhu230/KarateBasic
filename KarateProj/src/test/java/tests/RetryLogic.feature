Feature: Karate Retry Functionality

  ### Retry ###
  Scenario: Retry Request
    Given url 'https://reqres.in/api/users'
    And request {"name": "Sachin","job": "Sports"}
    When method Post
    Then status 201
    And print response
    And print responseStatus
    And print responseTime
    
    * def id = response.id
    * def deleteurl = 'https://reqres.in/api/users/'+ id
    
    * configure retry = { count: 5, interval: 3000}
    And retry until responseStatus == 204
    
    Given url deleteurl
    When method Delete
    Then status 204
