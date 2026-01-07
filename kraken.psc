Algoritmo kraken
	//
	// mini juegos pseint es un proyecto educativo de uso libre
	// funciona sobre una version con pequeñas modificaciones de pseint
	// que permite capturas de teclas en tiempo real
	// el repositorio para bajar la version es
	// https://github.com/pgualda/pseintkalfvragkvl/releases/tag/pseudocodigo
	// autor de la compilacion y de este codigo: daniel gualda
	// neuquen capital - argentina
	// 
	// definicion de variables
	Dimensionar toshow[10,30] // solo lo que sera mostrado
	Dimensionar fondo[10] // todo el fondo
	fondo[1]="////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////"
	fondo[2]="-\ >>> >  >                                              <####>               <####>                           < < /---         "
	fondo[3]=">-\ > > >> >                    <>>                 >                                    <####>>>            < <<</--- .-    -. "
	fondo[4]=">->\ <<<                         <##>               <#               <###>                   <#<#<##>         >>>/--- (  _  _  )"  
	fondo[5]="->                    <##>       <#>                                 <###>    <###>>                           <<\---  |      | "
	fondo[6]="--                      <###>               <<#>           <#>>                             <####>             < /---   \    /  "
	fondo[7]=">->-\ >> >>>                           <###>         <<#>              <####>#>           <#####>            << <\---    )  (   "
	fondo[8]="->--/ > >>                              <####>>>                            <#>#>                            < <<<\--   /____\  "
	fondo[9]=">--/ <<<                                                                                                     << << \--  ------  "
	fondo[10]="\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
    // pantalla - solo lo que se muestra	
	// asset1="[]]   [[]   []]   [[]  -=-   -_-" // para que pueda verse como queda
	// asset2="[[]   []]   -=-   -_-  []]   [[]"
	Dimensionar s[6,2]
	s[1,1]="[]][[]"
    s[1,2]="[[][]]"
	s[2,1]="[]]-=-"
    s[2,2]="[[]-_-"
	s[3,1]="-=-[]]"
    s[3,2]="-_-[[]"
	posx=3
	posy=5
	pospant=0
	seguir="si"
	redibuja="si"
	pose=1
	subpose=1
    // presentacion
	Limpiar Pantalla
	escribir ""  
	escribir ""  
    escribir "          Kraken - minijuegos pseint"	
	escribir "   usa los cursores para mover la criatura"
	escribir "             hacia la otra orilla"
	escribir ""  
	escribir "         Cualquier tecla para continuar"
    esperar tecla	
	// game loop
	mientras seguir="si"
		si redibuja="si"
			redibuja="no" 
			// primero carga el fondo
			para k=1 hasta 10
				para j=1 hasta 30
					toshow[k,j]=Subcadena(fondo[k],pospant+j,pospant+j]
				FinPara
			FinPara	
			// luego mapea el personaje en la posicion actual
			s1=subcadena(s[pose,subpose],1,3)
			s2=Subcadena(s[pose,subpose],4,6)
    		para j=1 hasta 3
				toshow[posy,posx+j-1]=Subcadena(s1,j,j)
				toshow[posy+1,posx+j-1]=Subcadena(s2,j,j)
			FinPara	
            // muestra pantalla			
    		Limpiar Pantalla
    		para yy=1 hasta 10
	    		cadena=""
     			para x=1 hasta 30
				    cadena=cadena+toshow[yy,x]
     			FinPara
	    		escribir cadena
    		FinPara
			si pospant>105
				seguir="no"
				escribir "Llegaste!!!"
			FinSi
		FinSi
        esperar 10 segundos 		
		tecla=ultimatecla(1)
	    esperar 180 Milisegundos // espera forzada para lograr fluidez, como no es multiplo de 50, espera pura
    	si tecla<>0 // solo si se presiono algo
    		// lo que vamos a hacer es movernos virtualmente en la direccion solicitada
    		// si el movimiento es un conjunto de casillas libres lo hace
		    wposx=posx
    		wposy=posy
		    si tecla=37
				wpose=1
    			wposx=posx-1
     		FinSi
		    si tecla=38
				wpose=3
    			wposy=posy-1
     		FinSi
    		si tecla=39
				wpose=1
    			wposx=posx+1
    		FinSi
    		si tecla=40
				wpose=2
    			wposy=posy+1
    		FinSi
			tres="   " // sino compara contra una variable la comparacion es erronea, bug de pseint
     		si subcadena(fondo[wposy],pospant+wposx,pospant+wposx+2)=tres Y subcadena(fondo[wposy+1],pospant+wposx,pospant+wposx+2)=tres
     			pospant=pospant+(wposx-posx)
     			posy=wposy
			finsi	
			pose=wpose
			redibuja="si"
   			subpose=subpose+1
			si subpose>2
 				subpose=1
			FinSi
	    finsi
	FinMientras
FinAlgoritmo
