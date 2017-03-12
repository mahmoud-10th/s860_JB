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
	fmdrr	d16, r2, r3
	fstmfdd	sp!, {d8}
	.vsave {d8}
	mov	r4, r0
	mov	r5, r1
	bic	r6, r1, #-2147483648
	bic	r7, r3, #-2147483648
	beq	.L2
	movw	ip, #65534
	movt	ip, 32751
	sub	r8, r1, #1
	cmp	r8, ip
	bhi	.L3
	mov	ip, #0
	movt	ip, 17392
	cmp	r7, ip
	bgt	.L4
	cmp	r6, #1048576
	blt	.L5
	movw	r2, #46713
	movt	r2, 11
	ubfx	r3, r6, #0, #20
	mov	r4, r6, asr #20
	cmp	r3, r2
	sub	ip, r4, #1020
	orr	r2, r3, #1069547520
	sub	ip, ip, #3
	orr	r4, r2, #3145728
	bgt	.L72
	movw	r1, #39054
	movt	r1, 3
	cmp	r3, r1
	mov	r1, r4
	fmdrr	d0, r0, r1
	ble	.L8
.L7:
	fconstd	d2, #120
	fconstd	d25, #112
	fldd	d19, .L111
	faddd	d1, d0, d2
	fsubd	d24, d0, d2
	fldd	d26, .L111+8
	fdivd	d31, d25, d1
	fmrrd	r2, r3, d1
	mov	r2, #0
	fmrrd	r0, r1, d16
	mov	r0, r2
	fldd	d25, .L111+16
	fmdrr	d28, r0, r1
	fmdrr	d3, r2, r3
	fldd	d23, .L111+24
	fldd	d22, .L111+32
	fsubd	d29, d3, d2
	fldd	d21, .L111+40
	fconstd	d30, #8
	fsubd	d7, d0, d29
	fldd	d5, .L111+48
	fldd	d18, .L111+56
	fmsr	s1, ip	@ int
	fldd	d2, .L111+64
	fldd	d6, .L111+72
	fsitod	d29, s1
	fldd	d27, .L111+80
	fmuld	d20, d24, d31
	faddd	d1, d29, d27
	fsubd	d0, d16, d28
	mov	r3, r2
	movt	r3, 16352
	fmuld	d17, d20, d20
	fmrrd	r0, r1, d20
	mov	r0, r2
	fmacd	d26, d17, d19
	fmdrr	d19, r0, r1
	fmuld	d4, d17, d17
	fnmacd	d24, d19, d3
	fmacd	d25, d26, d17
	fmuld	d26, d19, d19
	fnmacd	d24, d19, d7
	fmacd	d23, d25, d17
	faddd	d25, d26, d30
	fmuld	d24, d24, d31
	fmacd	d22, d23, d17
	fmuld	d31, d24, d20
	fmacd	d21, d22, d17
	fmacd	d31, d24, d19
	fmuld	d23, d4, d21
	faddd	d22, d31, d23
	faddd	d7, d25, d22
	fmsr	s14, r2	@ int
	fsubd	d3, d7, d30
	fmuld	d21, d24, d7
	fsubd	d30, d3, d26
	fmuld	d7, d19, d7
	fsubd	d17, d22, d30
	fmacd	d21, d20, d17
	faddd	d3, d7, d21
	fmsr	s6, r2	@ int
	fmacd	d18, d3, d5
	fsubd	d5, d3, d7
	fmuld	d6, d3, d6
	fsubd	d20, d21, d5
	fmacd	d18, d20, d2
	faddd	d2, d1, d6
	faddd	d1, d2, d18
	fmsr	s2, r2	@ int
	fsubd	d29, d1, d29
	fmuld	d28, d1, d28
	fsubd	d27, d29, d27
	fsubd	d19, d27, d6
	fsubd	d18, d18, d19
	fmuld	d16, d16, d18
	fmacd	d16, d1, d0
