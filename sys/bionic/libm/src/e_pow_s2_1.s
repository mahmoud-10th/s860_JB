	.file	"e_pow.c"
	.section	.text.hot.pow,"ax",%progbits
	.align	2
	.global	pow
	.type	pow, %function
pow:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	fmdrr	d17, r2, r3
	fstmfdd	sp!, {d8}
	.vsave {d8}
	mov	r4, r0
	mov	r5, r1
	bic	ip, r1, #-2147483648
	bic	r7, r3, #-2147483648
	beq	.L2
	movw	r6, #65534
	movt	r6, 32751
	sub	r8, r1, #1
	cmp	r8, r6
	bhi	.L3
	mov	r6, #0
	movt	r6, 17392
	cmp	r7, r6
	bgt	.L4
	cmp	ip, #1048576
	blt	.L5
	movw	r2, #46713
	ubfx	r3, ip, #0, #20
	movt	r2, 11
	mov	r4, ip, asr #20
	cmp	r3, r2
	sub	ip, r4, #1020
	orr	r5, r3, #1069547520
	sub	r4, ip, #3
	orr	r5, r5, #3145728
	bgt	.L60
	movw	r1, #39054
	movt	r1, 3
	cmp	r3, r1
	mov	r1, r5
	fmdrr	d2, r0, r1
	ble	.L8
.L7:
	fconstd	d3, #120
	fldd	d4, .L100
	fsubd	d16, d2, d3
	faddd	d5, d2, d3
	fldd	d6, .L100+8
	fldd	d24, .L100+16
	fdivd	d25, d16, d5
	fldd	d23, .L100+24
	fldd	d22, .L100+32
	fldd	d21, .L100+40
	fmsr	s3, r4	@ int
	fconstd	d29, #8
	fldd	d30, .L100+48
	fsitod	d26, s3
	fldd	d31, .L100+56
	mov	r0, #0
	movt	r0, 16352
	fmuld	d7, d25, d25
	fmuld	d0, d25, d30
	fmacd	d6, d7, d4
	faddd	d1, d7, d29
	fmuld	d27, d7, d7
	fmacd	d24, d6, d7
	fmacd	d23, d24, d7
	fmacd	d22, d23, d7
	fmacd	d21, d22, d7
	fmacd	d1, d27, d21
	fmacd	d31, d0, d1
	faddd	d22, d31, d26
.L87:
	fmuld	d17, d17, d22
	fmrrd	r2, r3, d17
	bic	ip, r3, #-2147483648
	cmp	ip, r0
	mov	r0, r3
	ble	.L63
	movw	r1, #65535
	movt	r1, 16527
	cmp	ip, r1
	bgt	.L26
	mov	r6, ip, asr #20
	sub	r5, r6, #1020
	sub	r4, r5, #2
	mov	ip, #1048576
	mov	r2, #0
	add	r1, r3, ip, asr r4
	ubfx	r5, r1, #20, #11
	sub	r6, r5, #1020
	movw	ip, #65535
	sub	r6, r6, #3
	movt	ip, 15
	rsb	r4, r5, #1040
	ubfx	r5, r1, #0, #20
	cmp	r3, #0
	add	r4, r4, #3
	bic	r3, r1, ip, asr r6
	orr	r0, r5, #1048576
	fmdrr	d23, r2, r3
	mov	r2, r0, asr r4
	blt	.L27
	fsubd	d31, d17, d23
	fldd	d26, .L100+152
	fldd	d7, .L100+176
	fmuld	d0, d31, d26
	fldd	d1, .L100+184
	fldd	d27, .L100+160
	fldd	d20, .L100+168
	fmuld	d3, d0, d0
	fldd	d28, .L100+64
	fcpyd	d18, d0
	fconstd	d2, #0
	fconstd	d19, #112
	fnmacd	d1, d3, d7
	faddd	d4, d0, d19
	fmacd	d27, d1, d3
	fmacd	d20, d27, d3
	fmacd	d28, d20, d3
	fmacd	d18, d28, d3
	fmuld	d6, d18, d0
	fsubd	d24, d18, d2
	fdivd	d25, d6, d24
	fsubd	d19, d4, d25
	fmrrd	r0, r1, d19
	add	r3, r1, r2, asl #20
	cmp	r3, #1048576
	blt	.L28
	mov	r1, r3
.L1:
	fldmfdd	sp!, {d8}
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L60:
	fmdrr	d18, r0, r1
