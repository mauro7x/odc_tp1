	.file	1 "main.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"-h\000"
	.align	2
$LC1:
	.ascii	"--help\000"
	.align	2
$LC2:
	.ascii	"Usage:\n"
	.ascii	" \t tp0 -h \n"
	.ascii	" \t tp0 -V \n"
	.ascii	" \t tp0 < in_file > out_file \n"
	.ascii	"Options: \n"
	.ascii	" \t -V, --version \t Print version and quit.\n"
	.ascii	" \t -h, --help \t Print this information and quit. \n"
	.ascii	"Examples: \n"
	.ascii	" \t tp0 < in.txt > out.txt \n"
	.ascii	" \t cat in.txt | tp0 > out.txt\n\000"
	.align	2
$LC3:
	.ascii	"-V\000"
	.align	2
$LC4:
	.ascii	"--version\000"
	.align	2
$LC5:
	.ascii	"Version %.1f\n\000"
	.align	2
$LC7:
	.ascii	"ERROR: Invalid option.\n\000"
	.align	3
$LC6:
	.word	0
	.word	1072693248
	.text
	.align	2
	.globl	validar_argumentos
	.ent	validar_argumentos
validar_argumentos:
	.frame	$fp,48,$31		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,40($sp)
	sw	$fp,36($sp)
	sw	$28,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$5,52($fp)
	lw	$2,48($fp)
	sw	$2,28($fp)
	li	$2,1			# 0x1
	lw	$3,28($fp)
	beq	$3,$2,$L19
	li	$2,2			# 0x2
	lw	$3,28($fp)
	beq	$3,$2,$L20
	b	$L27
$L19:
	li	$2,2			# 0x2
	sw	$2,24($fp)
	b	$L17
$L20:
	lw	$2,52($fp)
	addu	$2,$2,4
	lw	$4,0($2)
	la	$5,$LC0
	li	$6,3			# 0x3
	la	$25,strncmp
	jal	$31,$25
	beq	$2,$0,$L22
	lw	$2,52($fp)
	addu	$2,$2,4
	lw	$4,0($2)
	la	$5,$LC1
	li	$6,7			# 0x7
	la	$25,strncmp
	jal	$31,$25
	bne	$2,$0,$L21
$L22:
	la	$4,__sF+88
	la	$5,$LC2
	la	$25,fprintf
	jal	$31,$25
	sw	$0,24($fp)
	b	$L17
$L21:
	lw	$2,52($fp)
	addu	$2,$2,4
	lw	$4,0($2)
	la	$5,$LC3
	li	$6,3			# 0x3
	la	$25,strncmp
	jal	$31,$25
	beq	$2,$0,$L25
	lw	$2,52($fp)
	addu	$2,$2,4
	lw	$4,0($2)
	la	$5,$LC4
	li	$6,10			# 0xa
	la	$25,strncmp
	jal	$31,$25
	bne	$2,$0,$L24
$L25:
	l.d	$f0,$LC6
	la	$4,__sF+88
	la	$5,$LC5
	mfc1	$6,$f0
	mfc1	$7,$f1
	la	$25,fprintf
	jal	$31,$25
	sw	$0,24($fp)
	b	$L17
$L24:
	la	$4,__sF+176
	la	$5,$LC7
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC2
	la	$25,fprintf
	jal	$31,$25
	li	$3,1			# 0x1
	sw	$3,24($fp)
	b	$L17
$L27:
	la	$4,__sF+176
	la	$5,$LC7
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC2
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,24($fp)
$L17:
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	validar_argumentos
	.size	validar_argumentos, .-validar_argumentos
	.rdata
	.align	2
$LC8:
	.ascii	"ERROR: Dimensi\303\263n de la matriz no v\303\241lida.\n"
	.ascii	"\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,72,$31		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$31,64($sp)
	sw	$fp,60($sp)
	sw	$28,56($sp)
	move	$fp,$sp
	sw	$4,72($fp)
	sw	$5,76($fp)
	lw	$4,72($fp)
	lw	$5,76($fp)
	la	$25,validar_argumentos
	jal	$31,$25
	sw	$2,24($fp)
	lw	$2,24($fp)
	sw	$2,48($fp)
	lw	$3,48($fp)
	beq	$3,$0,$L32
	li	$2,1			# 0x1
	lw	$3,48($fp)
	beq	$3,$2,$L31
	b	$L30
$L31:
	li	$2,1			# 0x1
	sw	$2,44($fp)
	b	$L29
$L32:
	sw	$0,44($fp)
	b	$L29
$L30:
	sw	$0,28($fp)
	sw	$0,32($fp)
	sw	$0,36($fp)
$L35:
	lhu	$2,__sF+12
	srl	$2,$2,5
	andi	$2,$2,0x1
	beq	$2,$0,$L37
	b	$L36
$L37:
	la	$25,obtener_dimension
	jal	$31,$25
	sw	$2,40($fp)
	lw	$2,40($fp)
	bgtz	$2,$L38
	la	$4,__sF+176
	la	$5,$LC8
	la	$25,fprintf
	jal	$31,$25
	li	$3,1			# 0x1
	sw	$3,44($fp)
	b	$L29
$L38:
	lw	$4,40($fp)
	lw	$5,40($fp)
	la	$25,create_matrix
	jal	$31,$25
	sw	$2,28($fp)
	lw	$4,40($fp)
	lw	$5,40($fp)
	la	$25,create_matrix
	jal	$31,$25
	sw	$2,32($fp)
	lw	$2,28($fp)
	beq	$2,$0,$L39
	lw	$2,32($fp)
	beq	$2,$0,$L39
	lw	$4,28($fp)
	lw	$5,32($fp)
	la	$25,fill_matrix
	jal	$31,$25
	bne	$2,$0,$L40
	lw	$4,28($fp)
	lw	$5,32($fp)
	la	$25,matrix_multiply
	jal	$31,$25
	sw	$2,36($fp)
	lw	$4,28($fp)
	la	$25,destroy_matrix
	jal	$31,$25
	lw	$4,32($fp)
	la	$25,destroy_matrix
	jal	$31,$25
	lw	$2,36($fp)
	beq	$2,$0,$L41
	la	$4,__sF+88
	lw	$5,36($fp)
	la	$25,print_matrix
	jal	$31,$25
	lw	$4,36($fp)
	la	$25,destroy_matrix
	jal	$31,$25
	b	$L35
$L41:
	li	$2,1			# 0x1
	sw	$2,44($fp)
	b	$L29
$L40:
	lw	$4,28($fp)
	la	$25,destroy_matrix
	jal	$31,$25
	lw	$4,32($fp)
	la	$25,destroy_matrix
	jal	$31,$25
	li	$3,1			# 0x1
	sw	$3,44($fp)
	b	$L29
$L39:
	lw	$4,28($fp)
	la	$25,destroy_matrix
	jal	$31,$25
	lw	$4,32($fp)
	la	$25,destroy_matrix
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,44($fp)
	b	$L29
$L36:
	sw	$0,44($fp)
$L29:
	lw	$2,44($fp)
	move	$sp,$fp
	lw	$31,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$31
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
