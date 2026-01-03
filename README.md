Recompilacion de la herramienta pseint que permite a traves del comando "esperar x segundos" escuchar el buffer de teclado.
dentro de la carpeta "pruebas" hay un ejemplo de eso. se llama laberinto.psc y corre (de manera operativa) solo con esta compilacion.

Este es la primer prueba, el concepto es el siguiente:
la instruccion esperar no solo espera sino que escucha el teclado, luego puede consultarse con la funcion ultimatecla(1), si se presion algo, sino devuelve cero.
funciona con enter (13), espacio (32) y izq (37) arriba (38) derecha (39) abajo (40).
parche: como a veces si hace falta esperar sin escuchar el teclado y no queria complicarme use este truco (muy precario) si el valor en milisegundos es modulo de 50, activa la escucha de teclado, sino, no.

Es un portable, hay que bajar el zip, descomprimir y buscar el ejecutable en la carpeta \bin\wxpseint.exe

Para descargar busca en "releases". los fuentes estan en el zip. 

Esta es solo una compilacion para mis alumnos, si quieres y puedes mejorar el concepto o el proyecto! adelante!