.L6:
	fmrrd	r2, r3, d18
	sub	r3, r5, #1048576
	add	r4, r4, #1
	fmdrr	d2, r2, r3
.L8:
	fconstd	d20, #112
	fldd	d3, .L100
	fsubd	d19, d2, d20
	faddd	d28, d2, d20
	fldd	d2, .L100+8
	fldd	d4, .L100+16
	fdivd	d18, d19, d28
	fldd	d5, .L100+24
	fldd	d6, .L100+32
	fldd	d24, .L100+40
	fconstd	d25, #8
	fldd	d23, .L100+48
	fmsr	s15, r4	@ int
	mov	r0, #0
	movt	r0, 16352
	fsitod	d22, s15
	fmuld	d16, d18, d18
	fmuld	d21, d18, d23
	fmacd	d2, d16, d3
	faddd	d29, d16, d25
	fmuld	d30, d16, d16
	fmacd	d4, d2, d16
	fmacd	d5, d4, d16
	fmacd	d6, d5, d16
	fmacd	d24, d6, d16
	fmacd	d29, d30, d24
	fmacd	d22, d21, d29
	b	.L87
.L63:
	mov	r3, #0
	mov	r2, r3
.L25:
	fldd	d22, .L100+152
	fldd	d29, .L100+176
	fmuld	d30, d17, d22
	fldd	d17, .L100+184
	fldd	d21, .L100+160
	fldd	d31, .L100+168
	fmuld	d26, d30, d30
	fldd	d7, .L100+64
	fcpyd	d27, d30
	fconstd	d0, #0
	fconstd	d16, #112
	fnmacd	d17, d26, d29
	faddd	d1, d30, d16
	fmacd	d21, d17, d26
	fmacd	d31, d21, d26
	fmacd	d7, d31, d26
	fmacd	d27, d7, d26
	fmuld	d3, d27, d30
	fsubd	d28, d27, d0
	fdivd	d2, d3, d28
	fsubd	d19, d1, d2
	fmrrd	r0, r1, d19
	add	r1, r3, r1
	cmp	r1, #1048576
	blt	.L28
	fmrrd	r2, r3, d19
	mov	r3, r1
	fmdrr	d17, r2, r3
.L9:
	fmrrd	r0, r1, d17
	b	.L1
.L2:
	cmp	r7, #0
	beq	.L61
	mov	r6, #0
	movt	r6, 32752
	cmp	ip, r6
	bgt	.L10
	beq	.L90
.L11:
	mov	r6, #0
	movt	r6, 32752
	cmp	r7, r6
	beq	.L91
	mov	r6, #0
	movt	r6, 16368
	cmp	r3, r6
	beq	.L77
	cmp	r3, #1073741824
	beq	.L92
	mov	r6, #0
	movt	r6, 16336
	cmp	r3, r6
	beq	.L93
	mov	r6, #0
	movt	r6, 16352
	cmp	r3, r6
	beq	.L94
	mov	r6, #0
	movt	r6, 49136
	cmp	r3, r6
	beq	.L95
.L18:
	movw	r6, #65534
	movt	r6, 32751
	sub	r8, r5, #1
	cmp	r8, r6
	bhi	.L3
.L20:
	mov	r6, #0
	movt	r6, 17392
	cmp	r7, r6
	bgt	.L4
	cmp	ip, #1048576
	blt	.L5
	mov	r3, ip, asr #20
	fmdrr	d18, r0, r1
	sub	r0, r3, #1020
	sub	r4, r0, #3
.L22:
	movw	r2, #46713
	ubfx	ip, ip, #0, #20
	movt	r2, 11
	cmp	ip, r2
	orr	r1, ip, #1069547520
	orr	r5, r1, #3145728
	bgt	.L6
	fmrrd	r2, r3, d18
	movw	r3, #39054
	movt	r3, 3
	cmp	ip, r3
	mov	r3, r5
	fmdrr	d2, r2, r3
	bgt	.L7
	b	.L8
.L77:
	fmdrr	d17, r0, r1
	b	.L9
.L61:
	fconstd	d17, #112
	b	.L9
.L94:
	cmp	r5, #0
	blt	.L18
	fmdrr	d16, r0, r1
	fsqrtd	d17, d16
	b	.L9
.L92:
	fmdrr	d5, r0, r1
	fmuld	d17, d5, d5
	b	.L9
.L93:
	cmp	r5, #0
	blt	.L18
	fmdrr	d4, r0, r1
	fsqrtd	d18, d4
	fsqrtd	d17, d18
	b	.L9
.L90:
	cmp	r0, #0
	beq	.L11
