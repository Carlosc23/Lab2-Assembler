//1.Directivas
 .text
 .align 2
 .global main
main:
//2.Puntero a la memoria virtual 0x20200000 o 0x3F200000
	bl GetGpioAddress @solo se llama una vez
//3.Puertos 15,14,18 de salida
@GPIO para escritura puerto	19,16,26,20,21
@LED 1
	mov r0,#19
	mov r1,#1
	bl SetGpioFunction
@LED 2
	mov r0,#16
	mov r1,#1
	bl SetGpioFunction
@LED 3
	mov r0,#26
	mov r1,#1
	bl SetGpioFunction
@LED 4
	mov r0,#20
	mov r1,#1
	bl SetGpioFunction
@BOCINA
	mov r0,#21
	mov r1,#1
	bl SetGpioFunction
	
	
//4.Puerto 21 de entrada
@GPIO para lectura puerto 17,18,27,22,23
@SUBIR
	mov r0,#17
	mov r1,#0
	bl SetGpioFunction
@BAJAR
	mov r0,#18
	mov r1,#0
	bl SetGpioFunction
@FAV1
	mov r0,#27
	mov r1,#0
	bl SetGpioFunction
@FAV2
	mov r0,#22
	mov r1,#0
	bl SetGpioFunction
@FAV3
	mov r0,#23
	mov r1,#0
	bl SetGpioFunction
	
	
ciclo:
//5.r10= contador de boton presionado = 0 
	mov r10,#0	
//6.Apagar todos los leds
bl apagar
	
revisar:
//7.¿Puerto 17/18 de entrada estÃ¡ presionado? (GetGpio)
	mov r0,#17
	bl GetGpio
	cmp r0,#0 
//8. SI -> r10++
	addne r10,#1
	//ver si apacho el de menos
	mov r0,#18
	bl GetGpio
	cmp r0,#0
	subne r10,#1 
	
	//ver si apacho el fav 1
	mov r0,#27
	bl GetGpio
	cmp r0,#0
	ldr r1,=favorito1
	ldr r1,[r1]
	movne r10,r1
	
	//ver si apacho el fav 2
	mov r0,#22
	bl GetGpio
	cmp r0,#0
	ldr r1,=favorito2
	ldr r1,[r1]
	movne r10,r1	
	
	
	//ver si apacho el fav 3
	mov r0,#23
	bl GetGpio
	cmp r0,#0
	ldr r1,=favorito3
	ldr r1,[r1]
	movne r10,r1	
	
//9. si r10 = 1 encender puerto 18

//si r10=1
cmp r10,#1
bl apagar

bl uno
//si r10=2
cmp r10,#2
bl apagar

bl dos
//si r10=3
cmp r10,#3
bl apagar

bl tres
//si r10=4
cmp r10,#4
bl apagar

bl cuatro
//si r10=5
cmp r10,#5
bl apagar

bl cinco
//si r10=6
cmp r10,#6
bl apagar

bl seis
//si r10=7
cmp r10,#7
bl apagar

bl siete
//si r10=8
cmp r10,#8
bl apagar

bl ocho
//si r10=9
cmp r10,#9
bl apagar

bl nueve
//si r10=10
cmp r10,#10
bl apagar

bl diez
//si r10=11
cmp r10,#11

bl apagar
bl once
//si r10=12
cmp r10,#12
bl apagar
bl doce
//si r10=13
cmp r10,#13
bl apagar
bl trece
//si r10=14
cmp r10,#14
bl apagar
bl catorce
//si r10=15
cmp r10,#15
bl apagar
bl quince
	
	cmp r10,#16
	moveq r10,#15

	b revisar
apagar:
push {lr}
@LED 1
	mov r0,#19
	mov r1,#0
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#0
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#0
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#0
	bl SetGpio
pop{pc}

uno:
push {lr}
	@LED 1
	mov r0,#19
	mov r1,1
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#0
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#0
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#0
	bl SetGpio
pop {pc}

dos:
push {lr}
	@LED 1
	mov r0,#19
	mov r1,#0
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#1
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#0
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#0
	bl SetGpio
pop {pc}

tres:
push {lr}
	@LED 1
	mov r0,#19
	mov r1,#1
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#1
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#0
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#0
	bl SetGpio
pop {pc}

cuatro:
push {lr}
	@LED 1
	mov r0,#19
	mov r1,#0
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#0
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#1
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#0
	bl SetGpio
pop {pc}

cinco:
push {lr}
	@LED 1
	mov r0,#19
	mov r1,#1
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#0
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#1
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#0
	bl SetGpio
pop {pc}

seis:
push {lr}
	@LED 1
	mov r0,#19
	mov r1,#0
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#1
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#1
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#0
	bl SetGpio
pop {pc}

siete:
push {lr}
	@LED 1
	mov r0,#19
	mov r1,#1
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#1
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#1
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#0
	bl SetGpio
pop {pc}

ocho: 
push {lr}
	@LED 1
	mov r0,#19
	mov r1,#0
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#0
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#0
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#1
	bl SetGpio
pop {pc}
nueve:
push {lr}
	@LED 1
	mov r0,#19
	mov r1,#1
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#0
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#0
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#1
	bl SetGpio
pop {pc}

diez: 
push {lr}
	@LED 1
	mov r0,#19
	mov r1,#0
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#1
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#0
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#1
	bl SetGpio
pop {pc}

once:
push {lr}
	@LED 1
	mov r0,#19
	mov r1,#1
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#1
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#0
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#1
	bl SetGpio
pop {pc}

doce:
push {lr}
	@LED 1
	mov r0,#19
	mov r1,#0
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#0
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#1
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#1
	bl SetGpio
pop {pc}

trece:
push {lr}
	@LED 1
	mov r0,#19
	mov r1,#1
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#0
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#1
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#1
	bl SetGpio
pop {pc}

catorce:
push {lr}
	@LED 1
	mov r0,#19
	mov r1,#0
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#1
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#1
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#1
	bl SetGpio
pop {pc}

quince: 
push {lr}
	@LED 1
	mov r0,#19
	mov r1,#1
	bl SetGpio
@LED 2
	mov r0,#16
	mov r1,#1
	bl SetGpio
@LED 3
	mov r0,#26
	mov r1,#1
	bl SetGpio
@LED 4
	mov r0,#20
	mov r1,#1
	bl SetGpio
pop {pc}

.data
.align 2
.global myloc
myloc: .word 0
favorito1: .word 0 
favorito2: .word 0 
favorito3: .word 0 



 .end