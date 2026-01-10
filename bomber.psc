Algoritmo bomber
	// mini juegos pseint es un proyecto educativo de uso libre
	// funciona sobre una version con pequeñas modificaciones de pseint
	// que permite capturas de teclas en tiempo real
	// el repositorio para bajar la version es
	// https://github.com/pgualda/pseintkalfvragkvl/releases/tag/pseudocodigo
	// autor de la compilacion y de este codigo: daniel gualda
	// neuquen capital - argentina
	Dimensionar wfondo[10],fondo[10,30],toshow[10,30] // todo el fondo, pantalla a mostrar
	wfondo[1] ="##############################"
	wfondo[2] ="#                        #####"
	wfondo[3] ="#                        #X  #"
	wfondo[4] ="#  X##    ########## #       #"
	wfondo[5] ="#####   ###  X #######   # ###"
	wfondo[6] ="#         #      ##    #     #"
	wfondo[7] ="#         # #    ##   X#     #"
	wfondo[8] ="#       #####         ##     #"
	wfondo[9] ="#                            #"
	wfondo[10]="##############################"
	// copia wfondo a fondo // mejora la manipulacion
	para k=1 hasta 10
		para j=1 hasta 30
			fondo[k,j]=Subcadena(wfondo[k],j,j]
		FinPara
	FinPara	
    // ascii assets personaje
	a1="-(- -(- -(- -(-!-)- -(- -(- -)-!-)- -)- -)- -)-!-)- -(- -(- -)-!o(O o(o O(o O(O!o)O o(o O(o O)O!o)O o)o O)o O)O!o)O o(o O(o O)O!x)x x(x x(x x)x"
	a2="((  ( (  (( ( (!( ) ) ) ) ( ( (!))  ) )  )) ) )!( ) ) ) ) ( ( (!((  ( (  (( ( (!( ) ) ) ) ( ( (!))  ) )  )) ) )!( ) ) ) ) ( ( (!( ) ) ) ) ( ( ("
	Dimensionar s[9,4,2,3] // los 6 estados en sus 4 poses, las dos lineas, y los 3 caracteres de cada linea
	Para a=0 hasta 8 
		Para b=0 hasta 3
			Para c=0 hasta 2
				s[a+1,b+1,1,c+1]=subcadena(a1,(a*16)+(b*4)+c+1,(a*16)+(b*4)+c+1)
				s[a+1,b+1,2,c+1]=subcadena(a2,(a*16)+(b*4)+c+1,(a*16)+(b*4)+c+1)
			FinPara
		FinPara
	FinPara
	//para a=1 hasta 6
	//	escribir "pose ",a
	//	para b=1 hasta 4
	//		escribir s[a,b,1,1]+s[a,b,1,2]+s[a,b,1,3]
	//		escribir s[a,b,2,1]+s[a,b,2,2]+s[a,b,2,3]
	//	FinPara
	//FinPara
	charposx=2
	charposy=8
	bombposx=1
	bombposy=1
	direccion="R"
	seguir="si"
	redibuja="si"
	pose=3  
	subpose=1
	bomb=0
	espacio=" "
	tiempo=0
	xreco=0
	perder="no"
	cantbomb=4
    // presentacion
	Limpiar Pantalla
	escribir ""  
    escribir "    Simple bomberman - minijuegos pseint"	
	escribir "   usa los cursores para mover al personaje"
	escribir "   espacio para colocar bombas y detonarlas"
	escribir "         o desplazate y detonaran solas!"  
	escribir ""  
	escribir "         Cualquier tecla para continuar"
    esperar tecla	
	esperar 180 Milisegundos // espera forzada para lograr fluidez, como no es multiplo de 50, espera pura
	// game loop
	concatena=""
	mientras seguir="si"
		si redibuja="si"
			redibuja="no" 
			// primero carga el fondo
			para k=1 hasta 10
				para j=1 hasta 30
					toshow[k,j]=fondo[k,j]
				FinPara
			FinPara	
			// si perdio, pose=9
			si perder="si"
				pose=9
			FinSi
			// luego mapea el personaje en la posicion actual, si alguno de los cuadros del personaje con blancos, no dibuja nada
			// esto permite bloqueo, forzar movimientos, etc, mas que nada uan vez que puso la bomba.
    		para j=0 hasta 2
				para l=0 hasta 1
    				si s[pose+bomb,subpose,l+1,j+1]<>" "
						toshow[charposy+l,charposx+j]=s[pose+bomb,subpose,l+1,j+1]
		    	    finsi		
				finpara
			FinPara	
			// si dibuja la bomba
			si bomb=4 y tiempo>0
				toshow[bombposy,bombposx]="@"
			FinSi
            // muestra pantalla			
    		Limpiar Pantalla
    		para yy=1 hasta 10
	    		char=""
     			para x=1 hasta 30
				    char=char+toshow[yy,x]
     			FinPara
	    		escribir char
    		FinPara
			// muestra consola o despues variables del juego
			escribir "Bombs:",cantbomb," X:",xreco," " Sin Saltar
		FinSi
		// luego de redibujar setea condiciones de salida
		si perder="si"
			mensaje="Perdiste!"
			seguir="no"
		FinSi
		si xreco=4 Entonces
			mensaje="Ganaste!"
			seguir="no"
		FinSi
        esperar 10 segundos 		
		tecla=ultimatecla(1)
	    esperar 180 Milisegundos // espera forzada para lograr fluidez, como no es multiplo de 50, espera pura
    	si tecla<>0 // solo si se presiono algo
    		// lo que vamos a hacer es movernos virtualmente en la direccion solicitada
    		// si el movimiento es un conjunto de casillas libres lo hace
		    wcharposx=charposx
    		wcharposy=charposy
			wpose=1 // pose x defecto
			wdireccion=direccion
			si (tecla=37) o (tecla=38) o (tecla=39) o (tecla=40) // movimientos
				segun tecla
					caso 37:
						wpose=1
						wcharposx=charposx-1
						wdireccion="L"
					caso 38:
						wpose=2
						wcharposy=charposy-1
						wdireccion="U"
					caso 39:
						wpose=3
						wcharposx=charposx+1
						wdireccion="R"
					caso 40:
						wpose=4
						wcharposy=charposy+1
						wdireccion="D"
				FinSegun
				puedomover="si" // verifica en el fondo si no hay nada
				concatena=""
				para j=0 hasta 2
					para l=0 hasta 1
						si s[pose+bomb,subpose,l+1,j+1]<>espacio // si la posicion dentro del personaje tiene algo
							// concatena=Concatenar(concatena,fondo[wcharposy+l,wcharposx+j])
							si fondo[wcharposy+l,wcharposx+j]="#"  // chekea en el fondo, porque en toshow ya esta dibujado el personaje
								puedomover="no" // si es una X se la come y si es explosion pasa
							finsi	
						finsi		
					finpara
				FinPara	
				si puedomover="si" // todo estaba libre en el fondo
					charposx=wcharposx
					charposy=wcharposy
				FinSi
				pose=wpose // cambio de direccion y frame dentro de la direccion actualiza, movio o no
				direccion=wdireccion // cambia la direccion se pudo movero o no
				redibuja="si"
				subpose=subpose+1
				si subpose>4
					subpose=1
				FinSi
				si tiempo>0
					tiempo=tiempo-1
				FinSi
				// si se comio una x actualiza el contador y la borra del fondo
				para j=0 hasta 2
					para l=0 hasta 1
						si fondo[charposy+l,charposx+j]="X"  // si se comio una X
							fondo[charposy+l,charposx+j]=" " // la elimina del fondo 
							xreco=xreco+1
						finsi	
					finpara
				FinPara	
			finsi
			si tecla=32 // colocar o detonar bomba
				redibuja="si"
				si bomb=0 // intenta colocar la bomba
					si direccion="L"
						wbombposx=charposx-1
						wbombposy=charposy+1
					FinSi
					si direccion="U"
						wbombposx=charposx+1
						wbombposy=charposy-1
					FinSi
					si direccion="R"
						wbombposx=charposx+3
						wbombposy=charposy+1
					FinSi
					si direccion="D"
						wbombposx=charposx+1
						wbombposy=charposy+2
					FinSi
					si fondo[wbombposy,wbombposx]=espacio y cantbomb>0 // puede colocar
                        bomb=4
						bombposx=wbombposx
						bombposy=wbombposy
						tiempo=4
						cantbomb=cantbomb-1
					FinSi
				sino 
   					explotar="si"
				FinSi
			FinSi
			si explotar="si" o (tiempo=0 y bomb=4) // explota
				tiempo=0
				explotar="no"
				bomb=0
				// barre el area de la explosion en el fondo
				para k=bombposy-1 hasta bombposy+1
					para j=bombposx-1 hasta bombposx+1
						si fondo[k,j]="X" // si hacemos explotar una X perdemos
							perder="si"
						FinSi
						si j>=charposx Y j<=charposx+2 Y k>=charposy y k<=charposy+1
                            perder="si" // la ligo el personaje							
						FinSi
						fondo[k,j]="*"
					FinPara
				FinPara	
			FinSi
		FinSi
	FinMientras
	escribir mensaje
	Esperar 1540 Milisegundos
	Limpiar Pantalla
	escribir ""
	escribir "    \|/           (__)"    
	escribir "          `\------(oo)"
	escribir "            |     (__)"
	escribir "            |w--|     \|/"
	escribir "   \|/"
	escribir ""
	escribir "   Ascii art is not a crime"
	escribir ""
	Esperar 1040 Milisegundos
FinAlgoritmo