.L10:
	fmdrr	d24, r0, r1
	faddd	d17, d17, d24
	b	.L9
.L95:
	fmdrr	d0, r0, r1
	fconstd	d17, #112
	fdivd	d17, d17, d0
	b	.L9
.L101:
	.align	3
.L100:
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
	.word	1195342545
	.word	1071822851
	.word	1431655742
	.word	-1077586603
	.word	0
	.word	0
	.word	0
	.word	2146435072
	.word	0
	.word	1128267776
	.word	1246056175
	.word	1070235176
	.word	-1815487643
	.word	1070433866
	.word	-1457700607
	.word	1070691424
	.word	-613438465
	.word	1071345078
	.word	858993411
	.word	1071854387
	.word	-600177667
	.word	1072613129
	.word	1368335949
	.word	1070945621
	.word	-17155601
	.word	1072049730
	.word	-1356472788
	.word	-1089382806
	.word	381599123
	.word	1063698796
	.word	1925096656
	.word	1046886249
	.word	-976065551
	.word	1052491073
.L91:
	add	r2, ip, #-1073741824
	add	r0, r2, #1048576
	orrs	r1, r0, r4
	beq	.L78
	movw	r1, #65535
	movt	r1, 16367
	cmp	ip, r1
	ble	.L14
	cmp	r3, #0
	bge	.L9
.L78:
	fldd	d17, .L100+72
	b	.L9
.L5:
	fmdrr	d18, r0, r1
	fldd	d28, .L100+88
	fmuld	d18, d18, d28
	fmrrd	r2, r3, d18
	mov	r5, r3, asr #20
	sub	r4, r5, #1072
	mov	ip, r3
	sub	r4, r4, #4
	b	.L22
.L28:
	fmrrd	r0, r1, d19
	fldmfdd	sp!, {d8}
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	scalbn(PLT)
.L26:
	cmp	r3, r1
	ble	.L29
	add	r3, r3, #-1090519040
	add	r1, r3, #7340032
	orrs	r3, r1, r2
	bne	.L64
.L30:
	mov	r2, ip, asr #20
	sub	r5, r2, #1020
	sub	r6, r5, #2
	mov	ip, #1048576
	movw	r5, #65535
	add	r1, r0, ip, asr r6
	ubfx	r4, r1, #20, #11
	sub	r6, r4, #1020
	sub	ip, r6, #3
	movt	r5, 15
	rsb	r6, r4, #1040
	ubfx	r4, r1, #0, #20
	mov	r2, #0
	cmp	r0, #0
	bic	r3, r1, r5, asr ip
	add	r0, r6, #3
	orr	r4, r4, #1048576
	fmdrr	d23, r2, r3
	mov	r2, r4, asr r0
	blt	.L27
.L31:
	fsubd	d17, d17, d23
	mov	r3, r2, asl #20
	b	.L25
.L27:
	rsb	r2, r2, #0
	b	.L31
.L58:
	cmp	r3, #0
	ble	.L78
.L64:
	fldd	d17, .L100+80
	b	.L9
.L29:
	movw	r1, #52223
	movt	r1, 16528
	cmp	ip, r1
	ble	.L30
	mov	r3, #13312
	movt	r3, 16239
	add	r1, r0, r3
	orrs	r3, r1, r2
	beq	.L30
	b	.L78
.L3:
	cmp	r5, #0
	bne	.L4
	cmp	r4, #0
	bne	.L20
.L4:
	mov	r6, #0
	movt	r6, 32752
	cmp	ip, r6
	bgt	.L10
	beq	.L96
.L33:
	mov	r6, #0
	movt	r6, 32752
	cmp	r7, r6
	bgt	.L10
	beq	.L97
.L34:
	cmp	r5, #0
	blt	.L98
.L69:
	mov	r6, #0
.L35:
	cmp	ip, #0
	bne	.L37
	cmp	r4, #0
	bne	.L38
	cmp	r3, #0
	fmdrrge	d0, r0, r1
	fabsdge	d17, d0
	bge	.L42
	fmdrr	d1, r0, r1
	fconstd	d19, #112
	fabsd	d20, d1
	fdivd	d17, d19, d20
.L42:
	cmp	r6, #1
	bne	.L9
.L83:
	fnegd	d17, d17
	b	.L9