.L96:
	faddd	d27, d16, d28
	fmrrd	r0, r1, d27
	bic	r4, r1, #-2147483648
	cmp	r4, r3
	mov	ip, r1
	ble	.L75
	movw	r1, #65535
	movt	r1, 16527
	cmp	r4, r1
	bgt	.L29
	mov	r5, r4, asr #20
	sub	r4, r5, #1020
	sub	r0, r4, #2
	mov	r2, #1048576
	movw	r3, #65535
	add	r4, ip, r2, asr r0
	ubfx	r1, r4, #20, #11
	sub	r5, r1, #1020
	movt	r3, 15
	sub	r5, r5, #3
	rsb	r2, r1, #1040
	bic	r1, r4, r3, asr r5
	ubfx	r4, r4, #0, #20
	cmp	ip, #0
	orr	r3, r4, #1048576
	add	ip, r2, #3
	mov	r0, #0
	mov	r2, r3, asr ip
	fmdrr	d22, r0, r1
	blt	.L30
	fsubd	d25, d28, d22
	fldd	d2, .L111+88
	fldd	d30, .L111+96
	faddd	d7, d16, d25
	fmsr	s14, r0	@ int
	fldd	d24, .L111+144
	fldd	d31, .L111+120
	fsubd	d17, d7, d25
	fmuld	d26, d7, d2
	fldd	d23, .L111+136
	fsubd	d0, d16, d17
	fmuld	d3, d7, d24
	fldd	d22, .L111+128
	fmacd	d26, d0, d30
	fldd	d21, .L111+112
	fldd	d4, .L111+104
	fconstd	d20, #0
	fconstd	d5, #112
	faddd	d6, d3, d26
	fmuld	d29, d6, d6
	fcpyd	d1, d6
	fsubd	d18, d6, d3
	fsubd	d28, d26, d18
	fmscd	d23, d29, d31
	fmacd	d28, d6, d28
	fmacd	d22, d23, d29
	fmscd	d21, d22, d29
	fmacd	d4, d21, d29
	fnmacd	d1, d4, d29
	fmuld	d19, d6, d1
	fsubd	d27, d1, d20
	fdivd	d25, d19, d27
	fsubd	d2, d25, d28
	fsubd	d30, d2, d6
	fsubd	d4, d5, d30
	fmrrd	r0, r1, d4
	add	r1, r1, r2, asl #20
	cmp	r1, #1048576
	blt	.L31
.L1:
	fldmfdd	sp!, {d8}
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L72:
	fmdrr	d18, r0, r1
.L6:
	fmrrd	r2, r3, d18
	sub	r3, r4, #1048576
	add	ip, ip, #1
	fmdrr	d0, r2, r3
.L8:
	fconstd	d1, #112
	fldd	d19, .L111
	faddd	d28, d0, d1
	fsubd	d2, d0, d1
	fldd	d25, .L111+8
	fdivd	d30, d1, d28
	fmrrd	r2, r3, d28
	mov	r2, #0
	fmrrd	r0, r1, d16
	fmdrr	d31, r2, r3
	mov	r0, r2
	fldd	d24, .L111+16
	fsubd	d4, d31, d1
	fmdrr	d1, r0, r1
	fldd	d23, .L111+24
	fsubd	d0, d0, d4
	fldd	d22, .L111+32
	fldd	d21, .L111+40
	fconstd	d26, #8
	fmsr	s9, ip	@ int
	fldd	d3, .L111+48
	fldd	d6, .L111+64
	fsitod	d29, s9
	fldd	d5, .L111+72
	fsubd	d27, d16, d1
	mov	r3, r2
	movt	r3, 16352
	fmuld	d20, d2, d30
	fmuld	d18, d20, d20
	fmrrd	r0, r1, d20
	mov	r0, r2
	fmacd	d25, d18, d19
	fmdrr	d19, r0, r1
	fmuld	d28, d18, d18
	fnmacd	d2, d19, d31
	fmacd	d24, d25, d18
	fmuld	d25, d19, d19
	fnmacd	d2, d19, d0
	fmacd	d23, d24, d18
	faddd	d7, d25, d26
	fmuld	d2, d2, d30
	fmacd	d22, d23, d18
	fmuld	d17, d2, d20
	fmacd	d21, d22, d18
	fmacd	d17, d2, d19
	fmuld	d30, d28, d21
	faddd	d24, d17, d30
	faddd	d7, d7, d24
	fmsr	s14, r2	@ int
	fsubd	d23, d7, d26
	fmuld	d22, d2, d7
	fsubd	d31, d23, d25
	fmuld	d21, d19, d7
	fsubd	d26, d24, d31
	fmacd	d22, d20, d26
	faddd	d4, d21, d22
	fmsr	s8, r2	@ int
	fsubd	d0, d4, d21
	fmuld	d3, d4, d3
	fsubd	d20, d22, d0
	fmuld	d5, d4, d5
	fmacd	d3, d20, d6
	faddd	d6, d29, d5
	faddd	d7, d6, d3
	fmsr	s14, r2	@ int
	fcpyd	d18, d7
	fsubd	d29, d18, d29
	fmuld	d28, d18, d1
	fsubd	d1, d29, d5
	fsubd	d19, d3, d1
	fmuld	d16, d16, d19
	fmacd	d16, d18, d27
	b	.L96
