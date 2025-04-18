Feature: PetStore üzerindeki GET sorgusu ile yapılan Api Test'leri

  Scenario: pet bölümündeki GET sorgusu yapılan API TESTI
    Given url petBaseUrl
    And path 'pet',250
    When method GET
    Then print response
    And status 404

    Scenario: store bölümündeki GET sorgusu yapılan API TESTI
      Given url petBaseUrl
      And path 'store','inventory'
      When method GET
      Then print response
      And status 200

     Scenario: user bölümündeki GET sorgusu yapılan API TESTI
       Given url petBaseUrl
       And path 'user','login'
       When method GET
       Then print response
       And status 200

       Scenario Outline: pet bölümünde GET sorgusu outline senaryo ile yapılan API TESTI <id>

         Given url petBaseUrl
         And path 'pet',id
         When method GET
         Then print response
         And status 404

         Examples:
         | id |
         | 250  |
         | 251  |
         | 252  |
         | 253  |


  Scenario Outline: pet bölümünde GET sorgusu outline senaryo ile yapılan API testi
    Given url petBaseUrl
    And path 'pet', read('classpath:data/examples.csv')
    When method GET
    Then print response
    And status 404

    Examples:
      | id          |
      | <call read('classpath:data/examples.csv')> |



    Scenario: Burada api testi yapacagim
      Given url petBaseUrl
      When path 'pet',250
      When method GET
      * print response
      When status 404
      When response.name == 'doggie'

      Scenario: Burada store bölümünden api get testi yapacagim.
        Given url petBaseUrl
        When path 'store','inventory'
        When method GET
        * print response
        When status 200
        When response.sold == 5

      Scenario: Burada pet bölümünden bir post api testi yapacagim.
        Given url petBaseUrl
        When path 'pet'
        * def myRequestBody =

        """
        {
  "id": 0,
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}
        """
        And request myRequestBody
        When method POST
        Then status 200
        * print response
        Then myRequestBody.id == response.id
        Then myRequestBody.name == response.name