.L38:
	cmp	r5, #0
	blt	.L99
	add	r4, r7, #-1140850688
	add	r4, r4, #1048576
	cmn	r4, #-1006632959
	bhi	.L78
	fmdrr	d4, r0, r1
	fconstd	d3, #112
	fcmpd	d4, d3
	fmstat
	beq	.L77
	movw	r0, #65535
	movt	r0, 16367
	cmp	ip, r0
	bgt	.L58
	cmp	r3, #0
	bge	.L78
	b	.L64
.L37:
	mov	r8, #0
	movt	r8, 32752
	cmp	ip, r8
	bne	.L38
	cmp	r3, #0
	fmdrrge	d20, r0, r1
	fabsdge	d17, d20
	bge	.L42
	fmdrr	d19, r0, r1
	fconstd	d2, #112
	fabsd	d1, d19
	fdivd	d17, d2, d1
	b	.L42
.L99:
	cmp	r6, #0
	beq	.L73
	fconstd	d5, #240
	fconstd	d8, #112
	cmp	r6, #1
	mov	r4, #0
	movt	r4, 17392
	fcpydeq	d8, d5
	cmp	r7, r4
	bgt	.L45
	fmdrr	d7, r0, r1
	cmp	ip, #1048576
	fabsd	d21, d7
	bge	.L46
	fldd	d22, .L100+88
	fmuld	d21, d21, d22
	fmrrd	r2, r3, d21
	mov	ip, r3, asr #20
	sub	r2, ip, #1072
	sub	r1, r2, #4
	mov	ip, r3
.L47:
	movw	r3, #46713
	ubfx	ip, ip, #0, #20
	movt	r3, 11
	cmp	ip, r3
	orr	r0, ip, #1069547520
	orr	r0, r0, #3145728
	fmrrd	r2, r3, d21
	ble	.L48
	sub	r3, r0, #1048576
	add	r1, r1, #1
	fmdrr	d23, r2, r3
.L49:
	fconstd	d6, #112
	fldd	d26, .L100+96
	fsubd	d7, d23, d6
	faddd	d21, d23, d6
	fldd	d24, .L100+104
	fldd	d23, .L100+112
	fdivd	d25, d7, d21
	fldd	d22, .L100+144
	fldd	d29, .L100+120
	fldd	d30, .L100+128
	fconstd	d31, #8
	fldd	d27, .L100+136
	fmsr	s1, r1	@ int
	fsitod	d0, s1
	fmuld	d1, d25, d25
	fmuld	d20, d25, d27
	fmacd	d24, d1, d26
	faddd	d19, d1, d31
	fmuld	d28, d1, d1
	fmacd	d23, d24, d1
	fmacd	d22, d23, d1
	fmacd	d29, d22, d1
	fmacd	d30, d29, d1
	fmacd	d19, d28, d30
	fmacd	d0, d20, d19
.L50:
	fmuld	d17, d0, d17
	mov	r1, #0
	movt	r1, 16352
	fmrrd	r2, r3, d17
	bic	ip, r3, #-2147483648
	cmp	ip, r1
	ble	.L75
	movw	r0, #65535
	movt	r0, 16527
	cmp	ip, r0
	ble	.L52
	cmp	r3, r0
	ble	.L53
	add	r1, r3, #-1090519040
	add	r0, r1, #7340032
	orrs	r1, r0, r2
	bne	.L85
.L52:
	mov	r5, ip, asr #20
	sub	r6, r5, #1020
	sub	r4, r6, #2
	mov	r2, #1048576
	movw	r5, #65535
	add	ip, r3, r2, asr r4
	ubfx	r6, ip, #20, #11
	sub	r4, r6, #1020
	sub	r4, r4, #3
	movt	r5, 15
	mov	r0, #0
	bic	r1, ip, r5, asr r4
	ubfx	r2, ip, #0, #20
	fmdrr	d18, r0, r1
	rsb	r6, r6, #1040
	cmp	r3, #0
	orr	ip, r2, #1048576
	add	r3, r6, #3
	fsubd	d17, d17, d18
	mov	r2, ip, asr r3
	rsblt	r2, r2, #0
.L51:
	fldd	d2, .L100+152
	fldd	d3, .L100+176
	fmuld	d16, d17, d2
	fldd	d4, .L100+184
	fldd	d5, .L100+160
	fldd	d6, .L100+168
	fmuld	d26, d16, d16
	fldd	d7, .L102
	fcpyd	d25, d16
	fconstd	d21, #0
	fconstd	d24, #112
	fnmacd	d4, d26, d3
	faddd	d23, d16, d24
	fmacd	d5, d4, d26
	fmacd	d6, d5, d26
	fmacd	d7, d6, d26
	fmacd	d25, d7, d26
	fmuld	d29, d25, d16
	fsubd	d27, d25, d21
	fdivd	d30, d29, d27
	fsubd	d31, d23, d30
	fmrrd	r0, r1, d31
	add	r1, r1, r2, asl #20
	cmp	r1, #1048576
	fmrrdge	r2, r3, d31
	movge	r3, r1
	fmdrrge	d27, r2, r3
	bge	.L84
	fmrrd	r0, r1, d31
	bl	scalbn(PLT)
	fmdrr	d27, r0, r1
