	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"proyect.cpp"
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,4
	.global	gpio17
	.bss
	.align	2
	.type	gpio17, %object
	.size	gpio17, 4
gpio17:
	.space	4
	.global	gpio27
	.align	2
	.type	gpio27, %object
	.size	gpio27, 4
gpio27:
	.space	4
	.global	inputstate
	.align	2
	.type	inputstate, %object
	.size	inputstate, 4
inputstate:
	.space	4
	.global	duty
	.data
	.align	2
	.type	duty, %object
	.size	duty, 4
duty:
	.word	255
	.section	.rodata
	.align	2
.LC0:
	.ascii	" centimetros.\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	.fnstart
.LFB1020:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	mov	r3, #0
	str	r3, [fp, #-12]	@ float
	bl	_Z10initialisev
	bl	gpioInitialise
	mov	r0, #22
	mov	r1, #1
	bl	gpioSetMode
	mov	r0, #23
	mov	r1, #1
	bl	gpioSetMode
	mov	r0, #24
	mov	r1, #1
	bl	gpioSetMode
	mov	r0, #22
	mov	r1, #50
	bl	gpioSetPWMfrequency
	mov	r0, #22
	mov	r1, #260
	bl	gpioSetPWMrange
	mov	r0, #22
	mov	r1, #0
	bl	gpioPWM
	mov	r0, #23
	mov	r1, #1
	bl	gpioWrite
	mov	r0, #24
	mov	r1, #0
	bl	gpioWrite
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L15:
	bl	_Z7measurev
	fcpys	s15, s0
	fsts	s15, [fp, #-12]
	ldr	r0, .L25+24
	flds	s0, [fp, #-12]
	bl	_ZNSolsEf
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L25+28
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L25+32
	bl	_ZNSolsEPFRSoS_E
	mov	r0, #1
	bl	sleep
	mov	r3, #0
	str	r3, [fp, #-8]
	flds	s15, [fp, #-12]
	fcmpezs	s15
	fmstat
	blt	.L3
	flds	s15, [fp, #-12]
	flds	s14, .L25
	fcmpes	s15, s14
	fmstat
	bpl	.L3
	flds	s15, [fp, #-12]
	flds	s14, .L25+4
	fcmpes	s15, s14
	fmstat
	ble	.L6
	mov	r0, #23
	mov	r1, #1
	bl	gpioWrite
	mov	r0, #24
	mov	r1, #0
	bl	gpioWrite
	flds	s15, [fp, #-12]
	flds	s14, .L25+8
	fsubs	s15, s15, s14
	flds	s14, .L25+12
	fmuls	s15, s15, s14
	ftouizs	s15, s15
	mov	r0, #22
	fmrs	r1, s15	@ int
	bl	gpioPWM
.L6:
	flds	s15, [fp, #-12]
	flds	s14, .L25+4
	fcmpes	s15, s14
	fmstat
	bhi	.L8
	flds	s15, [fp, #-12]
	flds	s14, .L25+16
	fcmpes	s15, s14
	fmstat
	blt	.L8
	mov	r0, #23
	mov	r1, #0
	bl	gpioWrite
	mov	r0, #24
	mov	r1, #0
	bl	gpioWrite
	mov	r0, #22
	mov	r1, #0
	bl	gpioPWM
.L8:
	flds	s15, [fp, #-12]
	flds	s14, .L25+20
	fcmpes	s15, s14
	fmstat
	ble	.L11
	flds	s15, [fp, #-12]
	flds	s14, .L25+16
	fcmpes	s15, s14
	fmstat
	bpl	.L11
	mov	r0, #23
	mov	r1, #0
	bl	gpioWrite
	mov	r0, #24
	mov	r1, #1
	bl	gpioWrite
	flds	s15, [fp, #-12]
	flds	s14, .L25+20
	fsubs	s15, s15, s14
	flds	s14, .L25+12
	fmuls	s15, s15, s14
	ftouizs	s15, s15
	mov	r0, #22
	fmrs	r1, s15	@ int
	bl	gpioPWM
.L11:
	flds	s15, [fp, #-12]
	flds	s14, .L25+20
	fcmpes	s15, s14
	fmstat
	bhi	.L3
	mov	r0, #23
	mov	r1, #0
	bl	gpioWrite
	mov	r0, #24
	mov	r1, #0
	bl	gpioWrite
	mov	r0, #22
	mov	r1, #0
	bl	gpioPWM
.L3:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #24
	ble	.L15
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L26:
	.align	2
.L25:
	.word	1114636288
	.word	1105723392
	.word	1106247680
	.word	1095761920
	.word	1104150528
	.word	1084227584
	.word	_ZSt4cout
	.word	.LC0
	.word	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	.fnend
	.size	main, .-main
	.section	.rodata
	.align	2
.LC1:
	.ascii	"in\000"
	.align	2
.LC2:
	.ascii	"out\000"
	.text
	.align	2
	.global	_Z10initialisev
	.type	_Z10initialisev, %function
_Z10initialisev:
	.fnstart
.LFB1021:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	.save {r4, fp, lr}
	.setfp fp, sp, #8
	add	fp, sp, #8
	.pad #20
	sub	sp, sp, #20
	ldr	r3, .L37
	ldr	r3, [r3]
	mov	r0, r3
.LEHB0:
	bl	_ZN9GPIOClass11export_gpioEv
	ldr	r3, .L37+4
	ldr	r3, [r3]
	mov	r0, r3
	bl	_ZN9GPIOClass11export_gpioEv
.LEHE0:
	ldr	r3, .L37
	ldr	r4, [r3]
	sub	r3, fp, #24
	mov	r0, r3
	bl	_ZNSaIcEC1Ev
	sub	r2, fp, #28
	sub	r3, fp, #24
	mov	r0, r2
	ldr	r1, .L37+8
	mov	r2, r3
.LEHB1:
	bl	_ZNSsC1EPKcRKSaIcE
.LEHE1:
	sub	r3, fp, #28
	mov	r0, r4
	mov	r1, r3
.LEHB2:
	bl	_ZN9GPIOClass11setdir_gpioESs
.LEHE2:
	sub	r3, fp, #28
	mov	r0, r3
.LEHB3:
	bl	_ZNSsD1Ev
.LEHE3:
	sub	r3, fp, #24
	mov	r0, r3
	bl	_ZNSaIcED1Ev
	ldr	r3, .L37+4
	ldr	r4, [r3]
	sub	r3, fp, #16
	mov	r0, r3
	bl	_ZNSaIcEC1Ev
	sub	r2, fp, #20
	sub	r3, fp, #16
	mov	r0, r2
	ldr	r1, .L37+12
	mov	r2, r3
.LEHB4:
	bl	_ZNSsC1EPKcRKSaIcE
.LEHE4:
	sub	r3, fp, #20
	mov	r0, r4
	mov	r1, r3
.LEHB5:
	bl	_ZN9GPIOClass11setdir_gpioESs
.LEHE5:
	sub	r3, fp, #20
	mov	r0, r3
.LEHB6:
	bl	_ZNSsD1Ev
.LEHE6:
	sub	r3, fp, #16
	mov	r0, r3
	bl	_ZNSaIcED1Ev
	b	.L36
.L33:
	sub	r3, fp, #28
	mov	r0, r3
	bl	_ZNSsD1Ev
	b	.L29
.L32:
.L29:
	sub	r3, fp, #24
	mov	r0, r3
	bl	_ZNSaIcED1Ev
.LEHB7:
	bl	__cxa_end_cleanup
.LEHE7:
.L35:
	sub	r3, fp, #20
	mov	r0, r3
	bl	_ZNSsD1Ev
	b	.L31
.L34:
.L31:
	sub	r3, fp, #16
	mov	r0, r3
	bl	_ZNSaIcED1Ev
.LEHB8:
	bl	__cxa_end_cleanup
.LEHE8:
.L36:
	sub	sp, fp, #8
	@ sp needed
	ldmfd	sp!, {r4, fp, pc}
.L38:
	.align	2
.L37:
	.word	gpio17
	.word	gpio27
	.word	.LC1
	.word	.LC2
	.global	__gxx_personality_v0
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA1021:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1021-.LLSDACSB1021
.LLSDACSB1021:
	.uleb128 .LEHB0-.LFB1021
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB1021
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L32-.LFB1021
	.uleb128 0
	.uleb128 .LEHB2-.LFB1021
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L33-.LFB1021
	.uleb128 0
	.uleb128 .LEHB3-.LFB1021
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L32-.LFB1021
	.uleb128 0
	.uleb128 .LEHB4-.LFB1021
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L34-.LFB1021
	.uleb128 0
	.uleb128 .LEHB5-.LFB1021
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L35-.LFB1021
	.uleb128 0
	.uleb128 .LEHB6-.LFB1021
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L34-.LFB1021
	.uleb128 0
	.uleb128 .LEHB7-.LFB1021
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB8-.LFB1021
	.uleb128 .LEHE8-.LEHB8
	.uleb128 0
	.uleb128 0
.LLSDACSE1021:
	.text
	.fnend
	.size	_Z10initialisev, .-_Z10initialisev
	.section	.rodata
	.align	2
.LC3:
	.ascii	"1\000"
	.align	2
.LC4:
	.ascii	"0\000"
	.text
	.align	2
	.global	_Z7measurev
	.type	_Z7measurev, %function
_Z7measurev:
	.fnstart
.LFB1022:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	.save {r4, fp, lr}
	.setfp fp, sp, #8
	add	fp, sp, #8
	.pad #44
	sub	sp, sp, #44
	mov	r0, #0
.LEHB9:
	bl	sleep
.LEHE9:
	ldr	r3, .L54
	ldr	r4, [r3]
	sub	r3, fp, #28
	mov	r0, r3
	bl	_ZNSaIcEC1Ev
	sub	r2, fp, #32
	sub	r3, fp, #28
	mov	r0, r2
	ldr	r1, .L54+4
	mov	r2, r3
.LEHB10:
	bl	_ZNSsC1EPKcRKSaIcE
.LEHE10:
	sub	r3, fp, #32
	mov	r0, r4
	mov	r1, r3
.LEHB11:
	bl	_ZN9GPIOClass11setval_gpioESs
.LEHE11:
	sub	r3, fp, #32
	mov	r0, r3
.LEHB12:
	bl	_ZNSsD1Ev
.LEHE12:
	sub	r3, fp, #28
	mov	r0, r3
	bl	_ZNSaIcED1Ev
	mov	r0, #10
.LEHB13:
	bl	usleep
.LEHE13:
	ldr	r3, .L54
	ldr	r4, [r3]
	sub	r3, fp, #20
	mov	r0, r3
	bl	_ZNSaIcEC1Ev
	sub	r2, fp, #24
	sub	r3, fp, #20
	mov	r0, r2
	ldr	r1, .L54+8
	mov	r2, r3
.LEHB14:
	bl	_ZNSsC1EPKcRKSaIcE
.LEHE14:
	sub	r3, fp, #24
	mov	r0, r4
	mov	r1, r3
.LEHB15:
	bl	_ZN9GPIOClass11setval_gpioESs
.LEHE15:
	sub	r3, fp, #24
	mov	r0, r3
.LEHB16:
	bl	_ZNSsD1Ev
.LEHE16:
	sub	r3, fp, #20
	mov	r0, r3
	bl	_ZNSaIcED1Ev
	ldr	r3, .L54+12
	ldr	r3, [r3]
	mov	r0, r3
	ldr	r1, .L54+16
.LEHB17:
	bl	_ZN9GPIOClass11getval_gpioERSs
	b	.L40
.L41:
	ldr	r3, .L54+12
	ldr	r3, [r3]
	mov	r0, r3
	ldr	r1, .L54+16
	bl	_ZN9GPIOClass11getval_gpioERSs
	sub	r3, fp, #48
	mov	r0, r3
	mov	r1, #0
	bl	gettimeofday
.L40:
	ldr	r0, .L54+16
	ldr	r1, .L54+8
	bl	_ZSteqIcSt11char_traitsIcESaIcEEbRKSbIT_T0_T1_EPKS3_
	mov	r3, r0
	cmp	r3, #0
	bne	.L41
	b	.L42
.L43:
	ldr	r3, .L54+12
	ldr	r3, [r3]
	mov	r0, r3
	ldr	r1, .L54+16
	bl	_ZN9GPIOClass11getval_gpioERSs
	sub	r3, fp, #40
	mov	r0, r3
	mov	r1, #0
	bl	gettimeofday
.L42:
	ldr	r0, .L54+16
	ldr	r1, .L54+4
	bl	_ZSteqIcSt11char_traitsIcESaIcEEbRKSbIT_T0_T1_EPKS3_
.LEHE17:
	mov	r3, r0
	cmp	r3, #0
	bne	.L43
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-44]
	rsb	r3, r3, r2
	ldr	r2, .L54+20
	mul	r3, r2, r3
	ldr	r2, .L54+24
	smull	r1, r2, r2, r3
	mov	r2, r2, asr #18
	mov	r3, r3, asr #31
	rsb	r3, r3, r2
	fmsr	s15, r3	@ int
	fsitos	s15, s15
	fsts	s15, [fp, #-16]
	ldr	r3, [fp, #-16]	@ float
	fmsr	s15, r3
	b	.L53
.L50:
	sub	r3, fp, #32
	mov	r0, r3
	bl	_ZNSsD1Ev
	b	.L46
.L49:
.L46:
	sub	r3, fp, #28
	mov	r0, r3
	bl	_ZNSaIcED1Ev
.LEHB18:
	bl	__cxa_end_cleanup
.LEHE18:
.L52:
	sub	r3, fp, #24
	mov	r0, r3
	bl	_ZNSsD1Ev
	b	.L48
.L51:
.L48:
	sub	r3, fp, #20
	mov	r0, r3
	bl	_ZNSaIcED1Ev
.LEHB19:
	bl	__cxa_end_cleanup
.LEHE19:
.L53:
	fcpys	s0, s15
	sub	sp, fp, #8
	@ sp needed
	ldmfd	sp!, {r4, fp, pc}
.L55:
	.align	2
.L54:
	.word	gpio27
	.word	.LC3
	.word	.LC4
	.word	gpio17
	.word	inputstate
	.word	17150
	.word	1125899907
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA1022:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1022-.LLSDACSB1022
.LLSDACSB1022:
	.uleb128 .LEHB9-.LFB1022
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB10-.LFB1022
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L49-.LFB1022
	.uleb128 0
	.uleb128 .LEHB11-.LFB1022
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L50-.LFB1022
	.uleb128 0
	.uleb128 .LEHB12-.LFB1022
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L49-.LFB1022
	.uleb128 0
	.uleb128 .LEHB13-.LFB1022
	.uleb128 .LEHE13-.LEHB13
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB14-.LFB1022
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L51-.LFB1022
	.uleb128 0
	.uleb128 .LEHB15-.LFB1022
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L52-.LFB1022
	.uleb128 0
	.uleb128 .LEHB16-.LFB1022
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L51-.LFB1022
	.uleb128 0
	.uleb128 .LEHB17-.LFB1022
	.uleb128 .LEHE17-.LEHB17
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB18-.LFB1022
	.uleb128 .LEHE18-.LEHB18
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB19-.LFB1022
	.uleb128 .LEHE19-.LEHB19
	.uleb128 0
	.uleb128 0
.LLSDACSE1022:
	.text
	.fnend
	.size	_Z7measurev, .-_Z7measurev
	.section	.text._ZSteqIcSt11char_traitsIcESaIcEEbRKSbIT_T0_T1_EPKS3_,"axG",%progbits,_ZSteqIcSt11char_traitsIcESaIcEEbRKSbIT_T0_T1_EPKS3_,comdat
	.align	2
	.weak	_ZSteqIcSt11char_traitsIcESaIcEEbRKSbIT_T0_T1_EPKS3_
	.type	_ZSteqIcSt11char_traitsIcESaIcEEbRKSbIT_T0_T1_EPKS3_, %function
_ZSteqIcSt11char_traitsIcESaIcEEbRKSbIT_T0_T1_EPKS3_:
	.fnstart
.LFB1042:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	_ZNKSs7compareEPKc
	mov	r3, r0
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_ZSteqIcSt11char_traitsIcESaIcEEbRKSbIT_T0_T1_EPKS3_, .-_ZSteqIcSt11char_traitsIcESaIcEEbRKSbIT_T0_T1_EPKS3_
	.section	.rodata
	.align	2
.LC5:
	.ascii	"17\000"
	.align	2
.LC6:
	.ascii	"27\000"
	.text
	.align	2
	.type	_Z41__static_initialization_and_destruction_0ii, %function
_Z41__static_initialization_and_destruction_0ii:
	.fnstart
.LFB1070:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	.save {r4, r5, fp, lr}
	.setfp fp, sp, #12
	add	fp, sp, #12
	.pad #24
	sub	sp, sp, #24
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L72
	ldr	r3, [fp, #-36]
	ldr	r2, .L73
	cmp	r3, r2
	bne	.L72
	ldr	r0, .L73+4
.LEHB20:
	bl	_ZNSt8ios_base4InitC1Ev
.LEHE20:
	ldr	r0, .L73+4
	ldr	r1, .L73+8
	ldr	r2, .L73+12
	bl	__aeabi_atexit
	sub	r3, fp, #24
	mov	r0, r3
	bl	_ZNSaIcEC1Ev
	sub	r2, fp, #28
	sub	r3, fp, #24
	mov	r0, r2
	ldr	r1, .L73+16
	mov	r2, r3
.LEHB21:
	bl	_ZNSsC1EPKcRKSaIcE
.LEHE21:
	sub	r5, fp, #28
	mov	r0, #4
.LEHB22:
	bl	_Znwj
.LEHE22:
	mov	r4, r0
	mov	r0, r4
	mov	r1, r5
.LEHB23:
	bl	_ZN9GPIOClassC1ESs
.LEHE23:
	ldr	r3, .L73+20
	str	r4, [r3]
	sub	r3, fp, #28
	mov	r0, r3
.LEHB24:
	bl	_ZNSsD1Ev
.LEHE24:
	sub	r3, fp, #24
	mov	r0, r3
	bl	_ZNSaIcED1Ev
	sub	r3, fp, #16
	mov	r0, r3
	bl	_ZNSaIcEC1Ev
	sub	r2, fp, #20
	sub	r3, fp, #16
	mov	r0, r2
	ldr	r1, .L73+24
	mov	r2, r3
.LEHB25:
	bl	_ZNSsC1EPKcRKSaIcE
.LEHE25:
	sub	r5, fp, #20
	mov	r0, #4
.LEHB26:
	bl	_Znwj
.LEHE26:
	mov	r4, r0
	mov	r0, r4
	mov	r1, r5
.LEHB27:
	bl	_ZN9GPIOClassC1ESs
.LEHE27:
	ldr	r3, .L73+28
	str	r4, [r3]
	sub	r3, fp, #20
	mov	r0, r3
.LEHB28:
	bl	_ZNSsD1Ev
.LEHE28:
	sub	r3, fp, #16
	mov	r0, r3
	bl	_ZNSaIcED1Ev
	ldr	r0, .L73+32
.LEHB29:
	bl	_ZNSsC1Ev
.LEHE29:
	ldr	r0, .L73+32
	ldr	r1, .L73+36
	ldr	r2, .L73+12
	bl	__aeabi_atexit
	b	.L72
.L68:
	mov	r0, r4
	bl	_ZdlPv
	b	.L61
.L67:
.L61:
	sub	r3, fp, #28
	mov	r0, r3
	bl	_ZNSsD1Ev
	b	.L62
.L66:
.L62:
	sub	r3, fp, #24
	mov	r0, r3
	bl	_ZNSaIcED1Ev
.LEHB30:
	bl	__cxa_end_cleanup
.LEHE30:
.L71:
	mov	r0, r4
	bl	_ZdlPv
	b	.L64
.L70:
.L64:
	sub	r3, fp, #20
	mov	r0, r3
	bl	_ZNSsD1Ev
	b	.L65
.L69:
.L65:
	sub	r3, fp, #16
	mov	r0, r3
	bl	_ZNSaIcED1Ev
.LEHB31:
	bl	__cxa_end_cleanup
.LEHE31:
.L72:
	sub	sp, fp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, fp, pc}
.L74:
	.align	2
.L73:
	.word	65535
	.word	_ZStL8__ioinit
	.word	_ZNSt8ios_base4InitD1Ev
	.word	__dso_handle
	.word	.LC5
	.word	gpio17
	.word	.LC6
	.word	gpio27
	.word	inputstate
	.word	_ZNSsD1Ev
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA1070:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1070-.LLSDACSB1070
.LLSDACSB1070:
	.uleb128 .LEHB20-.LFB1070
	.uleb128 .LEHE20-.LEHB20
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB21-.LFB1070
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L66-.LFB1070
	.uleb128 0
	.uleb128 .LEHB22-.LFB1070
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L67-.LFB1070
	.uleb128 0
	.uleb128 .LEHB23-.LFB1070
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L68-.LFB1070
	.uleb128 0
	.uleb128 .LEHB24-.LFB1070
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L66-.LFB1070
	.uleb128 0
	.uleb128 .LEHB25-.LFB1070
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L69-.LFB1070
	.uleb128 0
	.uleb128 .LEHB26-.LFB1070
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L70-.LFB1070
	.uleb128 0
	.uleb128 .LEHB27-.LFB1070
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L71-.LFB1070
	.uleb128 0
	.uleb128 .LEHB28-.LFB1070
	.uleb128 .LEHE28-.LEHB28
	.uleb128 .L69-.LFB1070
	.uleb128 0
	.uleb128 .LEHB29-.LFB1070
	.uleb128 .LEHE29-.LEHB29
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB30-.LFB1070
	.uleb128 .LEHE30-.LEHB30
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB31-.LFB1070
	.uleb128 .LEHE31-.LEHB31
	.uleb128 0
	.uleb128 0
.LLSDACSE1070:
	.text
	.fnend
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.align	2
	.type	_GLOBAL__sub_I_gpio17, %function
_GLOBAL__sub_I_gpio17:
	.fnstart
.LFB1071:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	mov	r0, #1
	ldr	r1, .L76
	bl	_Z41__static_initialization_and_destruction_0ii
	ldmfd	sp!, {fp, pc}
.L77:
	.align	2
.L76:
	.word	65535
	.cantunwind
	.fnend
	.size	_GLOBAL__sub_I_gpio17, .-_GLOBAL__sub_I_gpio17
	.section	.init_array,"aw"
	.align	2
	.word	_GLOBAL__sub_I_gpio17
	.section	.rodata
	.align	2
	.type	_ZZL18__gthread_active_pvE20__gthread_active_ptr, %object
	.size	_ZZL18__gthread_active_pvE20__gthread_active_ptr, 4
_ZZL18__gthread_active_pvE20__gthread_active_ptr:
	.word	_ZL28__gthrw___pthread_key_createPjPFvPvE
	.weakref	_ZL28__gthrw___pthread_key_createPjPFvPvE,__pthread_key_create
	.hidden	__dso_handle
	.ident	"GCC: (Raspbian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
