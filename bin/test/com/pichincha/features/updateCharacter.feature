@REQ_MARVEL-003 @HU003 @actualizar_personaje @marvel_characters @Agente2 @E2 @iniciativa_marvel
Feature: MARVEL-003 Actualizar personaje existente (microservicio para actualización de personajes Marvel)

  Background:
    * url port_marvel_characters
    * def username = 'lcarmena'
    * path username, 'api', 'characters'
    * def generarHeaders =
      """
      function() {
        return {
          "Content-Type": "application/json"
        };
      }
      """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @actualizarPersonaje @solicitudExitosa200
  Scenario: T-API-MARVEL-003-CA01-Actualizar personaje exitosamente 200 - karate
    * def characterId = '2'
    * path characterId
    * def jsonData = read('classpath:data/marvel_characters/request_update_character.json')
    And request jsonData
    When method PUT
    Then status 200
    # And match response != null
    # And match response.name == jsonData.name

  @id:2 @actualizarPersonaje @errorValidacion400
  Scenario: T-API-MARVEL-003-CA02-Actualizar personaje con datos inválidos 400 - karate
    * def characterId = '2'
    * path characterId
    * def jsonData = read('classpath:data/marvel_characters/request_invalid_update.json')
    And request jsonData
    When method PUT
    Then status 400
    # And match response.name == 'Name is required'
    # And match response.description == 'Description is required'
    # And match response.powers == 'Powers are required'
    # And match response.alterego == 'Alterego is required'

  @id:3 @actualizarPersonaje @errorServicio500
  Scenario: T-API-MARVEL-003-CA03-Actualizar personaje con error interno 500 - karate
    * def characterId = '2'
    * path characterId
    * def jsonData = read('classpath:data/marvel_characters/request_error_update.json')
    And request jsonData
    When method PUT
    Then status 400
    # And match response.name == 'Name is required'
    # And match response.description == 'Description is required'
    # And match response.powers == 'Powers are required'
    # And match response.alterego == 'Alterego is required'