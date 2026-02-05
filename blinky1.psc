Algoritmo blinky1
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
	Limpiar Pantalla
	escribir "Presiona una tecla para comenza"
	esperar tecla
	mientras seguir="si"
		// primero carga el fondo
		para k=1 hasta 10
			para j=1 hasta 30
				toshow[k,j]=Subcadena(wfondo[k],j,j]
			FinPara
		FinPara	
		toshow[pacy,pacx]="@" // coloca a pacman
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
	FinMientras
FinAlgoritmo
