Feature: POST API Demo

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')

#  Simple POST
  Scenario: POST Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "Vasya","job": "lead"}
    When method POST
    Then status 201
    And print response

    #  POST with Background
  Scenario: POST Demo 2
    Given path '/users'
    And request {"name": "Vasya","job": "lead"}
    When method POST
    Then status 201
    And print response

    #  POST with Assertions
  Scenario: POST Demo 3
    Given path '/users'
    And request {"name": "Vasya","job": "lead"}
    When method POST
    And match response == {"name": "Vasya", "job": "lead", "id": "#string", "createdAt": "#ignore"}
    Then status 201
    And print response

    #  POST with read from file
  Scenario: POST Demo 4
    Given path '/users'
    And request {"name": "Vasya","job": "lead"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response