.L112:
	.align	3
.L111:
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
	.word	1137692678
	.word	1045233131
	.word	-600177667
	.word	1072613129
	.word	-536870912
	.word	1072613129
	.word	1073741824
	.word	1071822851
	.word	212364345
	.word	-1105175455
	.word	-17155601
	.word	1072049730
	.word	1431655742
	.word	1069897045
	.word	381599123
	.word	1063698796
	.word	1925096656
	.word	1046886249
	.word	-1356472788
	.word	1058100842
	.word	-976065551
	.word	1052491073
	.word	0
	.word	1072049731
	.word	0
	.word	0
	.word	-2013235812
	.word	2117592124
	.word	0
	.word	1128267776
.L75:
	mov	r3, r2
.L28:
	fmrrd	r0, r1, d27
	mov	r0, #0
	fldd	d21, .L111+88
	fmdrr	d17, r0, r1
	fldd	d26, .L111+96
	fldd	d4, .L111+144
	fsubd	d20, d17, d28
	fmuld	d5, d17, d21
	fldd	d0, .L111+120
	fsubd	d29, d16, d20
	fmuld	d18, d17, d4
	fldd	d3, .L111+136
	fmacd	d5, d29, d26
	fldd	d6, .L111+128
	fldd	d28, .L111+112
	fldd	d1, .L111+104
	fconstd	d27, #0
	fconstd	d16, #112
	faddd	d25, d18, d5
	fmuld	d19, d25, d25
	fcpyd	d24, d25
	fsubd	d2, d25, d18
	fsubd	d30, d5, d2
	fmscd	d3, d19, d0
	fmacd	d30, d25, d30
	fmacd	d6, d3, d19
	fmscd	d28, d6, d19
	fmacd	d1, d28, d19
	fnmacd	d24, d1, d19
	fmuld	d23, d25, d24
	fsubd	d7, d24, d27
	fdivd	d22, d23, d7
	fsubd	d21, d22, d30
	fsubd	d26, d21, d25
	fsubd	d4, d16, d26
	fmrrd	r0, r1, d4
	add	r0, r3, r1
	cmp	r0, #1048576
	blt	.L31
	fmrrd	r2, r3, d4
	mov	r3, r0
	fmdrr	d16, r2, r3
.L9:
	fmrrd	r0, r1, d16
	b	.L1
.L2:
	cmp	r7, #0
	beq	.L73
	mov	ip, #0
	movt	ip, 32752
	cmp	r6, ip
	bgt	.L10
	beq	.L99
