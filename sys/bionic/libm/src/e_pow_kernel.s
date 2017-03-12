	.file	"e_pow_kernel.c"
	.section	.text.pow_kernel,"ax",%progbits
	.align	2
	.global	pow_kernel
	.type	pow_kernel, %function
pow_kernel:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	fmdrr	d16, r2, r3
	fstmfdd	sp!, {d8}
	.vsave {d8}
	fmdrr	d17, r0, r1
	bic	r4, r3, #-2147483648
	bic	ip, r1, #-2147483648
	bne	.L2
	cmp	r4, #0
	beq	.L60
	mov	r5, #0
	movt	r5, 32752
	cmp	ip, r5
	bgt	.L4
	beq	.L89
.L5:
	mov	r5, #0
	movt	r5, 32752
	cmp	r4, r5
	beq	.L90
	mov	r5, #0
	movt	r5, 16368
	cmp	r3, r5
	beq	.L78
	cmp	r3, #1073741824
	beq	.L91
	mov	r5, #0
	movt	r5, 16336
	cmp	r3, r5
	beq	.L92
	mov	r5, #0
	movt	r5, 16352
	cmp	r3, r5
	beq	.L93
	mov	r5, #0
	movt	r5, 49136
	cmp	r3, r5
	bne	.L2
	fconstd	d16, #112
	fdivd	d16, d16, d17
	b	.L3
.L2:
	movw	r5, #65534
	movt	r5, 32751
	sub	r6, r1, #1
	cmp	r6, r5
	bhi	.L94
.L16:
	mov	r5, #0
	movt	r5, 17392
	cmp	r4, r5
	bgt	.L17
	cmp	ip, #1048576
	bge	.L18
	fldd	d22, .L109
	fmuld	d17, d17, d22
	fmrrd	r2, r3, d17
	mov	r2, r3, asr #20
	sub	r0, r2, #1072
	mov	ip, r3
	sub	r1, r0, #4
.L19:
	movw	r3, #46713
	ubfx	ip, ip, #0, #20
	movt	r3, 11
	cmp	ip, r3
	orr	r4, ip, #1069547520
	orr	r0, r4, #3145728
	fmrrd	r2, r3, d17
	ble	.L20
	sub	r3, r0, #1048576
	add	r1, r1, #1
	fmdrr	d2, r2, r3
.L21:
	fconstd	d27, #112
	fldd	d4, .L109+8
	faddd	d21, d2, d27
	fsubd	d22, d2, d27
	fldd	d26, .L109+16
	fdivd	d1, d27, d21
	fmrrd	r2, r3, d21
	mov	r2, #0
	fldd	d25, .L109+24
	fmdrr	d23, r2, r3
	fldd	d0, .L109+32
	fldd	d24, .L109+40
	fsubd	d19, d23, d27
	fldd	d5, .L109+48
	fconstd	d6, #8
	fsubd	d7, d2, d19
	fmsr	s5, r1	@ int
	fldd	d31, .L109+56
	fldd	d29, .L109+64
	fsitod	d28, s5
	fldd	d30, .L109+72
	fmuld	d2, d22, d1
	fmuld	d20, d2, d2
	fmrrd	r0, r1, d2
	mov	r0, r2
	fmdrr	d18, r0, r1
	fmacd	d26, d20, d4
	fnmacd	d22, d18, d23
	fmuld	d3, d20, d20
	fmacd	d25, d26, d20
	fnmacd	d22, d18, d7
	fmuld	d27, d18, d18
	fmacd	d0, d25, d20
	fmuld	d22, d22, d1
	faddd	d4, d27, d6
	fmacd	d24, d0, d20
	fmuld	d17, d22, d2
	fmacd	d5, d24, d20
	fmacd	d17, d22, d18
	fmuld	d21, d3, d5
	faddd	d1, d17, d21
	faddd	d7, d4, d1
	fmsr	s14, r2	@ int
	fcpyd	d25, d7
	fsubd	d26, d25, d6
	fmuld	d0, d22, d25
	fsubd	d24, d26, d27
	fmuld	d23, d18, d25
	fsubd	d5, d1, d24
	fmacd	d0, d2, d5
	faddd	d7, d23, d0
	fmsr	s14, r2	@ int
	fcpyd	d6, d7
	fsubd	d19, d6, d23
	fmuld	d31, d6, d31
	fsubd	d7, d0, d19
	fmuld	d30, d6, d30
	fmacd	d31, d7, d29
	faddd	d29, d28, d30
	faddd	d2, d29, d31
	fmsr	s4, r2	@ int
	fsubd	d28, d2, d28
	fsubd	d20, d28, d30
	fsubd	d18, d31, d20