.L84:
	fmuld	d17, d8, d27
	b	.L9
.L75:
	mov	r2, #0
	b	.L51
.L48:
	movw	r4, #39054
	movt	r4, 3
	mov	r3, r0
	cmp	ip, r4
	fmdrr	d23, r2, r3
	ble	.L49
	fconstd	d24, #120
	fldd	d27, .L102+8
	fsubd	d25, d23, d24
	faddd	d26, d23, d24
	fldd	d29, .L102+16
	fldd	d30, .L102+24
	fdivd	d31, d25, d26
	fldd	d0, .L102+32
	fldd	d1, .L102+40
	fldd	d20, .L102+48
	fconstd	d19, #8
	fldd	d28, .L102+56
	fldd	d18, .L102+64
	fmsr	s15, r1	@ int
	fsitod	d2, s15
	fmuld	d16, d31, d31
	fmuld	d3, d31, d28
	fmacd	d29, d16, d27
	faddd	d4, d16, d19
	fmuld	d5, d16, d16
	fmacd	d30, d29, d16
	fmacd	d0, d30, d16
	fmacd	d1, d0, d16
	fmacd	d20, d1, d16
	fmacd	d4, d5, d20
	fmacd	d18, d3, d4
	faddd	d0, d18, d2
	b	.L50
.L46:
	mov	r3, ip, asr #20
	sub	r0, r3, #1020
	sub	r1, r0, #3
	b	.L47
.L45:
	add	r2, r7, #-1140850688
	add	r4, r2, #1048576
	cmn	r4, #-1006632959
	bhi	.L78
	fmdrr	d6, r0, r1
	fcmpd	d6, d5
	fmstat
	fcpydeq	d17, d8
	beq	.L9
	movw	r1, #65535
	movt	r1, 16367
	cmp	ip, r1
	bgt	.L57
	cmp	r3, #0
	bge	.L78
.L85:
	fldd	d27, .L102+72
	b	.L84
.L57:
	cmp	r3, #0
	bgt	.L85
	b	.L78
.L73:
	fldd	d17, .L102+80
	b	.L9
.L53:
	movw	r1, #52223
	movt	r1, 16528
	cmp	ip, r1
	ble	.L52
	add	r0, r3, #1061158912
	add	r1, r0, #3080192
	add	r0, r1, #13312
	orrs	r1, r0, r2
	beq	.L52
	b	.L78
.L96:
	cmp	r4, #0
	beq	.L33
	b	.L10
.L98:
	movw	r6, #65535
	movt	r6, 17215
	cmp	r7, r6
	movgt	r6, #2
	bgt	.L35
	movw	r6, #65535
	movt	r6, 16367
	cmp	r7, r6
	ble	.L69
	mov	r6, r7, asr #20
	movw	r8, #1043
	cmp	r6, r8
	ble	.L36
	rsb	r6, r6, #1072
	add	r8, r6, #3
	mov	r6, r2, lsr r8
	cmp	r2, r6, asl r8
	bne	.L69
.L82:
	and	r2, r6, #1
	rsb	r6, r2, #2
	b	.L35
.L97:
	cmp	r2, #0
	beq	.L34
	b	.L10
.L36:
	cmp	r2, #0
	bne	.L69
	rsb	r8, r6, #1040
	add	r8, r8, #3
	mov	r6, r7, asr r8
	cmp	r7, r6, asl r8
	movne	r6, r2
	bne	.L35
	b	.L82
.L14:
	cmp	r3, #0
	bge	.L78
	b	.L83
.L103:
	.align	3
.L102:
	.word	1431655742
	.word	-1077586603
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
	.word	1195342545
	.word	1071822851
	.word	0
	.word	2146435072
	.word	0
	.word	2146959360
	.fnend
	.size	pow, .-pow
	.ident	"GCC: (crosstool-NG linaro-1.13.1-4.7-2012.10-20121022 - Linaro GCC 2012.10) 4.7.3 20121001 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
