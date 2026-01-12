Algoritmo snake
	Dimensionar wfondo[10],filu[30,2],toshow[10,30]
	wfondo[1] ="##############################"
	wfondo[2] ="#                            #"
	wfondo[3] ="#                            #"
	wfondo[4] ="#                            #"
	wfondo[5] ="#                            #"
	wfondo[6] ="#                            #"
	wfondo[7] ="#                            #"
	wfondo[8] ="#                            #"
	wfondo[9] ="#                            #"
	wfondo[10]="##############################"
    // crea una serpiente de longitud largo
    largo=5
	para e=1 hasta largo
		filu[e,1]=3
		filu[e,2]=10-e
    FinPara
	score=0
	haycomida="no"
	seguir="si"
	direccion=3 // 1 izq, 2-arriba, 3-derecha, 4 abajo
	perder="no"
	posy=3
	posx=9
	// presentacion
	escribir ""
	escribir "                 MINIJUEGOS PSEINT"
	escribir "     _____   __  __   _____  __   ___  _____  "
	escribir "    /  ___> |  \|  | /  _  \ |  |/  / |  ___| "
	escribir "    \___  \ |      | |  _  | |     <  |  ___| "
	escribir "    <_____/ |__|\__| \_/ \_/ |__|\__\ |_____| "
	escribir ""
	escribir "         presiona una tecla para empezar"
    esperar tecla	
	mientras seguir="si"
		si haycomida="no"
			comiday=4+azar(5)
			comidax=2+azar(27)
			haycomida="si"
		FinSi
		// primero carga el fondo
		para k=1 hasta 10
			para j=1 hasta 30
				toshow[k,j]=Subcadena(wfondo[k],j,j]
			FinPara
		FinPara	
        // dibuja sobre toshow snake
		para e=1 hasta largo
   			  toshow[filu[e,1],filu[e,2]]="%"
		FinPara	
        // dibuja comida
		toshow[comiday,comidax]="@"
        // muestra pantalla
		Limpiar Pantalla
		para yy=1 hasta 10
			char=""
			para x=1 hasta 30
				char=char+toshow[yy,x]
			FinPara
			escribir char
		FinPara
		escribir "Score:",score," " Sin Saltar
		// a mover el bote
        esperar 200 Milisegundos
		tecla=ultimatecla(1)
		si tecla<>0
			segun tecla
				caso 37:
					si direccion<>3
						direccion=1
					finsi	
				caso 38:
					si direccion<>4
						direccion=2
					finsi	
				caso 39:
					si direccion<>1
    					direccion=3
					finsi	
				caso 40:
					si direccion<>2
    					direccion=4
					finsi	
				de otro modo:
					// no hace nada
			FinSegun
			esperar 180 Milisegundos
		finsi
		// genera nueva posicion para la cabeza en base a direccion 
		segun direccion
			caso 1:
				posx=posx-1
			caso 2:
				posy=posy-1
			caso 3:
				posx=posx+1
			caso 4:
				posy=posy+1
		FinSegun
		// la estrategia es crear una estructura de cola donde agregamos un elemento al inicio
		// y (sino crece) borramos el ultimo avanza virtualmente la serpiente, si la cabeza pasa x la comida, la come
        para e=largo hasta 2 con paso -1
			filu[e,1]=filu[e-1,1]
			filu[e,2]=filu[e-1,2]
		FinPara
		filu[1,1]=posy
		filu[1,2]=posx
		// detecta colisiones
		si toshow[filu[1,1],filu[1,2]]="@" // comida
			score=score+1
			haycomida="no" // pone el flag en no para remapear
			si largo<30 // crece solo hasta 15
				largo=largo+1
				filu[largo,1]=filu[largo-1,1]
				filu[largo,2]=filu[largo-1,2]
			FinSi
		FinSi
		si toshow[filu[1,1],filu[1,2]]="#" // se comio el borde
			mensaje="Chocaste el borde!"
			seguir="no"
		FinSi
		si toshow[filu[1,1],filu[1,2]]="%" 
			mensaje="Chocaste con vos mismo!"
			seguir="no"
		FinSi 
	FinMientras
	escribir mensaje
	esperar Tecla
	Esperar 540 Milisegundos
	Limpiar Pantalla
	escribir "+juegos en =>"
	escribir "https://www.youtube.com/@minijuegospseint"
	Esperar 540 Milisegundos
FinAlgoritmo