.L22:
	fmrrd	r2, r3, d16
	mov	r2, #0
	fmuld	d3, d16, d18
	fmdrr	d27, r2, r3
	mov	r4, #0
	movt	r4, 16352
	fsubd	d16, d16, d27
	fmuld	d4, d27, d2
	fmacd	d3, d16, d2
	faddd	d2, d3, d4
	fmrrd	r0, r1, d2
	bic	ip, r1, #-2147483648
	cmp	ip, r4
	ble	.L62
	movw	r2, #65535
	movt	r2, 16527
	cmp	ip, r2
	ble	.L24
	cmp	r1, r2
	ble	.L25
	add	r3, r1, #-1090519040
	add	r2, r3, #7340032
	orrs	r3, r2, r0
	bne	.L59
	fldd	d17, .L109+256
	fsubd	d1, d2, d4
	faddd	d25, d3, d17
	fcmped	d25, d1
	fmstat
	bgt	.L59
.L24:
	mov	r5, ip, asr #20
	sub	r4, r5, #1020
	sub	r0, r4, #2
	mov	ip, #1048576
	fmrrd	r4, r5, d21
	add	r3, r1, ip, asr r0
	ubfx	r2, r3, #20, #11
	sub	r5, r2, #1020
	movw	r0, #65535
	sub	ip, r5, #3
	movt	r0, 15
	cmp	r1, #0
	bic	r5, r3, r0, asr ip
	mov	r1, r5
	mov	r0, #0
	rsb	r2, r2, #1040
	fmdrr	d21, r0, r1
	ubfx	r3, r3, #0, #20
	add	ip, r2, #3
	orr	r2, r3, #1048576
	fsubd	d4, d4, d21
	mov	r2, r2, asr ip
	rsblt	r2, r2, #0
	faddd	d2, d3, d4
	mov	r3, r2, asl #20
.L23:
	fmrrd	r0, r1, d2
	mov	r0, #0
	fldd	d26, .L109+264
	fmdrr	d5, r0, r1
	fldd	d0, .L109+272
	fldd	d24, .L109+80
	fsubd	d31, d5, d4
	fmuld	d19, d5, d26
	fldd	d6, .L109+88
	fsubd	d30, d3, d31
	fmuld	d29, d5, d24
	fldd	d23, .L109+96
	fmacd	d19, d30, d0
	fldd	d7, .L109+104
	fldd	d28, .L109+112
	fldd	d20, .L109+120
	fconstd	d3, #0
	fconstd	d27, #112
	faddd	d16, d29, d19
	fmuld	d4, d16, d16
	fcpyd	d22, d16
	fsubd	d18, d16, d29
	fsubd	d2, d19, d18
	fmscd	d23, d4, d6
	fmacd	d2, d16, d2
	fmacd	d7, d23, d4
	fmscd	d28, d7, d4
	fmacd	d20, d28, d4
	fnmacd	d22, d20, d4
	fmuld	d1, d16, d22
	fsubd	d25, d22, d3
	fdivd	d21, d1, d25
	fsubd	d26, d21, d2
	fsubd	d0, d26, d16
	fsubd	d24, d27, d0
	fmrrd	r0, r1, d24
	add	r1, r3, r1
	cmp	r1, #1048576
	blt	.L95
	fmrrd	r2, r3, d24
	mov	r3, r1
	fmdrr	d16, r2, r3
	b	.L3
.L94:
	cmp	r1, #0
	beq	.L96
.L17:
	mov	r5, #0
	movt	r5, 32752
	cmp	ip, r5
	bgt	.L4
	beq	.L97
.L30:
	mov	r5, #0
	movt	r5, 32752
	cmp	r4, r5
	bgt	.L4
	beq	.L98
.L31:
	cmp	r1, #0
	blt	.L99
.L67:
	mov	r5, #0
.L32:
	cmp	ip, #0
	bne	.L34
	cmp	r0, #0
	bne	.L35
