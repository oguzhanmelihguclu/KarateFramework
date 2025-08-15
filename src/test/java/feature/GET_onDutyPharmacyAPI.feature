Feature: Retrieve on-duty pharmacies from the Pharmacy on Duty API

  Background:
    * def token = collectApiToken
    Given url pharmacyBaseUrl
    And path 'health', 'dutyPharmacy'
    And header Authorization = 'apikey ' + token
    And header content-type = 'application/json'

  Scenario: Send GET request for on-duty pharmacies in Cankaya, Ankara and verify success is true
    And params { il: 'ankara', ilce: 'çankaya' }
    When method GET
    And print response
    Then match response.success == true
    Then status 200

  Scenario: Verify on-duty pharmacies in Cankaya, Ankara have valid structure
    And params { il: 'ankara', ilce: 'çankaya' }
    When method GET
    And print response
    Then status 200
    And match response.success == true
    And match response.result != []                      # Liste isnt empty check!
    And match each response.result contains {name: '#string',address: '#string',dist: '#string',phone: '#string',loc: '#string'}