.L11:
	mov	ip, #0
	movt	ip, 32752
	cmp	r7, ip
	beq	.L100
	mov	ip, #0
	movt	ip, 16368
	cmp	r3, ip
	beq	.L87
	cmp	r3, #1073741824
	beq	.L101
	mov	ip, #0
	movt	ip, 16336
	cmp	r3, ip
	beq	.L102
	mov	ip, #0
	movt	ip, 16352
	cmp	r3, ip
	beq	.L103
	mov	ip, #0
	movt	ip, 49136
	cmp	r3, ip
	beq	.L104
.L18:
	movw	ip, #65534
	movt	ip, 32751
	sub	r8, r5, #1
	cmp	r8, ip
	bhi	.L3
.L23:
	mov	ip, #0
	movt	ip, 17392
	cmp	r7, ip
	bgt	.L4
	cmp	r6, #1048576
	blt	.L5
	mov	r3, r6, asr #20
	fmdrr	d18, r0, r1
	sub	r4, r3, #1020
	sub	ip, r4, #3
.L25:
	movw	r0, #46713
	ubfx	r6, r6, #0, #20
	movt	r0, 11
	cmp	r6, r0
	orr	r2, r6, #1069547520
	orr	r4, r2, #3145728
	bgt	.L6
	fmrrd	r2, r3, d18
	movw	r3, #39054
	movt	r3, 3
	cmp	r6, r3
	mov	r3, r4
	fmdrr	d0, r2, r3
	bgt	.L7
	b	.L8
.L87:
	fmdrr	d16, r0, r1
	b	.L9
.L73:
	fconstd	d16, #112
	b	.L9
.L103:
	cmp	r5, #0
	blt	.L18
	fmdrr	d4, r0, r1
	fsqrtd	d16, d4
	fcmpd	d16, d16
	fmstat
	beq	.L9
	bl	sqrt(PLT)
	fmdrr	d16, r0, r1
	b	.L9
.L101:
	fmdrr	d20, r0, r1
	fmuld	d16, d20, d20
	b	.L9
.L102:
	cmp	r5, #0
	blt	.L18
	fmdrr	d0, r0, r1
	fsqrtd	d3, d0
	fcmpd	d3, d3
	fmstat
	bne	.L105
.L19:
	fsqrtd	d16, d3
	fcmpd	d16, d16
	fmstat
	beq	.L9
	fmrrd	r0, r1, d3
	bl	sqrt(PLT)
	fmdrr	d16, r0, r1
	b	.L9
.L105:
	bl	sqrt(PLT)
	fmdrr	d3, r0, r1
	b	.L19
.L99:
	cmp	r0, #0
	beq	.L11
.L10:
	fmdrr	d6, r0, r1
	faddd	d16, d16, d6
	b	.L9
.L104:
	fmdrr	d17, r0, r1
	fconstd	d16, #112
	fdivd	d16, d16, d17
	b	.L9
.L100:
	add	r1, r6, #-1073741824
	add	r2, r1, #1048576
	orrs	r1, r2, r4
	fsubdeq	d16, d16, d16
	beq	.L9
	movw	ip, #65535
	movt	ip, 16367
	cmp	r6, ip
	ble	.L14
	cmp	r3, #0
	bge	.L9
.L15:
	fldd	d16, .L111+152
	b	.L9
.L14:
	cmp	r3, #0
	bge	.L15
.L93:
	fnegd	d16, d16
	b	.L9
.L3:
	cmp	r5, #0
	bne	.L4
	cmp	r4, #0
	bne	.L23
.L4:
	mov	ip, #0
	movt	ip, 32752
	cmp	r6, ip
	bgt	.L10
	beq	.L106
.L38:
	mov	ip, #0
	movt	ip, 32752
	cmp	r7, ip
	bgt	.L10
	beq	.L107
.L39:
	cmp	r5, #0
	blt	.L108
.L80:
	mov	ip, #0
.L40:
	cmp	r6, #0
	bne	.L42
	cmp	r4, #0
	bne	.L43
	cmp	r3, #0
	fmdrrge	d17, r0, r1
	fabsdge	d16, d17
	bge	.L47
	fmdrr	d19, r0, r1
	fconstd	d4, #112
	fabsd	d3, d19
	fdivd	d16, d4, d3
