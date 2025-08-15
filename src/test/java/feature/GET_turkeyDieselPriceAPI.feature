Feature: Retrieve fuel prices from the Fuel API

  Background:
    * def token = collectApiToken
    Given url fuelBaseUrl
    And path 'gasPrice','turkeyDiesel'
    And header Authorization = 'apikey ' + token
    And header content-type = 'application/json'

  Scenario: Get current fuel prices for a specific city

    And param city = 'istanbul'
    And param district = 'kadikoy'
    When method GET
    And print response
    Then status 200

  Scenario: Check Seferihisar, Izmir has at least one diesel price
    And params { city: 'izmir', district: 'seferihisar' }
    When method GET
    Then status 200
    Then match response.success == true
    * def hasDiesel = response.result.filter(x => x.dizel != null).length > 0
    Then assert hasDiesel

  Scenario: Check Petrol Ofisi diesel price exists in Cankaya, Ankara
    And params { city: 'ankara', district: 'cankaya' }
    When method GET
    Then status 200
    Then match response.success == true
    * def po = response.result.filter(x => x.marka == 'Petrol Ofisi')[0]
    Then assert po.dizel != null