.L87:
	cmp	r3, #0
	blt	.L100
	fabsd	d16, d17
.L39:
	cmp	r5, #1
	bne	.L3
.L82:
	fnegd	d16, d16
	b	.L3
.L89:
	cmp	r0, #0
	beq	.L5
.L4:
	faddd	d16, d16, d17
.L3:
	fmrrd	r0, r1, d16
	fldmfdd	sp!, {d8}
	ldmfd	sp!, {r4, r5, r6, pc}
.L60:
	fconstd	d16, #112
	b	.L3
.L96:
	cmp	r0, #0
	beq	.L17
	b	.L16
.L97:
	cmp	r0, #0
	beq	.L30
	b	.L4
.L34:
	mov	r6, #0
	movt	r6, 32752
	cmp	ip, r6
	beq	.L87
.L35:
	cmp	r1, #0
	blt	.L101
	add	r4, r4, #-1140850688
	add	r4, r4, #1048576
	cmn	r4, #-1006632959
	bhi	.L9
	fconstd	d0, #112
	fcmpd	d17, d0
	fmstat
	beq	.L78
	movw	r1, #65535
	movt	r1, 16367
	cmp	ip, r1
	ble	.L102
	cmp	r3, #0
	ble	.L9
.L59:
	fldd	d5, .L109+160
	fmuld	d16, d5, d5
	b	.L3
.L110:
	.align	3
.L109:
	.word	0
	.word	1128267776
	.word	1246056175
	.word	1070235176
	.word	-1815487643
	.word	1070433866
	.word	-1457700607
	.word	1070691424
	.word	1368335949
	.word	1070945621
	.word	-613438465
	.word	1071345078
	.word	858993411
	.word	1071854387
	.word	341508597
	.word	-1103220768
	.word	-600177667
	.word	1072613129
	.word	-536870912
	.word	1072613129
	.word	0
	.word	1072049731
	.word	1925096656
	.word	1046886249
	.word	-976065551
	.word	1052491073
	.word	-1356472788
	.word	1058100842
	.word	381599123
	.word	1063698796
	.word	1431655742
	.word	1069897045
	.word	1073741824
	.word	1071822851
	.word	1137692678
	.word	1045233131
	.word	0
	.word	-2147483648
	.word	-2013235812
	.word	-29891524
	.word	-2013235812
	.word	2117592124
	.word	0
	.word	0
	.word	0
	.word	1128267776
	.word	1246056175
	.word	1070235176
	.word	-1815487643
	.word	1070433866
	.word	-1457700607
	.word	1070691424
	.word	-536870912
	.word	1072613129
	.word	1368335949
	.word	1070945621
	.word	-600177667
	.word	1072613129
	.word	341508597
	.word	-1103220768
	.word	858993411
	.word	1071854387
	.word	-613438465
	.word	1071345078
	.word	1697350398
	.word	1016534343
	.word	212364345
	.word	-1105175455
	.word	-17155601
	.word	1072049730
.L20:
	movw	r3, #39054
	movt	r3, 3
	cmp	ip, r3
	mov	r3, r0
	fmdrr	d2, r2, r3
	ble	.L21
	fconstd	d18, #120
	fconstd	d3, #112
	fldd	d4, .L109+184
	faddd	d27, d2, d18
	fsubd	d1, d2, d18
	fldd	d26, .L109+192
	fdivd	d24, d3, d27
	fmrrd	r2, r3, d27
	fldd	d25, .L109+200
	mov	r2, #0
	fmsr	s7, r1	@ int
	fmdrr	d23, r2, r3
	fldd	d30, .L109+216
	fldd	d0, .L109+248
	fsubd	d28, d23, d18
	fldd	d21, .L109+240
	fconstd	d29, #8
	fsubd	d7, d2, d28
	fldd	d5, .L109+232
	fldd	d22, .L109+136
	fldd	d6, .L109+208
	fldd	d31, .L109+224
	fsitod	d18, s7
	fldd	d3, .L109+128
	faddd	d2, d18, d3
	fmuld	d20, d1, d24
	fmuld	d17, d20, d20
	fmrrd	r0, r1, d20
	mov	r0, r2
	fmdrr	d19, r0, r1
	fmacd	d26, d17, d4
	fnmacd	d1, d19, d23
	fmuld	d4, d17, d17
	fmacd	d25, d26, d17
	fnmacd	d1, d19, d7
	fmuld	d27, d19, d19
	fmacd	d30, d25, d17
	fmuld	d1, d1, d24
	faddd	d26, d27, d29
	fmacd	d0, d30, d17
	fmuld	d24, d1, d20
	fmacd	d21, d0, d17
	fmacd	d24, d1, d19
	fmuld	d21, d4, d21
	faddd	d25, d24, d21
	faddd	d7, d26, d25
	fmsr	s14, r2	@ int
	fsubd	d30, d7, d29
	fmuld	d0, d1, d7
	fsubd	d23, d30, d27
	fmuld	d29, d19, d7
	fsubd	d28, d25, d23
	fmacd	d0, d20, d28
	faddd	d4, d29, d0
	fmsr	s8, r2	@ int
	fcpyd	d20, d4
	fmacd	d22, d20, d5
	fsubd	d5, d20, d29
	fmuld	d7, d20, d6
	fsubd	d6, d0, d5
	fmacd	d22, d6, d31
	faddd	d31, d2, d7
	faddd	d2, d31, d22
	fmsr	s4, r2	@ int
	fsubd	d18, d2, d18
	fsubd	d3, d18, d3
	fsubd	d17, d3, d7
	fsubd	d18, d22, d17
	b	.L22
