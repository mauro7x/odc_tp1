	.file	1 "tp1.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"ERROR: al reservar memoria para la creacion de la matriz"
	.ascii	".\n\000"
	.align	2
$LC1:
	.ascii	"ERROR: al reservar memoria para los datos de la matriz.\n"
	.ascii	"\000"
	.text
	.align	2
	.globl	create_matrix
	.ent	create_matrix
create_matrix:
	.frame	$fp,48,$31		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,44($sp)
	sw	$fp,40($sp)
	sw	$28,36($sp)
	sw	$16,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$5,52($fp)
	li	$4,12			# 0xc
	la	$25,malloc
	jal	$31,$25
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L18
	la	$4,__sF+176
	la	$5,$LC0
	la	$25,fprintf
	jal	$31,$25
	sw	$0,28($fp)
	b	$L17
$L18:
	lw	$16,24($fp)
	lw	$3,48($fp)
	lw	$2,52($fp)
	mult	$3,$2
	mflo	$2
	sll	$2,$2,3
	move	$4,$2
	la	$25,malloc
	jal	$31,$25
	sw	$2,8($16)
	lw	$2,24($fp)
	lw	$2,8($2)
	bne	$2,$0,$L20
	lw	$4,24($fp)
	la	$25,free
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC1
	la	$25,fprintf
	jal	$31,$25
	sw	$0,28($fp)
	b	$L17
$L20:
	lw	$3,24($fp)
	lw	$2,48($fp)
	sw	$2,0($3)
	lw	$3,24($fp)
	lw	$2,52($fp)
	sw	$2,4($3)
	lw	$2,24($fp)
	sw	$2,28($fp)
$L17:
	lw	$2,28($fp)
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	lw	$16,32($sp)
	addu	$sp,$sp,48
	j	$31
	.end	create_matrix
	.size	create_matrix, .-create_matrix
	.align	2
	.globl	destroy_matrix
	.ent	destroy_matrix