.L47:
	cmp	ip, #1
	bne	.L9
	b	.L93
.L43:
	cmp	r5, #0
	blt	.L109
	add	ip, r7, #-1140850688
	add	r2, ip, #1048576
	cmn	r2, #-1006632959
	bhi	.L15
	fmdrr	d3, r0, r1
	fconstd	d2, #112
	fcmpd	d3, d2
	fmstat
	beq	.L87
	movw	r0, #65535
	movt	r0, 16367
	cmp	r6, r0
	bgt	.L70
	cmp	r3, #0
	bge	.L15
.L71:
	fldd	d17, .L111+160
	fmuld	d16, d17, d17
	b	.L9
.L42:
	mov	r8, #0
	movt	r8, 32752
	cmp	r6, r8
	bne	.L43
	cmp	r3, #0
	fmdrrge	d4, r0, r1
	fabsdge	d16, d4
	bge	.L47
	fmdrr	d19, r0, r1
	fconstd	d1, #112
	fabsd	d0, d19
	fdivd	d16, d1, d0
	b	.L47
.L70:
	cmp	r3, #0
	bgt	.L71
	b	.L15
.L109:
	cmp	ip, #0
	beq	.L110
	fconstd	d5, #240
	fconstd	d8, #112
	cmp	ip, #1
	mov	ip, #0
	movt	ip, 17392
	fcpydeq	d8, d5
	cmp	r7, ip
	bgt	.L51
	fmdrr	d7, r0, r1
	cmp	r6, #1048576
	fabsd	d20, d7
	bge	.L52
	fldd	d21, .L111+168
	fmuld	d20, d20, d21
	fmrrd	r2, r3, d20
	mov	r6, r3, asr #20
	sub	r0, r6, #1072
	sub	r1, r0, #4
	mov	r6, r3
.L53:
	movw	r2, #46713
	ubfx	r6, r6, #0, #20
	movt	r2, 11
	cmp	r6, r2
	orr	ip, r6, #1069547520
	orr	r4, ip, #3145728
	fmrrd	r2, r3, d20
	ble	.L54
	sub	r3, r4, #1048576
	add	r1, r1, #1
	fmdrr	d27, r2, r3
.L55:
	fconstd	d2, #112
	fldd	d0, .L113
	faddd	d18, d27, d2
	fsubd	d1, d27, d2
	fldd	d30, .L113+8
	fdivd	d21, d2, d18
	fmrrd	r2, r3, d18
	mov	r2, #0
	fcpyd	d4, d1
	fmdrr	d31, r2, r3
	fldd	d24, .L113+16
	fldd	d22, .L113+24
	fsubd	d5, d31, d2
	fmsr	s5, r1	@ int
	fldd	d23, .L113+32
	fsubd	d7, d27, d5
	fsitod	d25, s5
	fldd	d20, .L113+40
	fconstd	d29, #8
	fldd	d28, .L113+48
	fldd	d3, .L113+56
	fldd	d27, .L113+64
	fmuld	d19, d1, d21
	fmuld	d17, d19, d19
	fmrrd	r0, r1, d19
	mov	r0, r2
	fmdrr	d26, r0, r1
	fmacd	d30, d17, d0
	fnmacd	d4, d26, d31
	fmuld	d6, d17, d17
	fmacd	d24, d30, d17
	fcpyd	d2, d4
	fmuld	d0, d26, d26
	fnmacd	d2, d26, d7
	fmacd	d22, d24, d17
	faddd	d18, d0, d29
	fmuld	d1, d2, d21
	fmacd	d23, d22, d17
	fmuld	d30, d1, d19
	fmacd	d20, d23, d17
	fmacd	d30, d1, d26
	fmuld	d21, d6, d20
	faddd	d24, d30, d21
	faddd	d7, d18, d24
	fmsr	s14, r2	@ int
	fcpyd	d22, d7
	fsubd	d23, d22, d29
	fmuld	d31, d1, d22
	fsubd	d20, d23, d0
	fmuld	d29, d26, d22
	fsubd	d5, d24, d20
	fmacd	d31, d19, d5
	faddd	d7, d29, d31
	fmsr	s14, r2	@ int
	fsubd	d19, d7, d29
	fmuld	d28, d7, d28
	fsubd	d17, d31, d19
	fmuld	d27, d7, d27
	fmacd	d28, d17, d3
	faddd	d3, d25, d27
	faddd	d7, d3, d28
	fmsr	s14, r2	@ int
	fcpyd	d4, d7
	fsubd	d25, d4, d25
	fsubd	d26, d25, d27
	fsubd	d6, d28, d26
