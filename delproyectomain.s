 .text
 .align 2
 .global main
main:
	bl GetGpioAddress @solo se llama una vez
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
@	mov r0,#23
@	mov r1,#0
@	bl SetGpioFunction
	
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
@BOCINA
	mov r0,#21
	mov r1,#0
	bl SetGpio

	mov r10,#0	
@bl apagar
	
revisar:
	
	
	mov r0,#17
	bl GetGpio
	mov r1,r0
	cmp r1,#0 
	addne r10,#1
	bl wait	
	
	mov r0,#18
	bl GetGpio
	cmp r0,#0
	subne r10,#1 
	bl wait
	
		
	mov r0,#27
	bl GetGpio
	cmp r0,#0
	ldrne r0,=favorito1
	ldrne r0,[r0]
	movne r10,r0
	bl wait
	
	mov r0,#22
	bl GetGpio
	cmp r0,#0
	ldrne r0,=favorito2
	ldrne r0,[r0]
	movne r10,r0
	bl wait
	
mov r0,r10
bl delay

	mov r0,#21
	mov r1,#1
	bl SetGpio
mov r0,r10
bl delay
	
	mov r0,#21
	mov r1,#0
	bl SetGpio
	
	cmp r10,#0
	addlt r10,#1
	
cmp r10,#0
bleq cero	
	
cmp r10,#1
bleq uno


cmp r10,#2
bleq dos

cmp r10,#3
bleq tres

cmp r10,#4
@bl apagar
bleq cuatro


cmp r10,#5
@bl apagar
bleq cinco


cmp r10,#6
@bl apagar
bleq seis


cmp r10,#7
@bl apagar
bleq siete

cmp r10,#8
@bl apagar
bleq ocho

cmp r10,#9
@bl apagar
bleq nueve

cmp r10,#10
@bl apagar
bleq diez

cmp r10,#11
@bl apagar
bleq once

cmp r10,#12
@bl apagar
bleq doce

cmp r10,#13
@bl apagar
bleq trece

cmp r10,#14
@bl apagar
bleq catorce

cmp r10,#15
@bl apagar
bleq quince
	
	cmp r10,#16
	moveq r10,#15

fin:
	b revisar
wait:
	mov r0, #0x4000000 @ big number
sleepLoop:
	subs r0,#1
	bne sleepLoop @ loop delay
	mov pc,lr

delay:
 mov r7,#0
	@tomamos nuestra base de 150000*2*ingresado entonces 300000 seria para que tarde 0.001 segundos. lo hice asi por conveniencia. luego se multiplica por lo ingresado para que tarde esa cantidad de milisegundos
	ldr r1,=delaynum
	ldr r1,[r1]
	mov r3,#2
	mul r0,r3
	mul r0,r1
    b compare
loop1:
    add r7,#1     //r7++
compare:
    cmp r7,r0     //test r7 == r0
    bne loop1

   mov pc,lr

   cero:
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
pop {pc}
   
   
   uno:
push {lr}
ldr r0,=msj1
bl puts
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
	mov r1,#0
	bl SetGpio
pop {pc}

dos:
push {lr}
ldr r0,=msj2
bl puts
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
ldr r0,=msj3
bl puts
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
ldr r0,=msj4
bl puts
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
ldr r0,=msj5
bl puts 
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
favorito1: .word 8 
favorito2: .word 12 
favorito3: .word 0 
mensaje: .asciz "hola"
msj1: .asciz "1"
msj2: .asciz "2"
msj3: .asciz "3"
msj4: .asciz"4"
msj5: .asciz"5"
delaynum:.word 1500000

 .end