.L18:
	mov	r0, ip, asr #20
	sub	r4, r0, #1020
	sub	r1, r4, #3
	b	.L19
.L62:
	mov	r3, r2
	b	.L23
.L93:
	cmp	r1, #0
	blt	.L2
	fsqrtd	d16, d17
	fcmpd	d16, d16
	fmstat
	beq	.L3
	fmrrd	r0, r1, d17
	bl	sqrt(PLT)
	fmdrr	d16, r0, r1
	b	.L3
.L101:
	cmp	r5, #0
	beq	.L103
	fldd	d22, .L109+144
	fldd	d19, .L109+168
	fldd	d20, .L109+152
	fldd	d18, .L109+160
	fconstd	d21, #240
	fconstd	d8, #112
	cmp	r5, #1
	mov	r0, #0
	movt	r0, 17392
	fcpydeq	d19, d22
	fcpydne	d20, d18
	fcpydeq	d8, d21
	cmp	r4, r0
	bgt	.L43
	cmp	ip, #1048576
	fabsd	d1, d17
	bge	.L44
	fldd	d2, .L109+176
	fmuld	d1, d1, d2
	fmrrd	r2, r3, d1
	mov	ip, r3, asr #20
	sub	r2, ip, #1072
	sub	r1, r2, #4
	mov	ip, r3
.L45:
	movw	r0, #46713
	ubfx	ip, ip, #0, #20
	movt	r0, 11
	cmp	ip, r0
	orr	r3, ip, #1069547520
	orr	r0, r3, #3145728
	fmrrd	r2, r3, d1
	ble	.L46
	sub	r3, r0, #1048576
	add	r1, r1, #1
	fmdrr	d5, r2, r3
.L47:
	fconstd	d4, #112
	fldd	d18, .L109+184
	faddd	d27, d5, d4
	fsubd	d31, d5, d4
	fldd	d26, .L109+192
	fdivd	d1, d4, d27
	fmrrd	r2, r3, d27
	fldd	d25, .L109+200
	mov	r2, #0
	fmsr	s5, r1	@ int
	fmdrr	d30, r2, r3
	fldd	d24, .L109+216
	fldd	d23, .L109+248
	fsubd	d17, d30, d4
	fldd	d22, .L109+240
	fconstd	d0, #8
	fsubd	d7, d5, d17
	fldd	d6, .L109+232
	fldd	d3, .L109+224
	fldd	d5, .L109+208
	fsitod	d2, s5
	fmuld	d21, d31, d1
	fmuld	d29, d21, d21
	fmrrd	r0, r1, d21
	mov	r0, r2
	fmacd	d26, d29, d18
	fmdrr	d18, r0, r1
	fmuld	d4, d29, d29
	fnmacd	d31, d18, d30
	fmacd	d25, d26, d29
	fmuld	d26, d18, d18
	fnmacd	d31, d18, d7
	fmacd	d24, d25, d29
	faddd	d27, d26, d0
	fmuld	d28, d31, d1
	fmacd	d23, d24, d29
	fmuld	d31, d28, d21
	fmacd	d22, d23, d29
	fmacd	d31, d28, d18
	fmuld	d1, d4, d22
	faddd	d25, d31, d1
	faddd	d7, d27, d25
	fmsr	s14, r2	@ int
	fsubd	d24, d7, d0
	fmuld	d23, d28, d7
	fsubd	d30, d24, d26
	fmuld	d22, d18, d7
	fsubd	d0, d25, d30
	fmacd	d23, d21, d0
	faddd	d4, d22, d23
	fmsr	s8, r2	@ int
	fcpyd	d7, d4
	fsubd	d17, d7, d22
	fmuld	d6, d7, d6
	fsubd	d29, d23, d17
	fmuld	d5, d7, d5
	fmacd	d6, d29, d3
	faddd	d3, d2, d5
	faddd	d7, d3, d6
	fmsr	s14, r2	@ int
	fcpyd	d18, d7
	fsubd	d2, d18, d2
	fsubd	d21, d2, d5
	fsubd	d4, d6, d21