.L56:
	fmrrd	r0, r1, d16
	mov	r0, #0
	fmuld	d2, d16, d6
	fmdrr	d0, r0, r1
	mov	r4, #0
	movt	r4, 16352
	fsubd	d16, d16, d0
	fmuld	d18, d0, d4
	fmacd	d2, d16, d4
	faddd	d1, d2, d18
	fmrrd	r2, r3, d1
	bic	ip, r3, #-2147483648
	cmp	ip, r4
	ble	.L85
	movw	r1, #65535
	movt	r1, 16527
	cmp	ip, r1
	ble	.L58
	cmp	r3, r1
	ble	.L59
	add	r0, r3, #-1090519040
	add	r1, r0, #7340032
	orrs	r1, r1, r2
	bne	.L94
	fldd	d24, .L113+176
	fsubd	d22, d1, d18
	faddd	d23, d2, d24
	fcmped	d23, d22
	fmstat
	bgt	.L94
.L58:
	mov	r5, ip, asr #20
	sub	r2, r5, #1020
	sub	r4, r2, #2
	mov	ip, #1048576
	movw	r2, #65535
	add	r0, r3, ip, asr r4
	ubfx	r1, r0, #20, #11
	sub	r5, r1, #1020
	sub	r4, r5, #3
	movt	r2, 15
	rsb	ip, r1, #1040
	bic	r1, r0, r2, asr r4
	mov	r5, r1
	mov	r4, #0
	ubfx	r0, r0, #0, #20
	fmdrr	d31, r4, r5
	cmp	r3, #0
	orr	r2, r0, #1048576
	add	r3, ip, #3
	fsubd	d18, d18, d31
	mov	r2, r2, asr r3
	rsblt	r2, r2, #0
	faddd	d1, d2, d18
.L57:
	fmrrd	r4, r5, d1
	mov	r4, #0
	fldd	d29, .L113+72
	fmdrr	d7, r4, r5
	fldd	d20, .L113+80
	fldd	d5, .L113+88
	fsubd	d17, d7, d18
	fmuld	d19, d7, d29
	fldd	d28, .L113+96
	fsubd	d4, d2, d17
	fmuld	d26, d7, d5
	fldd	d27, .L113+104
	fmacd	d19, d4, d20
	fldd	d3, .L113+112
	fldd	d6, .L113+120
	fldd	d2, .L113+128
	fconstd	d25, #0
	fconstd	d0, #112
	faddd	d16, d26, d19
	fmuld	d1, d16, d16
	fcpyd	d21, d16
	fsubd	d18, d16, d26
	fsubd	d30, d19, d18
	fmscd	d27, d1, d28
	fmacd	d30, d16, d30
	fmacd	d3, d27, d1
	fmscd	d6, d3, d1
	fmacd	d2, d6, d1
	fnmacd	d21, d2, d1
	fmuld	d22, d16, d21
	fsubd	d23, d21, d25
	fdivd	d31, d22, d23
	fsubd	d29, d31, d30
	fsubd	d20, d29, d16
	fsubd	d21, d0, d20
	fmrrd	r4, r5, d21
	add	ip, r5, r2, asl #20
	cmp	ip, #1048576
	fmrrdge	r2, r3, d21
	movge	r3, ip
	fmdrrge	d21, r2, r3
	bge	.L91
	fmrrd	r0, r1, d21
	bl	scalbn(PLT)
	fmdrr	d21, r0, r1
