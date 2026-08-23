Algoritmo ternaspitagoricas
	escribir "Nros para el generador de ternas"
	leer m,n
	si m>n
		a=(m*m)-(n*n)
		b=2*m*n
		c=(m*m)+(n*n)
		escribir "a:",a, " b:",b, " c:",c
	SiNo
		a=1
		b=1
		c=1
		escribir "datos no validos"
	finsi
	//escribir "Ingrese 3 valores para verificar si son una terna pitagorica"
	//leer a,b,c
    si a>b y a>c
		h=a
		c1=b
		c2=c
	SiNo
		si b>c
			h=b
			c1=a
			c2=c
		SiNo
			h=c
			c1=b
			c2=a
		FinSi
	FinSi
    si (h*h) = (c1*c1)+(c2*c2)
		escribir "Es una terna pitagorica"
	sino 
		escribir "No es una terna pitagorica"
	FinSi
FinAlgoritmo
