Feature: Adivinar palabra

  Background: Definir palabra a adivinar
    Given que tengo la palabra "hola"

  Scenario: La letra indicada pertenece a la palabra
    When elijo "h"
    Then deberia ver "acierto"
    Then deberia ver "Estado: h***"

  Scenario: La letra indicada NO pertenece a la palabra
    When elijo "c"
    Then deberia ver "ups!"
    Then deberia ver "Estado: ****"

  Scenario: Luego de 3 no aciertos el juego esta perdido
    When elijo "c"
    When elijo "c"
    When elijo "c"
    Then deberia ver "ups!"
    Then deberia ver "Juego terminado, perdiste"

  Scenario: Si acierto todas las palabras el juego esta ganado
    When elijo "h"
    When elijo "o"
    When elijo "l"
    When elijo "a"
    Then deberia ver "Juego terminado, ganaste"
    Then deberia ver "Estado: hola"
