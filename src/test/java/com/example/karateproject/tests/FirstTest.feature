Feature: Sample Api Test

#  reqres.in - шаблон для тестирования Api

  Scenario: Test a Sample Api Test

    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200

