Feature: Post API Variable

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def requestPayload = 
	"""
	{
        "name": "Zebra",
        "job": "running",
    }	
	"""

  ### Post Req Variable Logic ###
  Scenario: Post Proj Variable
    Given url "https://reqres.in/api/users"
    And request requestPayload
    When method POST
    Then status 201
    And print response
    And print responseStatus
    And print responseTime