destroy_matrix:
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$31,32($sp)
	sw	$fp,28($sp)
	sw	$28,24($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	lw	$2,40($fp)
	beq	$2,$0,$L22
	lw	$2,40($fp)
	lw	$2,8($2)
	beq	$2,$0,$L24
	lw	$2,40($fp)
	lw	$4,8($2)
	la	$25,free
	jal	$31,$25
$L24:
	lw	$4,40($fp)
	la	$25,free
	jal	$31,$25
	sw	$0,40($fp)
$L22:
	move	$sp,$fp
	lw	$31,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$31
	.end	destroy_matrix
	.size	destroy_matrix, .-destroy_matrix
	.rdata
	.align	2
$LC2:
	.ascii	"%ld\000"
	.align	2
$LC3:
	.ascii	" %lg\000"
	.align	2
$LC4:
	.ascii	"\n\000"
	.text
	.align	2
	.globl	print_matrix
	.ent	print_matrix
print_matrix:
	.frame	$fp,56,$31		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$31,48($sp)
	sw	$fp,44($sp)
	sw	$28,40($sp)
	move	$fp,$sp
	sw	$4,56($fp)
	sw	$5,60($fp)
	lw	$2,60($fp)
	lw	$4,56($fp)
	la	$5,$LC2
	lw	$6,0($2)
	la	$25,fprintf
	jal	$31,$25
	lw	$2,60($fp)
	lw	$3,60($fp)
	lw	$4,0($2)
	lw	$2,0($3)
	mult	$4,$2
	mflo	$2
	sw	$2,24($fp)
	sw	$0,28($fp)
$L26:
	lw	$2,28($fp)
	lw	$3,24($fp)
	sltu	$2,$2,$3
	bne	$2,$0,$L29
	b	$L27
$L29:
	lw	$4,60($fp)
	lw	$2,28($fp)
	sll	$3,$2,3
	lw	$2,8($4)
	addu	$2,$3,$2
	l.d	$f0,0($2)
	s.d	$f0,32($fp)
	lw	$4,56($fp)
	la	$5,$LC3
	lw	$6,32($fp)
	lw	$7,36($fp)
	la	$25,fprintf
	jal	$31,$25
	lw	$2,28($fp)
	addu	$2,$2,1
	sw	$2,28($fp)
	b	$L26
$L27:
	lw	$4,56($fp)
	la	$5,$LC4
	la	$25,fprintf
	jal	$31,$25
	move	$2,$0
	move	$sp,$fp
	lw	$31,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$31
	.end	print_matrix
	.size	print_matrix, .-print_matrix
	.rdata
	.align	2
$LC5:
	.ascii	"ERROR: Datos de entrada err\303\263neos.\n\000"
	.align	2
$LC6:
	.ascii	"%d\000"
	.text
	.align	2
	.globl	obtener_dimension
	.ent	obtener_dimension
obtener_dimension:
	.frame	$fp,160,$31		# vars= 120, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,160
	.cprestore 16
	sw	$31,152($sp)
	sw	$fp,148($sp)
	sw	$28,144($sp)
	move	$fp,$sp
	addu	$4,$fp,24
	move	$5,$0
	li	$6,100			# 0x64
	la	$25,memset
	jal	$31,$25
	sw	$0,128($fp)
	sb	$0,132($fp)
	sw	$0,136($fp)
$L31:
	la	$4,__sF
	la	$25,fgetc
	jal	$31,$25
	sb	$2,132($fp)
	lw	$2,136($fp)
	bne	$2,$0,$L35
	lw	$2,136($fp)
	bne	$2,$0,$L33
	lb	$3,132($fp)
	li	$2,10			# 0xa
	beq	$3,$2,$L33
	lb	$3,132($fp)
	li	$2,32			# 0x20
	beq	$3,$2,$L33
	lb	$3,132($fp)
	li	$2,9			# 0x9
	bne	$3,$2,$L35
	b	$L33
$L35:
	lw	$3,136($fp)
	addu	$2,$fp,24
	addu	$3,$2,$3
	lbu	$2,132($fp)
	sb	$2,0($3)
	lw	$2,136($fp)
	addu	$2,$2,1
	sw	$2,136($fp)
$L33:
	lhu	$2,__sF+12
	srl	$2,$2,5
	andi	$2,$2,0x1
	bne	$2,$0,$L32
	lw	$2,136($fp)
	slt	$2,$2,100
	beq	$2,$0,$L32
	lb	$3,132($fp)
	li	$2,10			# 0xa
	beq	$3,$2,$L32
	lw	$2,136($fp)
	beq	$2,$0,$L31
	lb	$3,132($fp)
	li	$2,32			# 0x20
	beq	$3,$2,$L32
	lb	$3,132($fp)
	li	$2,9			# 0x9
	bne	$3,$2,$L31
$L32:
	lw	$2,136($fp)
	slt	$2,$2,100
	bne	$2,$0,$L38
	la	$4,__sF+176
	la	$5,$LC5
	la	$25,fprintf
	jal	$31,$25
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,140($fp)
	b	$L30
$L38:
	addu	$2,$fp,128
	addu	$4,$fp,24
	la	$5,$LC6
	move	$6,$2
	la	$25,sscanf
	jal	$31,$25
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L39
	lw	$2,128($fp)
	sw	$2,140($fp)
	b	$L30
$L39:
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,140($fp)
$L30:
	lw	$2,140($fp)
	move	$sp,$fp
	lw	$31,152($sp)
	lw	$fp,148($sp)
	addu	$sp,$sp,160
	j	$31
	.end	obtener_dimension
	.size	obtener_dimension, .-obtener_dimension
	.rdata
	.align	2
$LC7:
	.ascii	"%lg\000"
	.align	2
$LC8:
	.ascii	"ERROR: Demasiados datos de entrada o hay datos de entrad"
	.ascii	"a inv\303\241lidos.\n\000"
	.align	2
$LC9:
	.ascii	"ERROR: Faltan datos de entrada o hay datos de entrada in"
	.ascii	"v\303\241lidos.\n\000"
	.text
	.align	2
	.globl	fill_matrix
	.ent	fill_matrix
fill_matrix:
	.frame	$fp,184,$31		# vars= 144, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,184
	.cprestore 16
	sw	$31,176($sp)
	sw	$fp,172($sp)
	sw	$28,168($sp)
	move	$fp,$sp
	sw	$4,184($fp)
	sw	$5,188($fp)
	addu	$4,$fp,24
	move	$5,$0
	li	$6,100			# 0x64
	la	$25,memset
	jal	$31,$25
	sw	$0,128($fp)
	sw	$0,132($fp)
	sb	$0,136($fp)
	sw	$0,140($fp)
	sw	$0,144($fp)
	lw	$2,184($fp)
	lw	$3,184($fp)
	lw	$4,0($2)
	lw	$2,0($3)
	mult	$4,$2
	mflo	$2
	sll	$2,$2,1
	sw	$2,148($fp)
	li	$2,1			# 0x1
	sw	$2,152($fp)
$L42:
	lw	$2,152($fp)
	sltu	$2,$2,3
	bne	$2,$0,$L45
	b	$L72
$L45:
	sw	$0,156($fp)
$L46:
	lw	$2,184($fp)
	lw	$3,156($fp)
	lw	$2,0($2)
	sltu	$2,$3,$2
	bne	$2,$0,$L49
	b	$L44
$L49:
	sw	$0,160($fp)
$L50:
	lw	$2,184($fp)
	lw	$3,160($fp)
	lw	$2,4($2)
	sltu	$2,$3,$2
	bne	$2,$0,$L54
	b	$L48
$L54:
	la	$4,__sF
	la	$25,fgetc
	jal	$31,$25
	sb	$2,136($fp)
	lw	$2,140($fp)
	bne	$2,$0,$L58
	lw	$2,140($fp)
	bne	$2,$0,$L56
	lb	$3,136($fp)
	li	$2,10			# 0xa
	beq	$3,$2,$L56
	lb	$3,136($fp)
	li	$2,32			# 0x20
	beq	$3,$2,$L56
	lb	$3,136($fp)
	li	$2,9			# 0x9
	bne	$3,$2,$L58
	b	$L56
$L58:
	lw	$3,140($fp)
	addu	$2,$fp,24
	addu	$3,$2,$3
	lbu	$2,136($fp)
	sb	$2,0($3)
	lw	$2,140($fp)
	addu	$2,$2,1
	sw	$2,140($fp)
$L56:
	lhu	$2,__sF+12
	srl	$2,$2,5
	andi	$2,$2,0x1
	bne	$2,$0,$L55
	lw	$2,140($fp)
	sltu	$2,$2,100
	beq	$2,$0,$L55
	lb	$3,136($fp)
	li	$2,10			# 0xa
	beq	$3,$2,$L55
	lw	$2,140($fp)
	beq	$2,$0,$L54
	lb	$3,136($fp)
	li	$2,32			# 0x20
	beq	$3,$2,$L55
	lb	$3,136($fp)
	li	$2,9			# 0x9
	bne	$3,$2,$L54
$L55:
	lw	$2,140($fp)
	sltu	$2,$2,100
	bne	$2,$0,$L61
	la	$4,__sF+176
	la	$5,$LC5
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,164($fp)
	b	$L41
$L61:
	addu	$2,$fp,128
	addu	$4,$fp,24
	la	$5,$LC7
	move	$6,$2
	la	$25,sscanf
	jal	$31,$25
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L62
	lw	$2,144($fp)
	addu	$2,$2,1
	sw	$2,144($fp)
	lw	$3,144($fp)
	lw	$2,148($fp)
	sltu	$2,$2,$3
	bne	$2,$0,$L63
	lw	$3,152($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L64
	lw	$4,184($fp)
	lw	$2,184($fp)
	lw	$3,156($fp)
	lw	$2,4($2)
	mult	$3,$2
	mflo	$3
	lw	$2,160($fp)
	addu	$2,$3,$2
	sll	$3,$2,3
	lw	$2,8($4)
	addu	$2,$3,$2
	l.d	$f0,128($fp)
	s.d	$f0,0($2)
	b	$L62
$L64:
	lw	$4,188($fp)
	lw	$2,184($fp)
	lw	$3,156($fp)
	lw	$2,4($2)
	mult	$3,$2
	mflo	$3
	lw	$2,160($fp)
	addu	$2,$3,$2
	sll	$3,$2,3
	lw	$2,8($4)
	addu	$2,$3,$2
	l.d	$f0,128($fp)
	s.d	$f0,0($2)
	b	$L62
$L63:
	la	$4,__sF+176
	la	$5,$LC8
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,164($fp)
	b	$L41
$L62:
	lw	$2,140($fp)
	sltu	$2,$2,100
	bne	$2,$0,$L67
	li	$2,1			# 0x1
	sw	$2,164($fp)
	b	$L41
$L67:
	lb	$3,136($fp)
	li	$2,10			# 0xa
	beq	$3,$2,$L69
	lhu	$2,__sF+12
	srl	$2,$2,5
	andi	$2,$2,0x1
	bne	$2,$0,$L69
	b	$L68
$L69:
	lw	$2,144($fp)
	lw	$3,148($fp)
	sltu	$2,$2,$3
	beq	$2,$0,$L70
	la	$4,__sF+176
	la	$5,$LC9
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,164($fp)
	b	$L41
$L70:
	sw	$0,164($fp)
	b	$L41
$L68:
	addu	$4,$fp,24
	move	$5,$0
	lw	$6,140($fp)
	la	$25,memset
	jal	$31,$25
	sw	$0,140($fp)
	sb	$0,136($fp)
	lw	$2,160($fp)
	addu	$2,$2,1
	sw	$2,160($fp)
	b	$L50
$L48:
	lw	$2,156($fp)
	addu	$2,$2,1
	sw	$2,156($fp)
	b	$L46
$L44:
	lw	$2,152($fp)
	addu	$2,$2,1
	sw	$2,152($fp)
	b	$L42
$L72:
	la	$4,__sF
	la	$25,fgetc
	jal	$31,$25
	sb	$2,136($fp)
	lhu	$2,__sF+12
	srl	$2,$2,5
	andi	$2,$2,0x1
	bne	$2,$0,$L73
	lb	$3,136($fp)
	li	$2,32			# 0x20
	beq	$3,$2,$L72
	lb	$3,136($fp)
	li	$2,9			# 0x9
	beq	$3,$2,$L72
$L73:
	lb	$3,136($fp)
	li	$2,10			# 0xa
	beq	$3,$2,$L78
	lhu	$2,__sF+12
	srl	$2,$2,5
	andi	$2,$2,0x1
	bne	$2,$0,$L78
	b	$L77
$L78:
	sw	$0,164($fp)
	b	$L41
$L77:
	la	$4,__sF+176
	la	$5,$LC8
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,164($fp)
$L41:
	lw	$2,164($fp)
	move	$sp,$fp
	lw	$31,176($sp)
	lw	$fp,172($sp)
	addu	$sp,$sp,184
	j	$31
	.end	fill_matrix
	.size	fill_matrix, .-fill_matrix
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
