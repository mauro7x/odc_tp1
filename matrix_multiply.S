#include <mips/regdef.h>

	.text
	.ent	matrix_multiply
	.globl	matrix_multiply
	.align	2

matrix_multiply:

	.frame	$fp,40,ra			# Definimos el Stack Frame de 40
	subu	sp,sp,40
	.cprestore 24
	sw	ra,32(sp)
	sw	$fp,28(sp)
	move	$fp,sp				# Definido ya el stack frame, se escribe la funcion:

	sw	a0,40($fp)				# Se guarda los argumentos en el ABA de la Caller
	sw	a1,44($fp)


	li a0,12 					# 12 es el tamanio necesario para almacenar el puntero al struct.
	la t9,mymalloc  			# Llamo a mymalloc
	jal ra, t9
	beq v0, zero, return_null 	# Devuelvo null si es 0
	sw v0, 16($fp) 				# Guardo el puntero a m3 en LTA
	lw s0, 16($fp)
	
	lw s1, 40($fp) 				# puntero a m1 en s1
	lw s1, 0(s1) 				# cargo el numero de filas

	sw s1, 0(s0) 				# Almaceno el valor de las filas
	sw s1, 4(s0)				# Almaceno el valor de las columnas

	mult	s1,s1 				# Hago el producto para ver cuantas celdas necesito reservar
	mflo	s1					# Guardo el resultado en a0 para pasarlo por parametro a malloc
	sll 	a0,s1,3
	la t9,mymalloc  			# Llamo a mymalloc
	jal ra,t9
	beq v0, zero, return 		# Devuelvo null si es 0
	lw s0, 16($fp)
	sw v0, 8(s0) 				# Guardo el puntero al array en la posicion en memoria destinada al array de mi matriz

	move 	t7, s0 				# Puntero a la matriz en t7

	lw	a0,40($fp)				# Cargo de vuelta los punteros a m1 y m2
	lw	a1,44($fp)
	lw	t3,4(a0)				# Cargo m1->cols en t3.

	li	t0,0					# Inicializo el indice i en 0 en t0.
					
primer_for:
	sltu	t4,t0,t3 			# En t4 esta el resultado de la comparacion.
	beq t4,zero,return 			# Condicion de corte del for exterior.
	li 	t1,0					# Inicializo el indice j en 0 en t1.

segundo_for:
	sltu	t4,t1,t3
	beq t4,zero,salir_segundo_for 	# Condicion de corte del for del medio.

	sw zero,16($fp)
	sw zero,20($fp)

	l.d	$f0,16($fp)				#Cargo un double en 0 en f0 y f1.						
	
	li	t2,0					#Inicializo el indice k en 0 en t2.

tercer_for:

	sltu	t4,t2,t3
	beq t4,zero,salir_tercer_for 	# Condicion de corte del for interior.

	mult	t0,t3 				#Hago el producto i*n
	mflo	t4					#Guardo el resultado de la multiplicacion en t4
	addu	v0,t4,t2 			#Almaceno el resultado de i*n + k en v0. Esto es el offset para acceder al array de m1.

	mult 	t2,t3 				#Hago el producto k*n
	mflo 	t4					#guardo el resultado de la multiplicacion en t4
	addu	v1,t4,t1 			#Almaceno el resultado de k*n + j en v1. Esto es el offset para acceder al array de m2.

	sll v0,v0,3					#Multiplico los offsets por 8 porque son doubles
	sll v1,v1,3

	lw	t5,8(a0)				#Puntero base al array de m1 en t5
	lw 	t6,8(a1)				#Puntero base al array de m2 en t6

	addu	t5,t5,v0 			#Direcciones de memoria de los doubles que se deben multiplicar en t5 y t6
	addu	t6,t6,v1

	l.d	$f2,0(t5)				#m1->array[i * n + k] en f2
	l.d $f4,0(t6)				#m2->array[k * n + j] en f4

	mul.d $f2,$f2,$f4			#Multiplico los doubles y lo almaceno en f2
	add.d $f0,$f0,$f2			#sum += m2->array[k * n + j] * m2->array[k * n + j]

	addu	t2,t2,1
	b	tercer_for				#Ejecucion del loop (for interior).

salir_tercer_for:
	mult t0,t3 					#i*n
	mflo t4						#Resultado en t4 
	addu v0,t4,t1 				#i*n + j en v0. Offset para guardar la suma parcial calculada en el for

	sll v0,v0,3					#Multiplico el offset por 8 en v0.
	lw t5,8(t7)					#Direccion base al arreglo de la matriz m.

	addu t5,t5,v0 				#Calculo la direccion de memoria donde debo guardar sum en t5.

	s.d	$f0,0(t5)				#Guardo la suma en esta posicion.

	addu	t1,t1,1
	b	segundo_for 			#Ejecucion del loop (for del medio).

salir_segundo_for:
	addu	t0,t0,1
	b	primer_for				#Ejecucion del loop (for exterior).

return_null:
	move t7, zero

return:							# Finaliza la ejecucion
	move	v0,t7 				# Copio el puntero a m a v0. (O el puntero a null, en caso de que no se haya podido reservar memoria).
	move	sp,$fp
	lw	ra,32(sp)
	lw	$fp,28(sp)
	addu	sp,sp,40
	jr	ra
	.end	matrix_multiply
