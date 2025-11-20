Exercicis Flutter – Explicación de cada ejercicio

Este repositorio contiene varios ejercicios prácticos de Flutter, que cubren widgets, manejo de estado, entradas de usuario, interacción con botones, listas y generación de números aleatorios.

A continuación se explica qué hace cada ejercicio.

2.1 – Good Morning App

Archivo: exercici2_1

Descripción:
Una pequeña aplicación que muestra un mensaje en pantalla y permite al usuario cambiarlo mediante botones.

Funcionalidad:

Texto principal que muestra un mensaje inicial: "Good ?!".

Botones:

Morning → Cambia el mensaje a "Good morning".

Night → Cambia el mensaje a "Good night".

Usa un StatefulWidget para actualizar la interfaz al pulsar los botones.

2.2 – Say Hello App

Archivo: exercici2.2

Descripción:
Una aplicación que pide al usuario un nombre y muestra un saludo mediante un diálogo emergente.

Funcionalidad:

Entrada de texto para que el usuario escriba su nombre.

Botón SayHello:

Muestra un AlertDialog con el saludo.

Si no se introduce nombre, muestra "HELLO !".

Control de estado mediante TextEditingController y setState().

2.3 – Secret Number Ordered

Archivo: exercici2.3

Descripción:
Juego de adivinar un número secreto generado aleatoriamente entre 0 y 100.

Funcionalidad:

Entrada de texto para adivinar el número.

Botón VALIDAR:

Comprueba si el número es menor, mayor o igual al número secreto.

Muestra un mensaje adecuado:

"El número que buscas es más grande."

"El número que buscas es más pequeño."

"¡Has acertado!"

Contador de intentos.

Usa StatefulWidget para actualizar el mensaje y los intentos.

2.4 – Dice Roller App

Archivo: exercici2.4
Descripción:
Simula el lanzamiento de dos dados usando imágenes SVG.

Funcionalidad:

Botón ROLL THE DICE:

Genera dos números aleatorios entre 1 y 6.

Muestra los dados correspondientes usando SVG.

Si ambos dados muestran 6, aparece un SnackBar con "JACKPOT!".

La interfaz usa SvgPicture para mostrar imágenes vectoriales.

2.5 – Score Counter

Archivo: exercici2.5

Descripción:
Marcador simple para dos equipos con botones para aumentar la puntuación.

Funcionalidad:

Dos columnas: TEAM A y TEAM B.

Cada columna contiene:

Nombre del equipo.

Puntuación actual.

Botón SCORE para sumar 1 punto.

La interfaz actualiza en tiempo real usando setState().

2.6 – Shopping List

Archivo: exercici2.6

Descripción:
Aplicación que permite crear una lista de la compra agregando elementos con nombre y cantidad.

Funcionalidad:

Campos de entrada: Nombre y Cantidad.

Botón Add:

Valida el nombre (obligatorio).

Normaliza la cantidad (por defecto 1).

Añade el artículo a la lista.

Lista interactiva:

Muestra los artículos añadidos.

Cada elemento tiene botón para eliminarlo.

Usa StatefulWidget y ListView para mostrar dinámicamente la lista.


2.7 – Provider

Descripción:
En este ejercicio aplicas el manejo de estado global usando el paquete Provider en Flutter, siguiendo el tutorial en vídeo: “Flutter Course – Managing State with Providers (100% explained)
”. 
YouTube

Funcionalidad:

Configuración de Provider para exponer y escuchar datos de estado en la app.

Uso de clases como ChangeNotifier para gestionar cambios de estado.

Incorporación de ChangeNotifierProvider, Consumer o Provider.of(...) para que los widgets reaccionen a cambios.

La app implementa un ejemplo conforme al tutorial (por ejemplo un contador o lista que cambia a través del provider).

El ejercicio está incluido en el repositorio como parte del paquete de ejercicios completos.

Tecnologías y conceptos clave:

Paquete provider para Flutter (gestión de estado).

ChangeNotifier / Notifier como clase de estado.

ChangeNotifierProvider en el árbol de widgets.

Consumer<T> o context.watch<T>() / context.read<T>() para acceder al estado.

Separación de lógica y UI mediante provider.

Beneficio: estado compartido y reactivo sin necesidad de propagar manualmente setState().


Tecnologías usadas

Flutter (Dart)

Widgets básicos: StatelessWidget, StatefulWidget, Text, TextField, ElevatedButton, Column, Row

Gestión de estado: setState()

Entradas de usuario: TextEditingController

Listas y ListView

Generación de números aleatorios: Random

SnackBar y AlertDialog para mensajes emergentes

SVG (flutter_svg) para mostrar imágenes vectoriales