# Proyecto base de pruebas automatizadas con Karate, Java y Gradle

Este proyecto es una base para implementar pruebas automatizadas de APIs REST usando Karate, Java y Gradle. Incluye ejemplos y estructura recomendada para pruebas de microservicios como la Marvel Characters API.

## Instrucciones de uso

### 1. Descarga del proyecto

Clona este repositorio en tu máquina local:

```sh
git clone https://github.com/LeoCtyDevsu/20250620-karate.git
cd 20250620-karate
```

### 2. Escribe tus pruebas

- Implementa los escenarios de prueba en los archivos `.feature` dentro de:
  - `src/test/java/com/pichincha/features/`
- Usa la sintaxis de Karate para definir los escenarios y validaciones.
- Los datos de prueba deben estar en archivos `.json` dentro de:
  - `src/test/resources/data/marvel_characters/`

### 3. Ejecuta las pruebas

Asegúrate de tener Java 17, 18 o 21 instalado y activo. Luego ejecuta:

```sh
./gradlew test
```

Esto compilará el proyecto y ejecutará todas las pruebas automatizadas.

### 4. Revisa los reportes

- Los reportes de ejecución se generarán en la carpeta `build/reports/tests/test/`.
- Los logs de Karate estarán en `target/karate.log`.

---

### Notas adicionales

- Si tienes problemas de SSL, puedes agregar la línea `* configure ssl = true` en el `Background` de tu archivo `.feature`.
- Puedes modificar la configuración de endpoints y headers en el archivo `karate-config.js`.
- Para cambiar el remoto de git, usa:
  ```sh
  git remote set-url origin https://github.com/LeoCtyDevsu/20250620-karate.git
  ```

---

### Estructura recomendada

```
src/
  test/
    java/
      com/
        pichincha/
          features/
            createCharacter.feature
            getCharacter.feature
            updateCharacter.feature
    resources/
      data/
        marvel_characters/
          request_creation_character.json
          request_invalid_character.json
          ...
karate-config.js
build.gradle
```

---

### Referencias

- [Documentación oficial de Karate](https://karatelabs.github.io/karate/)
- [Guía de la Marvel Characters API](README_consolidated.md)
