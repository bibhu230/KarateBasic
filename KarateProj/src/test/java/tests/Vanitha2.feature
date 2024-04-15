@ignore
Feature: Get API Feature

  Scenario: get user details
    Given url baseUrl+'/public/v1/users'
    #And path '6823514'
    When method GET
    Then status 200
    #Then print status
    * print response
    * def jsonResponse = response
    * print jsonResponse
    * def actName = jsonResponse.data.name
    * def actId = jsonResponse.data.id
    * def actEmail = jsonResponse.data.email
    * print actName
    * match actName == 'Shivakari Chopra'
    * match actId == 6823519
    * match actEmail == 'chopra_shivakari@kub.test'