.L91:
	fmuld	d16, d8, d21
	b	.L9
.L85:
	mov	r2, r0
	b	.L57
.L54:
	movw	r3, #39054
	movt	r3, 3
	cmp	r6, r3
	mov	r3, r4
	fmdrr	d27, r2, r3
	ble	.L55
	fconstd	d26, #120
	fconstd	d29, #112
	fldd	d18, .L113
	faddd	d22, d27, d26
	fsubd	d23, d27, d26
	fldd	d25, .L113+8
	fdivd	d0, d29, d22
	fmrrd	r2, r3, d22
	fldd	d24, .L113+16
	mov	r2, #0
	fmsr	s11, r1	@ int
	fmdrr	d4, r2, r3
	fldd	d1, .L113+24
	fldd	d21, .L113+32
	fsubd	d31, d4, d26
	fldd	d20, .L113+40
	fconstd	d28, #8
	fsubd	d7, d27, d31
	fsitod	d27, s11
	fldd	d30, .L113+56
	fldd	d3, .L113+48
	fldd	d6, .L113+64
	fldd	d26, .L113+136
	fldd	d2, .L113+144
	faddd	d29, d27, d26
	fmuld	d19, d23, d0
	fmuld	d17, d19, d19
	fmrrd	r0, r1, d19
	mov	r0, r2
	fmacd	d25, d17, d18
	fmdrr	d18, r0, r1
	fmuld	d5, d17, d17
	fnmacd	d23, d18, d4
	fmacd	d24, d25, d17
	fmuld	d25, d18, d18
	fnmacd	d23, d18, d7
	fmacd	d1, d24, d17
	faddd	d24, d25, d28
	fmuld	d23, d23, d0
	fmacd	d21, d1, d17
	fmuld	d22, d23, d19
	fmacd	d20, d21, d17
	fmacd	d22, d23, d18
	fmuld	d0, d5, d20
	faddd	d1, d22, d0
	faddd	d7, d24, d1
	fmsr	s14, r2	@ int
	fsubd	d21, d7, d28
	fmuld	d4, d23, d7
	fsubd	d20, d21, d25
	fmuld	d28, d18, d7
	fsubd	d31, d1, d20
	fmacd	d4, d19, d31
	faddd	d7, d28, d4
	fmsr	s14, r2	@ int
	fsubd	d19, d7, d28
	fmuld	d6, d7, d6
	fsubd	d17, d4, d19
	faddd	d29, d29, d6
	fmuld	d30, d17, d30
	fmacd	d30, d7, d3
	faddd	d3, d30, d2
	faddd	d7, d29, d3
	fmsr	s14, r2	@ int
	fcpyd	d4, d7
	fsubd	d7, d4, d27
	fsubd	d27, d7, d26
	fsubd	d26, d27, d6
	fsubd	d6, d3, d26
	b	.L56
.L52:
	mov	r3, r6, asr #20
	sub	r4, r3, #1020
	sub	r1, r4, #3
	b	.L53
.L114:
	.align	3
.L113:
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
	.word	212364345
	.word	-1105175455
	.word	-17155601
	.word	1072049730
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
	.word	-1023872167
	.word	27618847
	.word	-2013235812
	.word	2117592124
	.word	0
	.word	1128267776
	.word	1697350398
	.word	1016534343
.L51:
	add	r2, r7, #-1140850688
	add	ip, r2, #1048576
	cmn	ip, #-1006632959
	bhi	.L15
	fmdrr	d6, r0, r1
	fcmpd	d6, d5
	fmstat
	fcpydeq	d16, d8
	beq	.L9
	movw	r1, #65535
	movt	r1, 16367
	cmp	r6, r1
	bgt	.L67
	cmp	r3, #0
	blt	.L94
.L68:
	fldd	d21, .L113+152
	fmuld	d8, d8, d21
	b	.L91
.L110:
	fmdrr	d7, r0, r1
	fsubd	d27, d7, d7
	fdivd	d16, d27, d27
	b	.L9
