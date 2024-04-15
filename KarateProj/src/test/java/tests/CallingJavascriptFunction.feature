Feature: Calling javascript custom functions

  Background: 
    * url 'https://gorest.co.in'

  Scenario: Calling javascript functions
    * def getName = function() { return "Hello"}
    * def value = getName()
    * print value
    * def getName1 = function(name) { return name}
    * def value1 = getName1("World")
    * print value1
    * def getName2 =
      """
      function(name)
      {
        welcome = "Hello " + name;
        return welcome
      }
      """
    * def value2 = getName2("Everyone")
    * print value2

  Scenario: Calling javascript functions from js file
    * def jsUtils1 = read('classpath:utils/jsutils.js')
    * def val = jsUtils1().printName()
    * print val
    * def dynamicString = jsUtils1().dyn_string(10)
    * print dynamicString
    * def requestPayload =
      """
      {
             "name": "John",
             "gender": "male",
             "status": "active"
         }	
      """
    # * requestPayload.email = dynamicString + "@gmail.com"
    * set requestPayload.email = dynamicString + "@gmail.com"
    * print requestPayload
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'John'
    And match $.data.email == requestPayload.email
