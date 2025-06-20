@REQ_MARVEL-001 @HU001 @crear_personaje @marvel_characters @Agente2 @E2 @iniciativa_marvel
Feature: MARVEL-001 Crear nuevo personaje (microservicio para creación de personajes Marvel)

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

  @id:1 @crearPersonaje @solicitudExitosa201
  Scenario: T-API-MARVEL-001-CA01-Crear personaje exitosamente 201 - karate
    * def jsonData = read('classpath:data/marvel_characters/request_creation_character.json')
    And request jsonData
    When method POST
    Then status 201
    # And match response != null
    # And match response.id != null

  @id:2 @crearPersonaje @errorValidacion400
  Scenario: T-API-MARVEL-001-CA02-Crear personaje con datos inválidos 400 - karate
    * def jsonData = read('classpath:data/marvel_characters/request_invalid_character.json')
    And request jsonData
    When method POST
    Then status 400
    # And match response.name == 'Name is required'
    # And match response.description == 'Description is required'
    # And match response.powers == 'Powers are required'
    # And match response.alterego == 'Alterego is required'

  @id:3 @crearPersonaje @errorServicio500
  Scenario: T-API-MARVEL-001-CA03-Crear personaje con error interno 500 - karate
    * def jsonData = read('classpath:data/marvel_characters/request_error_character.json')
    And request jsonData
    When method POST
    Then status 400
    # And match response.name == 'Name is required'
    # And match response.description == 'Description is required'
    # And match response.powers == 'Powers are required'
    # And match response.alterego == 'Alterego is required'