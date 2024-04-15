Feature: Karate sleep Functionality

  ### Sleep ###
  Scenario: Sleep Test
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    Given url 'https://reqres.in/api/users'
    When method GET
    * print 'Sleeping ...'
    * eval sleep(5000)
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
