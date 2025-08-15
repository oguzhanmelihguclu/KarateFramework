Feature: Retrieve financial data from Gold, Currency, and Stock Market API

  Background:

    * def token = collectApiToken
    Given url goldStockMarketBaseUrl
    And path 'economy', 'currencyToAll'
    And header Authorization = 'apikey ' + token
    And header content-type = 'application/json'

  Scenario: Send GET request and verify success is true

    And params { int: 10 , base: 'USD' }
    When method GET
    And print response
    Then match response.success == true
    Then status 200

  Scenario:  Verify that the data contains Argentine Peso
    And params { int: 10 , base: 'USD' }
    When method GET
    And print response
    Then match response.result.data[0].name == 'Argentine Peso'

  Scenario: Verify that 1 USD equals 1.550903 Australian Dollar
    And params { int: 10 , base: 'USD' }
    When method GET
    And print response
    Then assert response.result.data[1].rate > 1.4
    And assert response.result.data[1].rate < 1.7