.L67:
	cmp	r3, #0
	ble	.L68
.L94:
	fldd	d5, .L113+160
	fmuld	d8, d8, d5
	fmuld	d16, d8, d5
	b	.L9
.L59:
	movw	r0, #52223
	movt	r0, 16528
	cmp	ip, r0
	ble	.L58
	add	r1, r3, #1061158912
	add	r0, r1, #3080192
	add	r1, r0, #13312
	orrs	r1, r1, r2
	bne	.L68
	fsubd	d30, d1, d18
	fcmped	d2, d30
	fmstat
	bhi	.L58
	b	.L68
.L108:
	movw	ip, #65535
	movt	ip, 17215
	cmp	r7, ip
	movgt	ip, #2
	bgt	.L40
	movw	ip, #65535
	movt	ip, 16367
	cmp	r7, ip
	ble	.L80
	mov	ip, r7, asr #20
	movw	r8, #1043
	cmp	ip, r8
	ble	.L41
	rsb	ip, ip, #1072
	add	r8, ip, #3
	mov	ip, r2, lsr r8
	cmp	r2, ip, asl r8
	bne	.L80
.L90:
	and	r2, ip, #1
	rsb	ip, r2, #2
	b	.L40
.L107:
	cmp	r2, #0
	beq	.L39
	b	.L10
.L41:
	cmp	r2, #0
	bne	.L80
	rsb	r8, ip, #1040
	add	r8, r8, #3
	mov	ip, r7, asr r8
	cmp	r7, ip, asl r8
	movne	ip, r2
	bne	.L40
	b	.L90
.L106:
	cmp	r4, #0
	beq	.L38
	b	.L10
.L5:
	fmdrr	d6, r0, r1
	fldd	d26, .L113+168
	fmuld	d18, d6, d26
	fmrrd	r2, r3, d18
	mov	r6, r3, asr #20
	sub	r1, r6, #1072
	sub	ip, r1, #4
	mov	r6, r3
	b	.L25
.L31:
	fmrrd	r0, r1, d4
	fldmfdd	sp!, {d8}
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	scalbn(PLT)
.L29:
	cmp	ip, r1
	ble	.L32
	add	r2, ip, #-1090519040
	add	r3, r2, #7340032
	orrs	r3, r3, r0
	bne	.L71
	fldd	d31, .L113+176
	fsubd	d23, d27, d28
	faddd	d7, d16, d31
	fcmped	d7, d23
	fmstat
	bgt	.L71
.L35:
	mov	r0, r4, asr #20
	sub	r4, r0, #1020
	sub	r5, r4, #2
	mov	r1, #1048576
	movw	r4, #65535
	add	r2, ip, r1, asr r5
	ubfx	r3, r2, #20, #11
	sub	r0, r3, #1020
	sub	r1, r0, #3
	movt	r4, 15
	rsb	r5, r3, #1040
	bic	r3, r2, r4, asr r1
	ubfx	r2, r2, #0, #20
	cmp	ip, #0
	orr	r4, r2, #1048576
	add	ip, r5, #3
	mov	r1, r3
	mov	r0, #0
	mov	r2, r4, asr ip
	fmdrr	d22, r0, r1
	blt	.L30
.L36:
	fsubd	d28, d28, d22
	mov	r3, r2, asl #20
	faddd	d27, d16, d28
	b	.L28
.L30:
	rsb	r2, r2, #0
	b	.L36
.L32:
	movw	r2, #52223
	movt	r2, 16528
	cmp	r4, r2
	ble	.L35
	mov	r3, #13312
	movt	r3, 16239
	add	r1, ip, r3
	orrs	r3, r1, r0
	bne	.L15
	fsubd	d24, d27, d28
	fcmped	d16, d24
	fmstat
	bhi	.L35
	b	.L15
	.fnend
	.size	pow, .-pow
	.ident	"GCC: (crosstool-NG linaro-1.13.1-4.7-2012.10-20121022 - Linaro GCC 2012.10) 4.7.3 20121001 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
