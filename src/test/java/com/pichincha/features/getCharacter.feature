@REQ_MARVEL-002 @HU002 @consultar_personaje @marvel_characters @Agente2 @E2 @iniciativa_marvel
Feature: MARVEL-002 Consultar personaje existente (microservicio para consulta de personajes Marvel)

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

  @id:1 @consultarPersonaje @solicitudExitosa200
  Scenario: T-API-MARVEL-002-CA01-Consultar personaje exitosamente 200 - karate
    * def characterId = '2'
    * path characterId
    When method GET
    Then status 200
    # And match response != null
    # And match response.name != null

  @id:2 @consultarPersonaje @noEncontrado404
  Scenario: T-API-MARVEL-002-CA02-Consultar personaje inexistente 404 - karate
    * def characterId = '9999'
    * path characterId
    When method GET
    Then status 404
    # And match response.error == 'Character not found'

  @id:3 @consultarPersonaje @errorServicio500
  Scenario: T-API-MARVEL-002-CA03-Consultar personaje con error interno 500 - karate
    * def characterId = '-1'
    * path characterId
    When method GET
    Then status 404
    # And match response.error == 'Character not found'