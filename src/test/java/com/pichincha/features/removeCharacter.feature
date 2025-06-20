@REQ_MARVEL-004 @HU004 @eliminar_personaje @marvel_characters @Agente2 @E2 @iniciativa_marvel
Feature: MARVEL-004 Eliminar personaje existente (microservicio para eliminación de personajes Marvel)

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

  @id:1 @eliminarPersonaje @solicitudExitosa204
  Scenario: T-API-MARVEL-004-CA01-Eliminar personaje exitosamente 204 - karate
    * def characterId = '3'
    * path characterId
    When method DELETE
    Then status 204

  @id:2 @eliminarPersonaje @noEncontrado404
  Scenario: T-API-MARVEL-004-CA02-Eliminar personaje inexistente 404 - karate
    * def characterId = '9999'
    * path characterId
    When method DELETE
    Then status 404
    # And match response.error == 'Character not found'