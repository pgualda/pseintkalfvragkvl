Algoritmo blinky2
	Dimensionar wfondo[10],toshow[10,30],dires[4,2]
	wfondo[1] ="##############################"
	wfondo[2] ="#                            #"
	wfondo[3] ="# #### ######## ########## # #"
	wfondo[4] ="# #       ##      ##       # #"
	wfondo[5] ="#   ##### ## #### ## ####### #"
	wfondo[6] ="# # #####    ####          # #"
	wfondo[7] ="# #      ######### ####### # #"
	wfondo[8] ="# ###### ######### ####### # #"
	wfondo[9] ="#                            #"
	wfondo[10]="##############################"
	seguir="si" // gameloop var
	dires[1,1]=0 // izquierda y = 0, x= -1
	dires[1,2]=-1
	dires[2,1]=-1 // arriba y = 0, x= -1
	dires[2,2]=0
	dires[3,1]=0 // derecha y = 0, x= -1
	dires[3,2]=1
	dires[4,1]=1 // abajo y = 0, x= -1
	dires[4,2]=0
	pacx=2 // cord y dire pacman
	pacy=2
	pacdire=3
	blix=15 // cord y dire blinky
	bliy=9
	blidire=3
	Limpiar Pantalla
	escribir "Presiona una tecla para comenza"
	esperar 3000 Milisegundos
	mientras seguir="si"
		// primero carga el fondo
		para k=1 hasta 10
			para j=1 hasta 30
				toshow[k,j]=Subcadena(wfondo[k],j,j]
			FinPara
		FinPara	
		toshow[pacy,pacx]="@" // coloca a pacman
		toshow[bliy,blix]="%" // coloca a blinky
		Limpiar Pantalla
		para yy=1 hasta 10
			char=""
			para x=1 hasta 30
				char=char+toshow[yy,x]
			FinPara
			escribir char
		FinPara
		escribir "Score:",score
        esperar 200 Milisegundos
		tecla=ultimatecla(1)
		si tecla=37 o tecla=38 o tecla=39 o tecla=40
           	pacdire=tecla-36			
			esperar 180 Milisegundos
		finsi
		charfondo=toshow[pacy+dires[pacdire,1],pacx+dires[pacdire,2]]
		si charfondo=" " // o charfondo="." o charfondo="&"
			pacy=pacy+dires[pacdire,1]
			pacx=pacx+dires[pacdire,2]
		FinSi
		// determinar la direccion de blinky
		hipomenor=100
		diremenor=1
		para j=1 hasta 4
			charfondo=toshow[bliy+dires[j,1],blix+dires[j,2]]
			direqueno=blidire+2
			si direqueno>4
				direqueno=direqueno-4
			FinSi
			si charfondo<>" " o j=direqueno // si hay muro o no puede ir
				distancia=200
			sino
				disty=bliy+dires[j,1]-pacy // mide la distancia
				distx=blix+dires[j,2]-pacx
				distancia=raiz((disty*disty)+(distx*distx))				
			finsi
			si distancia<hipomenor
				hipomenor=distancia
				diremenor=j
			FinSi
		FinPara
		bliy=bliy+dires[diremenor,1]
		blix=blix+dires[diremenor,2]
		blidire=diremenor
		si bliy=pacy y blix=pacx // si coinciden las 
			seguir="no"
		FinSi
	FinMientras
	escribir "te agarro!"
FinAlgoritmo