.L48:
	fmrrd	r2, r3, d16
	mov	r2, #0
	fmuld	d27, d16, d4
	fmdrr	d26, r2, r3
	mov	r4, #0
	movt	r4, 16352
	fsubd	d16, d16, d26
	fmuld	d28, d26, d18
	fmacd	d27, d16, d18
	faddd	d31, d27, d28
	fmrrd	r0, r1, d31
	bic	ip, r1, #-2147483648
	cmp	ip, r4
	ble	.L72
	movw	r2, #65535
	movt	r2, 16527
	cmp	ip, r2
	ble	.L50
	cmp	r1, r2
	ble	.L51
	add	r3, r1, #-1090519040
	add	r2, r3, #7340032
	orrs	r3, r2, r0
	bne	.L83
	fldd	d19, .L109+256
	fsubd	d1, d31, d28
	faddd	d25, d27, d19
	fcmped	d25, d1
	fmstat
	bgt	.L83
.L50:
	mov	r5, ip, asr #20
	sub	r0, r5, #1020
	sub	r4, r0, #2
	mov	ip, #1048576
	movw	r0, #65535
	add	r2, r1, ip, asr r4
	ubfx	r3, r2, #20, #11
	sub	r5, r3, #1020
	movt	r0, 15
	sub	r5, r5, #3
	rsb	r4, r3, #1040
	bic	r3, r2, r0, asr r5
	cmp	r1, #0
	mov	r0, #0
	mov	r1, r3
	ubfx	r2, r2, #0, #20
	fmdrr	d24, r0, r1
	add	ip, r4, #3
	orr	r4, r2, #1048576
	fsubd	d28, d28, d24
	mov	r2, r4, asr ip
	rsblt	r2, r2, #0
	faddd	d31, d27, d28
	mov	r3, r2, asl #20
.L49:
	fmrrd	r0, r1, d31
	mov	r0, #0
	fldd	d30, .L109+264
	fmdrr	d6, r0, r1
	fldd	d0, .L109+272
	fldd	d7, .L111
	fsubd	d17, d6, d28
	fmuld	d5, d6, d30
	fldd	d29, .L111+8
	fsubd	d3, d27, d17
	fmuld	d18, d6, d7
	fldd	d23, .L111+16
	fmacd	d5, d3, d0
	fldd	d22, .L111+24
	fldd	d2, .L111+32
	fldd	d4, .L111+40
	fconstd	d27, #0
	fconstd	d26, #112
	faddd	d16, d18, d5
	fmuld	d28, d16, d16
	fcpyd	d20, d16
	fsubd	d21, d16, d18
	fsubd	d31, d5, d21
	fmscd	d23, d28, d29
	fmacd	d31, d16, d31
	fmacd	d22, d23, d28
	fmscd	d2, d22, d28
	fmacd	d4, d2, d28
	fnmacd	d20, d4, d28
	fmuld	d19, d16, d20
	fsubd	d25, d20, d27
	fdivd	d24, d19, d25
	fsubd	d30, d24, d31
	fsubd	d0, d30, d16
	fsubd	d7, d26, d0
	fmrrd	r0, r1, d7
	add	r1, r3, r1
	cmp	r1, #1048576
	blt	.L104
	fmrrd	r2, r3, d7
	mov	r3, r1
	fmdrr	d6, r2, r3
