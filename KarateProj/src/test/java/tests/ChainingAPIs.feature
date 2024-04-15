Feature: Chaining Demo

  # Get a value from response and chain in a request
  Scenario: API Request Response Chaining
    Given url 'https://reqres.in/api/users'
    And request { "name": "Google", "job": "Search"}
    When method POST
    Then status 201
    * def id = response.id
    * def requrl = 'https://reqres.in/api/users/'+ id
    * print requrl
    * def requestPayload =
      """
      {
             "name": "Firefox"
         }	
      """
    
    # Fetch data (job) from POST and update requestPayload
    * set requestPayload.job = response.job
    * print requestPayload
    Given url requrl
    And request requestPayload
    When method PUT
    Then status 200
