#include <sys/syscall.h>
#include <mips/regdef.h>

#define MYMALLOC_SIGNATURE 0xdeadbeef

#ifndef PROT_READ
#define PROT_READ 0x01
#endif

#ifndef PROT_WRITE
#define PROT_WRITE 0x02
#endif

#ifndef MAP_PRIVATE
#define MAP_PRIVATE 0x02
#endif

#ifndef MAP_ANON
#define MAP_ANON 0x1000
#endif

	.text
	.align	2
	.globl	mymalloc
	.ent	mymalloc
mymalloc:
	subu	sp, sp, 56
	sw	ra, 48(sp)
	sw	$fp, 44(sp)
	sw	a0, 40(sp)  # Temporary: original allocation size.
	sw	a0, 36(sp)  # Temporary: actual allocation size.
	li	t0, -1
	sw	t0, 32(sp)  # Temporary: return value (defaults to -1).
#if 0
	sw	a0, 28(sp)  # Argument building area (#8?).
	sw	a0, 24(sp)  # Argument building area (#7?).
	sw	a0, 20(sp)  # Argument building area (#6).
	sw	a0, 16(sp)  # Argument building area (#5).
	sw	a0, 12(sp)  # Argument building area (#4, a3).
	sw	a0,  8(sp)  # Argument building area (#3, a2).
	sw	a0,  4(sp)  # Argument building area (#2, a1).
	sw	a0,  0(sp)  # Argument building area (#1, a0).
#endif
	move	$fp, sp

	lw	t0, 40(sp)
	addiu	t0, t0, 3
	and	t0, t0, 0xfffffffc
	sw	t0, 40(sp)

	
	lw	t0, 40(sp)
	addiu	t0, t0, 12
	sw	t0, 36(sp)

	li	v0, SYS_mmap
	li	a0, 0
	lw	a1, 36(sp)
	li	a2, PROT_READ|PROT_WRITE
	li	a3, MAP_PRIVATE|MAP_ANON

	li	t0, -1
	sw	t0, 16(sp)

	li	t0, 0
	sw	t0, 20(sp)

	sw	zero, 24(sp)
	sw	zero, 28(sp)

	syscall
	sw	v0, 32(sp)
	beqz	v0, mymalloc_return

	lw	t0, 32(sp)
	li	t1, MYMALLOC_SIGNATURE
	sw	t1, 0(t0)

	lw	t0, 32(sp)
	lw	t1, 36(sp)
	sw	t1,  4(t0)

	lw	t0, 36(sp) # t0: actual allocation size.
	lw	t1, 32(sp) # t1: Pointer.
	addu	t1, t1, t0 # t1 now points to the trailing 4-byte area.
	xor	t2, t0, MYMALLOC_SIGNATURE
	sw	t2, -4(t1)

	lw	t0, 32(sp)
	addiu	t0, t0, 8
	sw	t0, 32(sp)

mymalloc_return:

	lw	v0, 32(sp)

	move	sp, $fp
	lw	ra, 48(sp)
	lw	$fp, 44(sp)
	addu	sp, sp, 56

	j	ra
	.end	mymalloc

	.globl	myfree
	.ent	myfree
myfree:
	subu	sp, sp, 40
	sw	ra, 32(sp)
	sw	$fp, 28(sp)
	sw	a0, 24(sp)  # Temporary: argument pointer.
	sw	a0, 20(sp)  # Temporary: actual mmap(2) pointer.
	move	$fp, sp

	lw	t0, 24(sp)
	subu	t0, t0, 8
	sw	t0, 20(sp)

	lw	t0, 20(sp) # t0: actual mmap(2) pointer.
	lw	t1, 0(t0)
	bne	t1, MYMALLOC_SIGNATURE, myfree_die

	lw	t0, 20(sp) # t0: actual mmap(2) pointer.
	lw	t1, 4(t0)  # t1: actual mmap(2) block size.
	addu	t2, t0, t1 # t2: trailer pointer.
	lw	t3, -4(t2)
	xor	t3, t3, t1
	bne	t3, MYMALLOC_SIGNATURE, myfree_die

	li	v0, SYS_munmap
	lw	a0, 20(sp) # a0: actual mmap(2) pointer.
	lw	a1, 4(a0)  # a1: actual allocation size.
	syscall

	bnez	v0, myfree_die

	j myfree_return

myfree_die:

	sw t0, 0(zero)

myfree_return:

	move	sp, $fp
	lw	ra, 32(sp)
	lw	$fp, 28(sp)
	addu	sp, sp, 40

	j	ra
	.end	myfree