.L56:
	fmuld	d16, d6, d8
	b	.L3
.L100:
	fabsd	d17, d17
	fconstd	d5, #112
	fdivd	d16, d5, d17
	b	.L39
.L90:
	add	r2, ip, #-1073741824
	add	r1, r2, #1048576
	orrs	r1, r1, r0
	beq	.L105
	movw	r0, #65535
	movt	r0, 16367
	cmp	ip, r0
	ble	.L8
	cmp	r3, #0
	bge	.L3
.L9:
	fldd	d16, .L111+48
	b	.L3
.L98:
	cmp	r2, #0
	beq	.L31
	b	.L4
.L78:
	fcpyd	d16, d17
	b	.L3
.L99:
	movw	r5, #65535
	movt	r5, 17215
	cmp	r4, r5
	bgt	.L64
	movw	r5, #65535
	movt	r5, 16367
	cmp	r4, r5
	ble	.L67
	mov	r5, r4, asr #20
	movw	r6, #1043
	cmp	r5, r6
	ble	.L33
	rsb	r6, r5, #1072
	add	r5, r6, #3
	mov	r6, r2, lsr r5
	cmp	r2, r6, asl r5
	bne	.L67
	and	r2, r6, #1
	rsb	r5, r2, #2
	b	.L32
.L25:
	movw	r3, #52223
	movt	r3, 16528
	cmp	ip, r3
	ble	.L24
	add	r2, r1, #1061158912
	add	r3, r2, #3080192
	add	r2, r3, #13312
	orrs	r3, r2, r0
	bne	.L9
	fsubd	d22, d2, d4
	fcmped	d3, d22
	fmstat
	bhi	.L24
	b	.L9
.L92:
	cmp	r1, #0
	blt	.L2
	fsqrtd	d6, d17
	fcmpd	d6, d6
	fmstat
	bne	.L106
.L12:
	fsqrtd	d16, d6
	fcmpd	d16, d16
	fmstat
	beq	.L3
	fmrrd	r0, r1, d6
	bl	sqrt(PLT)
	fmdrr	d16, r0, r1
	b	.L3
.L95:
	fmrrd	r0, r1, d24
	fldmfdd	sp!, {d8}
	ldmfd	sp!, {r4, r5, r6, lr}
	b	scalbn(PLT)
.L91:
	fmuld	d16, d17, d17
	b	.L3
.L105:
	fsubd	d16, d16, d16
	b	.L3
.L64:
	mov	r5, #2
	b	.L32
.L8:
	cmp	r3, #0
	bge	.L9
	b	.L82
.L102:
	cmp	r3, #0
	bge	.L9
	b	.L59
.L103:
	fsubd	d23, d17, d17
	fdivd	d16, d23, d23
	b	.L3
.L43:
	add	r2, r4, #-1140850688
	add	r1, r2, #1048576
	cmn	r1, #-1006632959
	bhi	.L9
	fcmpd	d17, d21
	fmstat
	beq	.L75
	movw	r0, #65535
	movt	r0, 16367
	cmp	ip, r0
	ble	.L107
	cmp	r3, #0
	ble	.L77
.L81:
	fmuld	d16, d20, d18
	b	.L3
.L33:
	cmp	r2, #0
	bne	.L67
	rsb	r6, r5, #1040
	add	r6, r6, #3
	mov	r5, r4, asr r6
	cmp	r4, r5, asl r6
	beq	.L108
	mov	r5, r2
	b	.L32
.L72:
	mov	r3, r2
	b	.L49
.L44:
	mov	r3, ip, asr #20
	sub	r4, r3, #1020
	sub	r1, r4, #3
	b	.L45
.L46:
	movw	r4, #39054
	movt	r4, 3
	mov	r3, r0
	cmp	ip, r4
	fmdrr	d5, r2, r3
	ble	.L47
	fconstd	d3, #120
	fconstd	d31, #112
	fldd	d18, .L111+56
	faddd	d4, d5, d3
	fsubd	d25, d5, d3
	fldd	d27, .L111+64
	fdivd	d31, d31, d4
	fmrrd	r2, r3, d4
	mov	r2, #0
	fldd	d26, .L111+72
	fmdrr	d4, r2, r3
	fldd	d24, .L111+80
	fldd	d23, .L111+88
	fsubd	d6, d4, d3
	fldd	d22, .L111+96
	fconstd	d30, #8
	fsubd	d7, d5, d6
	fmsr	s11, r1	@ int
	fldd	d2, .L111+104
	fldd	d1, .L111+112
	fsitod	d29, s11
	fldd	d6, .L111+120
	fldd	d28, .L111+128
	fldd	d0, .L111+136
	faddd	d3, d29, d28
	fmuld	d21, d25, d31
	fmuld	d17, d21, d21
	fmrrd	r0, r1, d21
	mov	r0, r2
	fmacd	d27, d17, d18
	fmdrr	d18, r0, r1
	fmuld	d5, d17, d17
	fnmacd	d25, d18, d4
	fmacd	d26, d27, d17
	fmuld	d27, d18, d18
	fnmacd	d25, d18, d7
	fmacd	d24, d26, d17
	faddd	d26, d27, d30
	fmuld	d25, d25, d31
	fmacd	d23, d24, d17
	fmuld	d31, d25, d21
	fmacd	d22, d23, d17
	fmacd	d31, d25, d18
	fmuld	d24, d5, d22
	faddd	d23, d31, d24
	faddd	d7, d26, d23
	fmsr	s14, r2	@ int
	fsubd	d4, d7, d30
	fmuld	d22, d25, d7
	fsubd	d30, d4, d27
	fmuld	d17, d18, d7
	fsubd	d7, d23, d30
	fmacd	d22, d21, d7
	faddd	d7, d17, d22
	fmsr	s14, r2	@ int
	fsubd	d21, d7, d17
	fmuld	d6, d7, d6
	fsubd	d18, d22, d21
	faddd	d3, d3, d6
	fmuld	d2, d18, d2
	fmacd	d2, d7, d1
	faddd	d1, d2, d0
	faddd	d7, d3, d1
	fmsr	s14, r2	@ int
	fcpyd	d18, d7
	fsubd	d29, d18, d29
	fsubd	d28, d29, d28
	fsubd	d0, d28, d6
	fsubd	d4, d1, d0
	b	.L48
.L75:
	fcpyd	d16, d8
	b	.L3
.L107:
	cmp	r3, #0
	blt	.L81
.L77:
	fcpyd	d16, d19
	b	.L3
.L112:
	.align	3
.L111:
	.word	0
	.word	1072049731
	.word	1925096656
	.word	1046886249
	.word	-976065551
	.word	1052491073
	.word	-1356472788
	.word	1058100842
	.word	381599123
	.word	1063698796
	.word	1431655742
	.word	1069897045
	.word	0
	.word	0
	.word	1246056175
	.word	1070235176
	.word	-1815487643
	.word	1070433866
	.word	-1457700607
	.word	1070691424
	.word	1368335949
	.word	1070945621
	.word	-613438465
	.word	1071345078
	.word	858993411
	.word	1071854387
	.word	-600177667
	.word	1072613129
	.word	341508597
	.word	-1103220768
	.word	-536870912
	.word	1072613129
	.word	1073741824
	.word	1071822851
	.word	1137692678
	.word	1045233131
	.word	-2013235812
	.word	2117592124
.L51:
	movw	r3, #52223
	movt	r3, 16528
	cmp	ip, r3
	ble	.L50
	add	r2, r1, #1061158912
	add	r3, r2, #3080192
	add	r2, r3, #13312
	orrs	r3, r2, r0
	bne	.L77
	fsubd	d20, d31, d28
	fcmped	d27, d20
	fmstat
	bhi	.L50
	b	.L77
.L104:
	fmrrd	r0, r1, d7
	bl	scalbn(PLT)
	fmdrr	d6, r0, r1
	b	.L56
.L108:
	and	r2, r5, #1
	rsb	r5, r2, #2
	b	.L32
.L83:
	fldd	d29, .L111+144
	fmuld	d16, d20, d29
	b	.L3
.L106:
	fmrrd	r0, r1, d17
	bl	sqrt(PLT)
	fmdrr	d6, r0, r1
	b	.L12
	.fnend
	.size	pow_kernel, .-pow_kernel
	.ident	"GCC: (crosstool-NG linaro-1.13.1-4.7-2012.10-20121022 - Linaro GCC 2012.10) 4.7.3 20121001 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
