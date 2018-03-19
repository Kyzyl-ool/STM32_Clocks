
temp.elf:     file format elf32-littlearm

Sections:
Idx Name              Size      VMA       LMA       File off  Algn  Flags
  0 .isr_vector       000000c0  08000000  08000000  00010000  2**0  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .text             00000788  080000c0  080000c0  000100c0  2**2  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .rodata           00000004  08000848  08000848  00010848  2**2  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init_array       00000008  0800084c  0800084c  0001084c  2**2  CONTENTS, ALLOC, LOAD, DATA
  4 .fini_array       00000004  08000854  08000854  00010854  2**2  CONTENTS, ALLOC, LOAD, DATA
  5 .data             00000434  20000000  08000858  00020000  2**3  CONTENTS, ALLOC, LOAD, DATA
  6 .bss              00000044  20000434  08000c8c  00020434  2**2  ALLOC
  7 ._user_heap_stack 00000600  20000478  08000c8c  00020478  2**0  ALLOC
  8 .ARM.attributes   00000028  00000000  00000000  00020434  2**0  CONTENTS, READONLY
  9 .debug_info       00000b2e  00000000  00000000  0002045c  2**0  CONTENTS, READONLY, DEBUGGING
 10 .debug_abbrev     00000319  00000000  00000000  00020f8a  2**0  CONTENTS, READONLY, DEBUGGING
 11 .debug_aranges    00000108  00000000  00000000  000212a3  2**0  CONTENTS, READONLY, DEBUGGING
 12 .debug_ranges     000000e8  00000000  00000000  000213ab  2**0  CONTENTS, READONLY, DEBUGGING
 13 .debug_line       000005cc  00000000  00000000  00021493  2**0  CONTENTS, READONLY, DEBUGGING
 14 .debug_str        00000721  00000000  00000000  00021a5f  2**0  CONTENTS, READONLY, DEBUGGING
 15 .comment          0000007e  00000000  00000000  00022180  2**0  CONTENTS, READONLY
 16 .debug_frame      000004fc  00000000  00000000  00022200  2**2  CONTENTS, READONLY, DEBUGGING

Disassembly of section .text:

080000c0 <__do_global_dtors_aux>:
 80000c0:	b510      	push	{r4, lr}
 80000c2:	4c06      	ldr	r4, [pc, #24]	; (80000dc <__do_global_dtors_aux+0x1c>)
 80000c4:	7823      	ldrb	r3, [r4, #0]
 80000c6:	2b00      	cmp	r3, #0
 80000c8:	d107      	bne.n	80000da <__do_global_dtors_aux+0x1a>
 80000ca:	4b05      	ldr	r3, [pc, #20]	; (80000e0 <__do_global_dtors_aux+0x20>)
 80000cc:	2b00      	cmp	r3, #0
 80000ce:	d002      	beq.n	80000d6 <__do_global_dtors_aux+0x16>
 80000d0:	4804      	ldr	r0, [pc, #16]	; (80000e4 <__do_global_dtors_aux+0x24>)
 80000d2:	e000      	b.n	80000d6 <__do_global_dtors_aux+0x16>
 80000d4:	bf00      	nop
 80000d6:	2301      	movs	r3, #1
 80000d8:	7023      	strb	r3, [r4, #0]
 80000da:	bd10      	pop	{r4, pc}
 80000dc:	20000434 	.word	0x20000434
 80000e0:	00000000 	.word	0x00000000
 80000e4:	08000830 	.word	0x08000830

080000e8 <frame_dummy>:
 80000e8:	4b04      	ldr	r3, [pc, #16]	; (80000fc <frame_dummy+0x14>)
 80000ea:	b510      	push	{r4, lr}
 80000ec:	2b00      	cmp	r3, #0
 80000ee:	d003      	beq.n	80000f8 <frame_dummy+0x10>
 80000f0:	4903      	ldr	r1, [pc, #12]	; (8000100 <frame_dummy+0x18>)
 80000f2:	4804      	ldr	r0, [pc, #16]	; (8000104 <frame_dummy+0x1c>)
 80000f4:	e000      	b.n	80000f8 <frame_dummy+0x10>
 80000f6:	bf00      	nop
 80000f8:	bd10      	pop	{r4, pc}
 80000fa:	46c0      	nop			; (mov r8, r8)
 80000fc:	00000000 	.word	0x00000000
 8000100:	20000438 	.word	0x20000438
 8000104:	08000830 	.word	0x08000830

08000108 <Reset_Handler>:
 8000108:	480d      	ldr	r0, [pc, #52]	; (8000140 <LoopForever+0x2>)
 800010a:	4685      	mov	sp, r0
 800010c:	480d      	ldr	r0, [pc, #52]	; (8000144 <LoopForever+0x6>)
 800010e:	490e      	ldr	r1, [pc, #56]	; (8000148 <LoopForever+0xa>)
 8000110:	4a0e      	ldr	r2, [pc, #56]	; (800014c <LoopForever+0xe>)
 8000112:	2300      	movs	r3, #0
 8000114:	e002      	b.n	800011c <LoopCopyDataInit>

08000116 <CopyDataInit>:
 8000116:	58d4      	ldr	r4, [r2, r3]
 8000118:	50c4      	str	r4, [r0, r3]
 800011a:	3304      	adds	r3, #4

0800011c <LoopCopyDataInit>:
 800011c:	18c4      	adds	r4, r0, r3
 800011e:	428c      	cmp	r4, r1
 8000120:	d3f9      	bcc.n	8000116 <CopyDataInit>
 8000122:	4a0b      	ldr	r2, [pc, #44]	; (8000150 <LoopForever+0x12>)
 8000124:	4c0b      	ldr	r4, [pc, #44]	; (8000154 <LoopForever+0x16>)
 8000126:	2300      	movs	r3, #0
 8000128:	e001      	b.n	800012e <LoopFillZerobss>

0800012a <FillZerobss>:
 800012a:	6013      	str	r3, [r2, #0]
 800012c:	3204      	adds	r2, #4

0800012e <LoopFillZerobss>:
 800012e:	42a2      	cmp	r2, r4
 8000130:	d3fb      	bcc.n	800012a <FillZerobss>
 8000132:	f000 fa69 	bl	8000608 <SystemInit>
 8000136:	f000 faab 	bl	8000690 <__libc_init_array>
 800013a:	f000 f9bf 	bl	80004bc <main>

0800013e <LoopForever>:
 800013e:	e7fe      	b.n	800013e <LoopForever>
 8000140:	20002000 	.word	0x20002000
 8000144:	20000000 	.word	0x20000000
 8000148:	20000434 	.word	0x20000434
 800014c:	08000858 	.word	0x08000858
 8000150:	20000434 	.word	0x20000434
 8000154:	20000478 	.word	0x20000478

08000158 <ADC1_COMP_IRQHandler>:
 8000158:	e7fe      	b.n	8000158 <ADC1_COMP_IRQHandler>
	...

0800015c <NVIC_SetPriority>:
 800015c:	b590      	push	{r4, r7, lr}
 800015e:	b083      	sub	sp, #12
 8000160:	af00      	add	r7, sp, #0
 8000162:	0002      	movs	r2, r0
 8000164:	6039      	str	r1, [r7, #0]
 8000166:	1dfb      	adds	r3, r7, #7
 8000168:	701a      	strb	r2, [r3, #0]
 800016a:	1dfb      	adds	r3, r7, #7
 800016c:	781b      	ldrb	r3, [r3, #0]
 800016e:	2b7f      	cmp	r3, #127	; 0x7f
 8000170:	d932      	bls.n	80001d8 <NVIC_SetPriority+0x7c>
 8000172:	4a2f      	ldr	r2, [pc, #188]	; (8000230 <NVIC_SetPriority+0xd4>)
 8000174:	1dfb      	adds	r3, r7, #7
 8000176:	781b      	ldrb	r3, [r3, #0]
 8000178:	0019      	movs	r1, r3
 800017a:	230f      	movs	r3, #15
 800017c:	400b      	ands	r3, r1
 800017e:	3b08      	subs	r3, #8
 8000180:	089b      	lsrs	r3, r3, #2
 8000182:	3306      	adds	r3, #6
 8000184:	009b      	lsls	r3, r3, #2
 8000186:	18d3      	adds	r3, r2, r3
 8000188:	3304      	adds	r3, #4
 800018a:	681b      	ldr	r3, [r3, #0]
 800018c:	1dfa      	adds	r2, r7, #7
 800018e:	7812      	ldrb	r2, [r2, #0]
 8000190:	0011      	movs	r1, r2
 8000192:	2203      	movs	r2, #3
 8000194:	400a      	ands	r2, r1
 8000196:	00d2      	lsls	r2, r2, #3
 8000198:	21ff      	movs	r1, #255	; 0xff
 800019a:	4091      	lsls	r1, r2
 800019c:	000a      	movs	r2, r1
 800019e:	43d2      	mvns	r2, r2
 80001a0:	401a      	ands	r2, r3
 80001a2:	0011      	movs	r1, r2
 80001a4:	683b      	ldr	r3, [r7, #0]
 80001a6:	019b      	lsls	r3, r3, #6
 80001a8:	22ff      	movs	r2, #255	; 0xff
 80001aa:	401a      	ands	r2, r3
 80001ac:	1dfb      	adds	r3, r7, #7
 80001ae:	781b      	ldrb	r3, [r3, #0]
 80001b0:	0018      	movs	r0, r3
 80001b2:	2303      	movs	r3, #3
 80001b4:	4003      	ands	r3, r0
 80001b6:	00db      	lsls	r3, r3, #3
 80001b8:	409a      	lsls	r2, r3
 80001ba:	481d      	ldr	r0, [pc, #116]	; (8000230 <NVIC_SetPriority+0xd4>)
 80001bc:	1dfb      	adds	r3, r7, #7
 80001be:	781b      	ldrb	r3, [r3, #0]
 80001c0:	001c      	movs	r4, r3
 80001c2:	230f      	movs	r3, #15
 80001c4:	4023      	ands	r3, r4
 80001c6:	3b08      	subs	r3, #8
 80001c8:	089b      	lsrs	r3, r3, #2
 80001ca:	430a      	orrs	r2, r1
 80001cc:	3306      	adds	r3, #6
 80001ce:	009b      	lsls	r3, r3, #2
 80001d0:	18c3      	adds	r3, r0, r3
 80001d2:	3304      	adds	r3, #4
 80001d4:	601a      	str	r2, [r3, #0]
 80001d6:	e027      	b.n	8000228 <NVIC_SetPriority+0xcc>
 80001d8:	4a16      	ldr	r2, [pc, #88]	; (8000234 <NVIC_SetPriority+0xd8>)
 80001da:	1dfb      	adds	r3, r7, #7
 80001dc:	781b      	ldrb	r3, [r3, #0]
 80001de:	b25b      	sxtb	r3, r3
 80001e0:	089b      	lsrs	r3, r3, #2
 80001e2:	33c0      	adds	r3, #192	; 0xc0
 80001e4:	009b      	lsls	r3, r3, #2
 80001e6:	589b      	ldr	r3, [r3, r2]
 80001e8:	1dfa      	adds	r2, r7, #7
 80001ea:	7812      	ldrb	r2, [r2, #0]
 80001ec:	0011      	movs	r1, r2
 80001ee:	2203      	movs	r2, #3
 80001f0:	400a      	ands	r2, r1
 80001f2:	00d2      	lsls	r2, r2, #3
 80001f4:	21ff      	movs	r1, #255	; 0xff
 80001f6:	4091      	lsls	r1, r2
 80001f8:	000a      	movs	r2, r1
 80001fa:	43d2      	mvns	r2, r2
 80001fc:	401a      	ands	r2, r3
 80001fe:	0011      	movs	r1, r2
 8000200:	683b      	ldr	r3, [r7, #0]
 8000202:	019b      	lsls	r3, r3, #6
 8000204:	22ff      	movs	r2, #255	; 0xff
 8000206:	401a      	ands	r2, r3
 8000208:	1dfb      	adds	r3, r7, #7
 800020a:	781b      	ldrb	r3, [r3, #0]
 800020c:	0018      	movs	r0, r3
 800020e:	2303      	movs	r3, #3
 8000210:	4003      	ands	r3, r0
 8000212:	00db      	lsls	r3, r3, #3
 8000214:	409a      	lsls	r2, r3
 8000216:	4807      	ldr	r0, [pc, #28]	; (8000234 <NVIC_SetPriority+0xd8>)
 8000218:	1dfb      	adds	r3, r7, #7
 800021a:	781b      	ldrb	r3, [r3, #0]
 800021c:	b25b      	sxtb	r3, r3
 800021e:	089b      	lsrs	r3, r3, #2
 8000220:	430a      	orrs	r2, r1
 8000222:	33c0      	adds	r3, #192	; 0xc0
 8000224:	009b      	lsls	r3, r3, #2
 8000226:	501a      	str	r2, [r3, r0]
 8000228:	46c0      	nop			; (mov r8, r8)
 800022a:	46bd      	mov	sp, r7
 800022c:	b003      	add	sp, #12
 800022e:	bd90      	pop	{r4, r7, pc}
 8000230:	e000ed00 	.word	0xe000ed00
 8000234:	e000e100 	.word	0xe000e100

08000238 <SysTick_Config>:
 8000238:	b580      	push	{r7, lr}
 800023a:	b082      	sub	sp, #8
 800023c:	af00      	add	r7, sp, #0
 800023e:	6078      	str	r0, [r7, #4]
 8000240:	687b      	ldr	r3, [r7, #4]
 8000242:	3b01      	subs	r3, #1
 8000244:	4a0c      	ldr	r2, [pc, #48]	; (8000278 <SysTick_Config+0x40>)
 8000246:	4293      	cmp	r3, r2
 8000248:	d901      	bls.n	800024e <SysTick_Config+0x16>
 800024a:	2301      	movs	r3, #1
 800024c:	e010      	b.n	8000270 <SysTick_Config+0x38>
 800024e:	4b0b      	ldr	r3, [pc, #44]	; (800027c <SysTick_Config+0x44>)
 8000250:	687a      	ldr	r2, [r7, #4]
 8000252:	3a01      	subs	r2, #1
 8000254:	605a      	str	r2, [r3, #4]
 8000256:	2301      	movs	r3, #1
 8000258:	425b      	negs	r3, r3
 800025a:	2103      	movs	r1, #3
 800025c:	0018      	movs	r0, r3
 800025e:	f7ff ff7d 	bl	800015c <NVIC_SetPriority>
 8000262:	4b06      	ldr	r3, [pc, #24]	; (800027c <SysTick_Config+0x44>)
 8000264:	2200      	movs	r2, #0
 8000266:	609a      	str	r2, [r3, #8]
 8000268:	4b04      	ldr	r3, [pc, #16]	; (800027c <SysTick_Config+0x44>)
 800026a:	2207      	movs	r2, #7
 800026c:	601a      	str	r2, [r3, #0]
 800026e:	2300      	movs	r3, #0
 8000270:	0018      	movs	r0, r3
 8000272:	46bd      	mov	sp, r7
 8000274:	b002      	add	sp, #8
 8000276:	bd80      	pop	{r7, pc}
 8000278:	00ffffff 	.word	0x00ffffff
 800027c:	e000e010 	.word	0xe000e010

08000280 <LL_AHB1_GRP1_EnableClock>:
 8000280:	b580      	push	{r7, lr}
 8000282:	b084      	sub	sp, #16
 8000284:	af00      	add	r7, sp, #0
 8000286:	6078      	str	r0, [r7, #4]
 8000288:	4b07      	ldr	r3, [pc, #28]	; (80002a8 <LL_AHB1_GRP1_EnableClock+0x28>)
 800028a:	6959      	ldr	r1, [r3, #20]
 800028c:	4b06      	ldr	r3, [pc, #24]	; (80002a8 <LL_AHB1_GRP1_EnableClock+0x28>)
 800028e:	687a      	ldr	r2, [r7, #4]
 8000290:	430a      	orrs	r2, r1
 8000292:	615a      	str	r2, [r3, #20]
 8000294:	4b04      	ldr	r3, [pc, #16]	; (80002a8 <LL_AHB1_GRP1_EnableClock+0x28>)
 8000296:	695b      	ldr	r3, [r3, #20]
 8000298:	687a      	ldr	r2, [r7, #4]
 800029a:	4013      	ands	r3, r2
 800029c:	60fb      	str	r3, [r7, #12]
 800029e:	68fb      	ldr	r3, [r7, #12]
 80002a0:	46c0      	nop			; (mov r8, r8)
 80002a2:	46bd      	mov	sp, r7
 80002a4:	b004      	add	sp, #16
 80002a6:	bd80      	pop	{r7, pc}
 80002a8:	40021000 	.word	0x40021000

080002ac <LL_GPIO_SetPinMode>:
 80002ac:	b580      	push	{r7, lr}
 80002ae:	b084      	sub	sp, #16
 80002b0:	af00      	add	r7, sp, #0
 80002b2:	60f8      	str	r0, [r7, #12]
 80002b4:	60b9      	str	r1, [r7, #8]
 80002b6:	607a      	str	r2, [r7, #4]
 80002b8:	68fb      	ldr	r3, [r7, #12]
 80002ba:	6819      	ldr	r1, [r3, #0]
 80002bc:	68bb      	ldr	r3, [r7, #8]
 80002be:	68ba      	ldr	r2, [r7, #8]
 80002c0:	435a      	muls	r2, r3
 80002c2:	0013      	movs	r3, r2
 80002c4:	005b      	lsls	r3, r3, #1
 80002c6:	189b      	adds	r3, r3, r2
 80002c8:	43db      	mvns	r3, r3
 80002ca:	400b      	ands	r3, r1
 80002cc:	001a      	movs	r2, r3
 80002ce:	68bb      	ldr	r3, [r7, #8]
 80002d0:	68b9      	ldr	r1, [r7, #8]
 80002d2:	434b      	muls	r3, r1
 80002d4:	6879      	ldr	r1, [r7, #4]
 80002d6:	434b      	muls	r3, r1
 80002d8:	431a      	orrs	r2, r3
 80002da:	68fb      	ldr	r3, [r7, #12]
 80002dc:	601a      	str	r2, [r3, #0]
 80002de:	46c0      	nop			; (mov r8, r8)
 80002e0:	46bd      	mov	sp, r7
 80002e2:	b004      	add	sp, #16
 80002e4:	bd80      	pop	{r7, pc}

080002e6 <LL_GPIO_WriteOutputPort>:
 80002e6:	b580      	push	{r7, lr}
 80002e8:	b082      	sub	sp, #8
 80002ea:	af00      	add	r7, sp, #0
 80002ec:	6078      	str	r0, [r7, #4]
 80002ee:	6039      	str	r1, [r7, #0]
 80002f0:	687b      	ldr	r3, [r7, #4]
 80002f2:	683a      	ldr	r2, [r7, #0]
 80002f4:	615a      	str	r2, [r3, #20]
 80002f6:	46c0      	nop			; (mov r8, r8)
 80002f8:	46bd      	mov	sp, r7
 80002fa:	b002      	add	sp, #8
 80002fc:	bd80      	pop	{r7, pc}

080002fe <LL_GPIO_SetOutputPin>:
 80002fe:	b580      	push	{r7, lr}
 8000300:	b082      	sub	sp, #8
 8000302:	af00      	add	r7, sp, #0
 8000304:	6078      	str	r0, [r7, #4]
 8000306:	6039      	str	r1, [r7, #0]
 8000308:	687b      	ldr	r3, [r7, #4]
 800030a:	683a      	ldr	r2, [r7, #0]
 800030c:	619a      	str	r2, [r3, #24]
 800030e:	46c0      	nop			; (mov r8, r8)
 8000310:	46bd      	mov	sp, r7
 8000312:	b002      	add	sp, #8
 8000314:	bd80      	pop	{r7, pc}

08000316 <LL_GPIO_TogglePin>:
 8000316:	b580      	push	{r7, lr}
 8000318:	b082      	sub	sp, #8
 800031a:	af00      	add	r7, sp, #0
 800031c:	6078      	str	r0, [r7, #4]
 800031e:	6039      	str	r1, [r7, #0]
 8000320:	687b      	ldr	r3, [r7, #4]
 8000322:	695a      	ldr	r2, [r3, #20]
 8000324:	683b      	ldr	r3, [r7, #0]
 8000326:	405a      	eors	r2, r3
 8000328:	687b      	ldr	r3, [r7, #4]
 800032a:	615a      	str	r2, [r3, #20]
 800032c:	46c0      	nop			; (mov r8, r8)
 800032e:	46bd      	mov	sp, r7
 8000330:	b002      	add	sp, #8
 8000332:	bd80      	pop	{r7, pc}

08000334 <LL_RCC_HSI_Enable>:
 8000334:	b580      	push	{r7, lr}
 8000336:	af00      	add	r7, sp, #0
 8000338:	4b04      	ldr	r3, [pc, #16]	; (800034c <LL_RCC_HSI_Enable+0x18>)
 800033a:	681a      	ldr	r2, [r3, #0]
 800033c:	4b03      	ldr	r3, [pc, #12]	; (800034c <LL_RCC_HSI_Enable+0x18>)
 800033e:	2101      	movs	r1, #1
 8000340:	430a      	orrs	r2, r1
 8000342:	601a      	str	r2, [r3, #0]
 8000344:	46c0      	nop			; (mov r8, r8)
 8000346:	46bd      	mov	sp, r7
 8000348:	bd80      	pop	{r7, pc}
 800034a:	46c0      	nop			; (mov r8, r8)
 800034c:	40021000 	.word	0x40021000

08000350 <LL_RCC_HSI_IsReady>:
 8000350:	b580      	push	{r7, lr}
 8000352:	af00      	add	r7, sp, #0
 8000354:	4b05      	ldr	r3, [pc, #20]	; (800036c <LL_RCC_HSI_IsReady+0x1c>)
 8000356:	681b      	ldr	r3, [r3, #0]
 8000358:	2202      	movs	r2, #2
 800035a:	4013      	ands	r3, r2
 800035c:	3b02      	subs	r3, #2
 800035e:	425a      	negs	r2, r3
 8000360:	4153      	adcs	r3, r2
 8000362:	b2db      	uxtb	r3, r3
 8000364:	0018      	movs	r0, r3
 8000366:	46bd      	mov	sp, r7
 8000368:	bd80      	pop	{r7, pc}
 800036a:	46c0      	nop			; (mov r8, r8)
 800036c:	40021000 	.word	0x40021000

08000370 <LL_RCC_SetSysClkSource>:
 8000370:	b580      	push	{r7, lr}
 8000372:	b082      	sub	sp, #8
 8000374:	af00      	add	r7, sp, #0
 8000376:	6078      	str	r0, [r7, #4]
 8000378:	4b06      	ldr	r3, [pc, #24]	; (8000394 <LL_RCC_SetSysClkSource+0x24>)
 800037a:	685b      	ldr	r3, [r3, #4]
 800037c:	2203      	movs	r2, #3
 800037e:	4393      	bics	r3, r2
 8000380:	0019      	movs	r1, r3
 8000382:	4b04      	ldr	r3, [pc, #16]	; (8000394 <LL_RCC_SetSysClkSource+0x24>)
 8000384:	687a      	ldr	r2, [r7, #4]
 8000386:	430a      	orrs	r2, r1
 8000388:	605a      	str	r2, [r3, #4]
 800038a:	46c0      	nop			; (mov r8, r8)
 800038c:	46bd      	mov	sp, r7
 800038e:	b002      	add	sp, #8
 8000390:	bd80      	pop	{r7, pc}
 8000392:	46c0      	nop			; (mov r8, r8)
 8000394:	40021000 	.word	0x40021000

08000398 <LL_RCC_GetSysClkSource>:
 8000398:	b580      	push	{r7, lr}
 800039a:	af00      	add	r7, sp, #0
 800039c:	4b03      	ldr	r3, [pc, #12]	; (80003ac <LL_RCC_GetSysClkSource+0x14>)
 800039e:	685b      	ldr	r3, [r3, #4]
 80003a0:	220c      	movs	r2, #12
 80003a2:	4013      	ands	r3, r2
 80003a4:	0018      	movs	r0, r3
 80003a6:	46bd      	mov	sp, r7
 80003a8:	bd80      	pop	{r7, pc}
 80003aa:	46c0      	nop			; (mov r8, r8)
 80003ac:	40021000 	.word	0x40021000

080003b0 <LL_RCC_SetAHBPrescaler>:
 80003b0:	b580      	push	{r7, lr}
 80003b2:	b082      	sub	sp, #8
 80003b4:	af00      	add	r7, sp, #0
 80003b6:	6078      	str	r0, [r7, #4]
 80003b8:	4b06      	ldr	r3, [pc, #24]	; (80003d4 <LL_RCC_SetAHBPrescaler+0x24>)
 80003ba:	685b      	ldr	r3, [r3, #4]
 80003bc:	22f0      	movs	r2, #240	; 0xf0
 80003be:	4393      	bics	r3, r2
 80003c0:	0019      	movs	r1, r3
 80003c2:	4b04      	ldr	r3, [pc, #16]	; (80003d4 <LL_RCC_SetAHBPrescaler+0x24>)
 80003c4:	687a      	ldr	r2, [r7, #4]
 80003c6:	430a      	orrs	r2, r1
 80003c8:	605a      	str	r2, [r3, #4]
 80003ca:	46c0      	nop			; (mov r8, r8)
 80003cc:	46bd      	mov	sp, r7
 80003ce:	b002      	add	sp, #8
 80003d0:	bd80      	pop	{r7, pc}
 80003d2:	46c0      	nop			; (mov r8, r8)
 80003d4:	40021000 	.word	0x40021000

080003d8 <LL_RCC_SetAPB1Prescaler>:
 80003d8:	b580      	push	{r7, lr}
 80003da:	b082      	sub	sp, #8
 80003dc:	af00      	add	r7, sp, #0
 80003de:	6078      	str	r0, [r7, #4]
 80003e0:	4b06      	ldr	r3, [pc, #24]	; (80003fc <LL_RCC_SetAPB1Prescaler+0x24>)
 80003e2:	685b      	ldr	r3, [r3, #4]
 80003e4:	4a06      	ldr	r2, [pc, #24]	; (8000400 <LL_RCC_SetAPB1Prescaler+0x28>)
 80003e6:	4013      	ands	r3, r2
 80003e8:	0019      	movs	r1, r3
 80003ea:	4b04      	ldr	r3, [pc, #16]	; (80003fc <LL_RCC_SetAPB1Prescaler+0x24>)
 80003ec:	687a      	ldr	r2, [r7, #4]
 80003ee:	430a      	orrs	r2, r1
 80003f0:	605a      	str	r2, [r3, #4]
 80003f2:	46c0      	nop			; (mov r8, r8)
 80003f4:	46bd      	mov	sp, r7
 80003f6:	b002      	add	sp, #8
 80003f8:	bd80      	pop	{r7, pc}
 80003fa:	46c0      	nop			; (mov r8, r8)
 80003fc:	40021000 	.word	0x40021000
 8000400:	fffff8ff 	.word	0xfffff8ff

08000404 <LL_RCC_PLL_Enable>:
 8000404:	b580      	push	{r7, lr}
 8000406:	af00      	add	r7, sp, #0
 8000408:	4b04      	ldr	r3, [pc, #16]	; (800041c <LL_RCC_PLL_Enable+0x18>)
 800040a:	681a      	ldr	r2, [r3, #0]
 800040c:	4b03      	ldr	r3, [pc, #12]	; (800041c <LL_RCC_PLL_Enable+0x18>)
 800040e:	2180      	movs	r1, #128	; 0x80
 8000410:	0449      	lsls	r1, r1, #17
 8000412:	430a      	orrs	r2, r1
 8000414:	601a      	str	r2, [r3, #0]
 8000416:	46c0      	nop			; (mov r8, r8)
 8000418:	46bd      	mov	sp, r7
 800041a:	bd80      	pop	{r7, pc}
 800041c:	40021000 	.word	0x40021000

08000420 <LL_RCC_PLL_IsReady>:
 8000420:	b580      	push	{r7, lr}
 8000422:	af00      	add	r7, sp, #0
 8000424:	4b07      	ldr	r3, [pc, #28]	; (8000444 <LL_RCC_PLL_IsReady+0x24>)
 8000426:	681a      	ldr	r2, [r3, #0]
 8000428:	2380      	movs	r3, #128	; 0x80
 800042a:	049b      	lsls	r3, r3, #18
 800042c:	4013      	ands	r3, r2
 800042e:	22fe      	movs	r2, #254	; 0xfe
 8000430:	0612      	lsls	r2, r2, #24
 8000432:	4694      	mov	ip, r2
 8000434:	4463      	add	r3, ip
 8000436:	425a      	negs	r2, r3
 8000438:	4153      	adcs	r3, r2
 800043a:	b2db      	uxtb	r3, r3
 800043c:	0018      	movs	r0, r3
 800043e:	46bd      	mov	sp, r7
 8000440:	bd80      	pop	{r7, pc}
 8000442:	46c0      	nop			; (mov r8, r8)
 8000444:	40021000 	.word	0x40021000

08000448 <LL_RCC_PLL_ConfigDomain_SYS>:
 8000448:	b580      	push	{r7, lr}
 800044a:	b082      	sub	sp, #8
 800044c:	af00      	add	r7, sp, #0
 800044e:	6078      	str	r0, [r7, #4]
 8000450:	6039      	str	r1, [r7, #0]
 8000452:	4b0e      	ldr	r3, [pc, #56]	; (800048c <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000454:	685b      	ldr	r3, [r3, #4]
 8000456:	4a0e      	ldr	r2, [pc, #56]	; (8000490 <LL_RCC_PLL_ConfigDomain_SYS+0x48>)
 8000458:	4013      	ands	r3, r2
 800045a:	0019      	movs	r1, r3
 800045c:	687a      	ldr	r2, [r7, #4]
 800045e:	2380      	movs	r3, #128	; 0x80
 8000460:	025b      	lsls	r3, r3, #9
 8000462:	401a      	ands	r2, r3
 8000464:	683b      	ldr	r3, [r7, #0]
 8000466:	431a      	orrs	r2, r3
 8000468:	4b08      	ldr	r3, [pc, #32]	; (800048c <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 800046a:	430a      	orrs	r2, r1
 800046c:	605a      	str	r2, [r3, #4]
 800046e:	4b07      	ldr	r3, [pc, #28]	; (800048c <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000470:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8000472:	220f      	movs	r2, #15
 8000474:	4393      	bics	r3, r2
 8000476:	0019      	movs	r1, r3
 8000478:	687b      	ldr	r3, [r7, #4]
 800047a:	220f      	movs	r2, #15
 800047c:	401a      	ands	r2, r3
 800047e:	4b03      	ldr	r3, [pc, #12]	; (800048c <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000480:	430a      	orrs	r2, r1
 8000482:	62da      	str	r2, [r3, #44]	; 0x2c
 8000484:	46c0      	nop			; (mov r8, r8)
 8000486:	46bd      	mov	sp, r7
 8000488:	b002      	add	sp, #8
 800048a:	bd80      	pop	{r7, pc}
 800048c:	40021000 	.word	0x40021000
 8000490:	ffc2ffff 	.word	0xffc2ffff

08000494 <LL_FLASH_SetLatency>:
 8000494:	b580      	push	{r7, lr}
 8000496:	b082      	sub	sp, #8
 8000498:	af00      	add	r7, sp, #0
 800049a:	6078      	str	r0, [r7, #4]
 800049c:	4b06      	ldr	r3, [pc, #24]	; (80004b8 <LL_FLASH_SetLatency+0x24>)
 800049e:	681b      	ldr	r3, [r3, #0]
 80004a0:	2201      	movs	r2, #1
 80004a2:	4393      	bics	r3, r2
 80004a4:	0019      	movs	r1, r3
 80004a6:	4b04      	ldr	r3, [pc, #16]	; (80004b8 <LL_FLASH_SetLatency+0x24>)
 80004a8:	687a      	ldr	r2, [r7, #4]
 80004aa:	430a      	orrs	r2, r1
 80004ac:	601a      	str	r2, [r3, #0]
 80004ae:	46c0      	nop			; (mov r8, r8)
 80004b0:	46bd      	mov	sp, r7
 80004b2:	b002      	add	sp, #8
 80004b4:	bd80      	pop	{r7, pc}
 80004b6:	46c0      	nop			; (mov r8, r8)
 80004b8:	40022000 	.word	0x40022000

080004bc <main>:
 80004bc:	b580      	push	{r7, lr}
 80004be:	af00      	add	r7, sp, #0
 80004c0:	f000 f82e 	bl	8000520 <SystemClock_Config>
 80004c4:	2380      	movs	r3, #128	; 0x80
 80004c6:	031b      	lsls	r3, r3, #12
 80004c8:	0018      	movs	r0, r3
 80004ca:	f7ff fed9 	bl	8000280 <LL_AHB1_GRP1_EnableClock>
 80004ce:	2380      	movs	r3, #128	; 0x80
 80004d0:	009b      	lsls	r3, r3, #2
 80004d2:	480d      	ldr	r0, [pc, #52]	; (8000508 <main+0x4c>)
 80004d4:	2201      	movs	r2, #1
 80004d6:	0019      	movs	r1, r3
 80004d8:	f7ff fee8 	bl	80002ac <LL_GPIO_SetPinMode>
 80004dc:	2380      	movs	r3, #128	; 0x80
 80004de:	005b      	lsls	r3, r3, #1
 80004e0:	4809      	ldr	r0, [pc, #36]	; (8000508 <main+0x4c>)
 80004e2:	2201      	movs	r2, #1
 80004e4:	0019      	movs	r1, r3
 80004e6:	f7ff fee1 	bl	80002ac <LL_GPIO_SetPinMode>
 80004ea:	4b07      	ldr	r3, [pc, #28]	; (8000508 <main+0x4c>)
 80004ec:	2100      	movs	r1, #0
 80004ee:	0018      	movs	r0, r3
 80004f0:	f7ff fef9 	bl	80002e6 <LL_GPIO_WriteOutputPort>
 80004f4:	f000 f80a 	bl	800050c <delay>
 80004f8:	2380      	movs	r3, #128	; 0x80
 80004fa:	009b      	lsls	r3, r3, #2
 80004fc:	4a02      	ldr	r2, [pc, #8]	; (8000508 <main+0x4c>)
 80004fe:	0019      	movs	r1, r3
 8000500:	0010      	movs	r0, r2
 8000502:	f7ff ff08 	bl	8000316 <LL_GPIO_TogglePin>
 8000506:	e7f5      	b.n	80004f4 <main+0x38>
 8000508:	48000800 	.word	0x48000800

0800050c <delay>:
 800050c:	b580      	push	{r7, lr}
 800050e:	4e02      	ldr	r6, [pc, #8]	; (8000518 <delay+0xc>)
 8000510:	3e01      	subs	r6, #1
 8000512:	2e00      	cmp	r6, #0
 8000514:	d1fc      	bne.n	8000510 <delay+0x4>
 8000516:	bd80      	pop	{r7, pc}
 8000518:	005b8d80 	.word	0x005b8d80
 800051c:	46c0      	nop			; (mov r8, r8)
	...

08000520 <SystemClock_Config>:
 8000520:	b580      	push	{r7, lr}
 8000522:	af00      	add	r7, sp, #0
 8000524:	2001      	movs	r0, #1
 8000526:	f7ff ffb5 	bl	8000494 <LL_FLASH_SetLatency>
 800052a:	f7ff ff03 	bl	8000334 <LL_RCC_HSI_Enable>
 800052e:	46c0      	nop			; (mov r8, r8)
 8000530:	f7ff ff0e 	bl	8000350 <LL_RCC_HSI_IsReady>
 8000534:	0003      	movs	r3, r0
 8000536:	2b01      	cmp	r3, #1
 8000538:	d1fa      	bne.n	8000530 <SystemClock_Config+0x10>
 800053a:	23a0      	movs	r3, #160	; 0xa0
 800053c:	039b      	lsls	r3, r3, #14
 800053e:	0019      	movs	r1, r3
 8000540:	2000      	movs	r0, #0
 8000542:	f7ff ff81 	bl	8000448 <LL_RCC_PLL_ConfigDomain_SYS>
 8000546:	f7ff ff5d 	bl	8000404 <LL_RCC_PLL_Enable>
 800054a:	46c0      	nop			; (mov r8, r8)
 800054c:	f7ff ff68 	bl	8000420 <LL_RCC_PLL_IsReady>
 8000550:	0003      	movs	r3, r0
 8000552:	2b01      	cmp	r3, #1
 8000554:	d1fa      	bne.n	800054c <SystemClock_Config+0x2c>
 8000556:	2000      	movs	r0, #0
 8000558:	f7ff ff2a 	bl	80003b0 <LL_RCC_SetAHBPrescaler>
 800055c:	2002      	movs	r0, #2
 800055e:	f7ff ff07 	bl	8000370 <LL_RCC_SetSysClkSource>
 8000562:	46c0      	nop			; (mov r8, r8)
 8000564:	f7ff ff18 	bl	8000398 <LL_RCC_GetSysClkSource>
 8000568:	0003      	movs	r3, r0
 800056a:	2b08      	cmp	r3, #8
 800056c:	d1fa      	bne.n	8000564 <SystemClock_Config+0x44>
 800056e:	2000      	movs	r0, #0
 8000570:	f7ff ff32 	bl	80003d8 <LL_RCC_SetAPB1Prescaler>
 8000574:	4b04      	ldr	r3, [pc, #16]	; (8000588 <SystemClock_Config+0x68>)
 8000576:	0018      	movs	r0, r3
 8000578:	f7ff fe5e 	bl	8000238 <SysTick_Config>
 800057c:	4b03      	ldr	r3, [pc, #12]	; (800058c <SystemClock_Config+0x6c>)
 800057e:	4a04      	ldr	r2, [pc, #16]	; (8000590 <SystemClock_Config+0x70>)
 8000580:	601a      	str	r2, [r3, #0]
 8000582:	46c0      	nop			; (mov r8, r8)
 8000584:	46bd      	mov	sp, r7
 8000586:	bd80      	pop	{r7, pc}
 8000588:	0000bb80 	.word	0x0000bb80
 800058c:	20000000 	.word	0x20000000
 8000590:	02dc6c00 	.word	0x02dc6c00

08000594 <NMI_Handler>:
 8000594:	b580      	push	{r7, lr}
 8000596:	af00      	add	r7, sp, #0
 8000598:	46c0      	nop			; (mov r8, r8)
 800059a:	46bd      	mov	sp, r7
 800059c:	bd80      	pop	{r7, pc}
	...

080005a0 <HardFault_Handler>:
 80005a0:	b580      	push	{r7, lr}
 80005a2:	af00      	add	r7, sp, #0
 80005a4:	2380      	movs	r3, #128	; 0x80
 80005a6:	009b      	lsls	r3, r3, #2
 80005a8:	4a02      	ldr	r2, [pc, #8]	; (80005b4 <HardFault_Handler+0x14>)
 80005aa:	0019      	movs	r1, r3
 80005ac:	0010      	movs	r0, r2
 80005ae:	f7ff fea6 	bl	80002fe <LL_GPIO_SetOutputPin>
 80005b2:	e7fe      	b.n	80005b2 <HardFault_Handler+0x12>
 80005b4:	48000800 	.word	0x48000800

080005b8 <SVC_Handler>:
 80005b8:	b580      	push	{r7, lr}
 80005ba:	af00      	add	r7, sp, #0
 80005bc:	46c0      	nop			; (mov r8, r8)
 80005be:	46bd      	mov	sp, r7
 80005c0:	bd80      	pop	{r7, pc}

080005c2 <PendSV_Handler>:
 80005c2:	b580      	push	{r7, lr}
 80005c4:	af00      	add	r7, sp, #0
 80005c6:	46c0      	nop			; (mov r8, r8)
 80005c8:	46bd      	mov	sp, r7
 80005ca:	bd80      	pop	{r7, pc}

080005cc <SysTick_Handler>:
 80005cc:	b580      	push	{r7, lr}
 80005ce:	af00      	add	r7, sp, #0
 80005d0:	4b0b      	ldr	r3, [pc, #44]	; (8000600 <SysTick_Handler+0x34>)
 80005d2:	681b      	ldr	r3, [r3, #0]
 80005d4:	1c5a      	adds	r2, r3, #1
 80005d6:	4b0a      	ldr	r3, [pc, #40]	; (8000600 <SysTick_Handler+0x34>)
 80005d8:	601a      	str	r2, [r3, #0]
 80005da:	4b09      	ldr	r3, [pc, #36]	; (8000600 <SysTick_Handler+0x34>)
 80005dc:	681a      	ldr	r2, [r3, #0]
 80005de:	23fa      	movs	r3, #250	; 0xfa
 80005e0:	009b      	lsls	r3, r3, #2
 80005e2:	429a      	cmp	r2, r3
 80005e4:	d109      	bne.n	80005fa <SysTick_Handler+0x2e>
 80005e6:	2380      	movs	r3, #128	; 0x80
 80005e8:	005b      	lsls	r3, r3, #1
 80005ea:	4a06      	ldr	r2, [pc, #24]	; (8000604 <SysTick_Handler+0x38>)
 80005ec:	0019      	movs	r1, r3
 80005ee:	0010      	movs	r0, r2
 80005f0:	f7ff fe91 	bl	8000316 <LL_GPIO_TogglePin>
 80005f4:	4b02      	ldr	r3, [pc, #8]	; (8000600 <SysTick_Handler+0x34>)
 80005f6:	2200      	movs	r2, #0
 80005f8:	601a      	str	r2, [r3, #0]
 80005fa:	46c0      	nop			; (mov r8, r8)
 80005fc:	46bd      	mov	sp, r7
 80005fe:	bd80      	pop	{r7, pc}
 8000600:	20000450 	.word	0x20000450
 8000604:	48000800 	.word	0x48000800

08000608 <SystemInit>:
 8000608:	b580      	push	{r7, lr}
 800060a:	af00      	add	r7, sp, #0
 800060c:	4b1a      	ldr	r3, [pc, #104]	; (8000678 <SystemInit+0x70>)
 800060e:	681a      	ldr	r2, [r3, #0]
 8000610:	4b19      	ldr	r3, [pc, #100]	; (8000678 <SystemInit+0x70>)
 8000612:	2101      	movs	r1, #1
 8000614:	430a      	orrs	r2, r1
 8000616:	601a      	str	r2, [r3, #0]
 8000618:	4b17      	ldr	r3, [pc, #92]	; (8000678 <SystemInit+0x70>)
 800061a:	685a      	ldr	r2, [r3, #4]
 800061c:	4b16      	ldr	r3, [pc, #88]	; (8000678 <SystemInit+0x70>)
 800061e:	4917      	ldr	r1, [pc, #92]	; (800067c <SystemInit+0x74>)
 8000620:	400a      	ands	r2, r1
 8000622:	605a      	str	r2, [r3, #4]
 8000624:	4b14      	ldr	r3, [pc, #80]	; (8000678 <SystemInit+0x70>)
 8000626:	681a      	ldr	r2, [r3, #0]
 8000628:	4b13      	ldr	r3, [pc, #76]	; (8000678 <SystemInit+0x70>)
 800062a:	4915      	ldr	r1, [pc, #84]	; (8000680 <SystemInit+0x78>)
 800062c:	400a      	ands	r2, r1
 800062e:	601a      	str	r2, [r3, #0]
 8000630:	4b11      	ldr	r3, [pc, #68]	; (8000678 <SystemInit+0x70>)
 8000632:	681a      	ldr	r2, [r3, #0]
 8000634:	4b10      	ldr	r3, [pc, #64]	; (8000678 <SystemInit+0x70>)
 8000636:	4913      	ldr	r1, [pc, #76]	; (8000684 <SystemInit+0x7c>)
 8000638:	400a      	ands	r2, r1
 800063a:	601a      	str	r2, [r3, #0]
 800063c:	4b0e      	ldr	r3, [pc, #56]	; (8000678 <SystemInit+0x70>)
 800063e:	685a      	ldr	r2, [r3, #4]
 8000640:	4b0d      	ldr	r3, [pc, #52]	; (8000678 <SystemInit+0x70>)
 8000642:	4911      	ldr	r1, [pc, #68]	; (8000688 <SystemInit+0x80>)
 8000644:	400a      	ands	r2, r1
 8000646:	605a      	str	r2, [r3, #4]
 8000648:	4b0b      	ldr	r3, [pc, #44]	; (8000678 <SystemInit+0x70>)
 800064a:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 800064c:	4b0a      	ldr	r3, [pc, #40]	; (8000678 <SystemInit+0x70>)
 800064e:	210f      	movs	r1, #15
 8000650:	438a      	bics	r2, r1
 8000652:	62da      	str	r2, [r3, #44]	; 0x2c
 8000654:	4b08      	ldr	r3, [pc, #32]	; (8000678 <SystemInit+0x70>)
 8000656:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000658:	4b07      	ldr	r3, [pc, #28]	; (8000678 <SystemInit+0x70>)
 800065a:	490c      	ldr	r1, [pc, #48]	; (800068c <SystemInit+0x84>)
 800065c:	400a      	ands	r2, r1
 800065e:	631a      	str	r2, [r3, #48]	; 0x30
 8000660:	4b05      	ldr	r3, [pc, #20]	; (8000678 <SystemInit+0x70>)
 8000662:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 8000664:	4b04      	ldr	r3, [pc, #16]	; (8000678 <SystemInit+0x70>)
 8000666:	2101      	movs	r1, #1
 8000668:	438a      	bics	r2, r1
 800066a:	635a      	str	r2, [r3, #52]	; 0x34
 800066c:	4b02      	ldr	r3, [pc, #8]	; (8000678 <SystemInit+0x70>)
 800066e:	2200      	movs	r2, #0
 8000670:	609a      	str	r2, [r3, #8]
 8000672:	46c0      	nop			; (mov r8, r8)
 8000674:	46bd      	mov	sp, r7
 8000676:	bd80      	pop	{r7, pc}
 8000678:	40021000 	.word	0x40021000
 800067c:	f8ffb80c 	.word	0xf8ffb80c
 8000680:	fef6ffff 	.word	0xfef6ffff
 8000684:	fffbffff 	.word	0xfffbffff
 8000688:	ffc0ffff 	.word	0xffc0ffff
 800068c:	fffffeac 	.word	0xfffffeac

08000690 <__libc_init_array>:
 8000690:	b570      	push	{r4, r5, r6, lr}
 8000692:	4e0d      	ldr	r6, [pc, #52]	; (80006c8 <__libc_init_array+0x38>)
 8000694:	4d0d      	ldr	r5, [pc, #52]	; (80006cc <__libc_init_array+0x3c>)
 8000696:	1bad      	subs	r5, r5, r6
 8000698:	10ad      	asrs	r5, r5, #2
 800069a:	d006      	beq.n	80006aa <__libc_init_array+0x1a>
 800069c:	2400      	movs	r4, #0
 800069e:	00a3      	lsls	r3, r4, #2
 80006a0:	58f3      	ldr	r3, [r6, r3]
 80006a2:	3401      	adds	r4, #1
 80006a4:	4798      	blx	r3
 80006a6:	42a5      	cmp	r5, r4
 80006a8:	d1f9      	bne.n	800069e <__libc_init_array+0xe>
 80006aa:	f000 f8c1 	bl	8000830 <_init>
 80006ae:	4e08      	ldr	r6, [pc, #32]	; (80006d0 <__libc_init_array+0x40>)
 80006b0:	4d08      	ldr	r5, [pc, #32]	; (80006d4 <__libc_init_array+0x44>)
 80006b2:	1bad      	subs	r5, r5, r6
 80006b4:	10ad      	asrs	r5, r5, #2
 80006b6:	d006      	beq.n	80006c6 <__libc_init_array+0x36>
 80006b8:	2400      	movs	r4, #0
 80006ba:	00a3      	lsls	r3, r4, #2
 80006bc:	58f3      	ldr	r3, [r6, r3]
 80006be:	3401      	adds	r4, #1
 80006c0:	4798      	blx	r3
 80006c2:	42a5      	cmp	r5, r4
 80006c4:	d1f9      	bne.n	80006ba <__libc_init_array+0x2a>
 80006c6:	bd70      	pop	{r4, r5, r6, pc}
 80006c8:	0800084c 	.word	0x0800084c
 80006cc:	0800084c 	.word	0x0800084c
 80006d0:	0800084c 	.word	0x0800084c
 80006d4:	08000854 	.word	0x08000854

080006d8 <register_fini>:
 80006d8:	4b03      	ldr	r3, [pc, #12]	; (80006e8 <register_fini+0x10>)
 80006da:	b510      	push	{r4, lr}
 80006dc:	2b00      	cmp	r3, #0
 80006de:	d002      	beq.n	80006e6 <register_fini+0xe>
 80006e0:	4802      	ldr	r0, [pc, #8]	; (80006ec <register_fini+0x14>)
 80006e2:	f000 f805 	bl	80006f0 <atexit>
 80006e6:	bd10      	pop	{r4, pc}
 80006e8:	00000000 	.word	0x00000000
 80006ec:	08000701 	.word	0x08000701

080006f0 <atexit>:
 80006f0:	b510      	push	{r4, lr}
 80006f2:	0001      	movs	r1, r0
 80006f4:	2300      	movs	r3, #0
 80006f6:	2200      	movs	r2, #0
 80006f8:	2000      	movs	r0, #0
 80006fa:	f000 f81f 	bl	800073c <__register_exitproc>
 80006fe:	bd10      	pop	{r4, pc}

08000700 <__libc_fini_array>:
 8000700:	b570      	push	{r4, r5, r6, lr}
 8000702:	4b09      	ldr	r3, [pc, #36]	; (8000728 <__libc_fini_array+0x28>)
 8000704:	4c09      	ldr	r4, [pc, #36]	; (800072c <__libc_fini_array+0x2c>)
 8000706:	1ae4      	subs	r4, r4, r3
 8000708:	10a4      	asrs	r4, r4, #2
 800070a:	d009      	beq.n	8000720 <__libc_fini_array+0x20>
 800070c:	4a08      	ldr	r2, [pc, #32]	; (8000730 <__libc_fini_array+0x30>)
 800070e:	18a5      	adds	r5, r4, r2
 8000710:	00ad      	lsls	r5, r5, #2
 8000712:	18ed      	adds	r5, r5, r3
 8000714:	682b      	ldr	r3, [r5, #0]
 8000716:	3c01      	subs	r4, #1
 8000718:	4798      	blx	r3
 800071a:	3d04      	subs	r5, #4
 800071c:	2c00      	cmp	r4, #0
 800071e:	d1f9      	bne.n	8000714 <__libc_fini_array+0x14>
 8000720:	f000 f88c 	bl	800083c <_fini>
 8000724:	bd70      	pop	{r4, r5, r6, pc}
 8000726:	46c0      	nop			; (mov r8, r8)
 8000728:	08000854 	.word	0x08000854
 800072c:	08000858 	.word	0x08000858
 8000730:	3fffffff 	.word	0x3fffffff

08000734 <__retarget_lock_acquire_recursive>:
 8000734:	4770      	bx	lr
 8000736:	46c0      	nop			; (mov r8, r8)

08000738 <__retarget_lock_release_recursive>:
 8000738:	4770      	bx	lr
 800073a:	46c0      	nop			; (mov r8, r8)

0800073c <__register_exitproc>:
 800073c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800073e:	464e      	mov	r6, r9
 8000740:	4645      	mov	r5, r8
 8000742:	46de      	mov	lr, fp
 8000744:	4657      	mov	r7, sl
 8000746:	b5e0      	push	{r5, r6, r7, lr}
 8000748:	4d36      	ldr	r5, [pc, #216]	; (8000824 <__register_exitproc+0xe8>)
 800074a:	b083      	sub	sp, #12
 800074c:	0006      	movs	r6, r0
 800074e:	6828      	ldr	r0, [r5, #0]
 8000750:	4698      	mov	r8, r3
 8000752:	000f      	movs	r7, r1
 8000754:	4691      	mov	r9, r2
 8000756:	f7ff ffed 	bl	8000734 <__retarget_lock_acquire_recursive>
 800075a:	4b33      	ldr	r3, [pc, #204]	; (8000828 <__register_exitproc+0xec>)
 800075c:	681c      	ldr	r4, [r3, #0]
 800075e:	23a4      	movs	r3, #164	; 0xa4
 8000760:	005b      	lsls	r3, r3, #1
 8000762:	58e0      	ldr	r0, [r4, r3]
 8000764:	2800      	cmp	r0, #0
 8000766:	d052      	beq.n	800080e <__register_exitproc+0xd2>
 8000768:	6843      	ldr	r3, [r0, #4]
 800076a:	2b1f      	cmp	r3, #31
 800076c:	dc13      	bgt.n	8000796 <__register_exitproc+0x5a>
 800076e:	1c5a      	adds	r2, r3, #1
 8000770:	9201      	str	r2, [sp, #4]
 8000772:	2e00      	cmp	r6, #0
 8000774:	d128      	bne.n	80007c8 <__register_exitproc+0x8c>
 8000776:	9a01      	ldr	r2, [sp, #4]
 8000778:	3302      	adds	r3, #2
 800077a:	009b      	lsls	r3, r3, #2
 800077c:	6042      	str	r2, [r0, #4]
 800077e:	501f      	str	r7, [r3, r0]
 8000780:	6828      	ldr	r0, [r5, #0]
 8000782:	f7ff ffd9 	bl	8000738 <__retarget_lock_release_recursive>
 8000786:	2000      	movs	r0, #0
 8000788:	b003      	add	sp, #12
 800078a:	bc3c      	pop	{r2, r3, r4, r5}
 800078c:	4690      	mov	r8, r2
 800078e:	4699      	mov	r9, r3
 8000790:	46a2      	mov	sl, r4
 8000792:	46ab      	mov	fp, r5
 8000794:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000796:	4b25      	ldr	r3, [pc, #148]	; (800082c <__register_exitproc+0xf0>)
 8000798:	2b00      	cmp	r3, #0
 800079a:	d03d      	beq.n	8000818 <__register_exitproc+0xdc>
 800079c:	20c8      	movs	r0, #200	; 0xc8
 800079e:	0040      	lsls	r0, r0, #1
 80007a0:	e000      	b.n	80007a4 <__register_exitproc+0x68>
 80007a2:	bf00      	nop
 80007a4:	2800      	cmp	r0, #0
 80007a6:	d037      	beq.n	8000818 <__register_exitproc+0xdc>
 80007a8:	22a4      	movs	r2, #164	; 0xa4
 80007aa:	2300      	movs	r3, #0
 80007ac:	0052      	lsls	r2, r2, #1
 80007ae:	58a1      	ldr	r1, [r4, r2]
 80007b0:	6043      	str	r3, [r0, #4]
 80007b2:	6001      	str	r1, [r0, #0]
 80007b4:	50a0      	str	r0, [r4, r2]
 80007b6:	3240      	adds	r2, #64	; 0x40
 80007b8:	5083      	str	r3, [r0, r2]
 80007ba:	3204      	adds	r2, #4
 80007bc:	5083      	str	r3, [r0, r2]
 80007be:	3301      	adds	r3, #1
 80007c0:	9301      	str	r3, [sp, #4]
 80007c2:	2300      	movs	r3, #0
 80007c4:	2e00      	cmp	r6, #0
 80007c6:	d0d6      	beq.n	8000776 <__register_exitproc+0x3a>
 80007c8:	009a      	lsls	r2, r3, #2
 80007ca:	4692      	mov	sl, r2
 80007cc:	4482      	add	sl, r0
 80007ce:	464a      	mov	r2, r9
 80007d0:	2188      	movs	r1, #136	; 0x88
 80007d2:	4654      	mov	r4, sl
 80007d4:	5062      	str	r2, [r4, r1]
 80007d6:	22c4      	movs	r2, #196	; 0xc4
 80007d8:	0052      	lsls	r2, r2, #1
 80007da:	4691      	mov	r9, r2
 80007dc:	4481      	add	r9, r0
 80007de:	464a      	mov	r2, r9
 80007e0:	3987      	subs	r1, #135	; 0x87
 80007e2:	4099      	lsls	r1, r3
 80007e4:	6812      	ldr	r2, [r2, #0]
 80007e6:	468b      	mov	fp, r1
 80007e8:	430a      	orrs	r2, r1
 80007ea:	4694      	mov	ip, r2
 80007ec:	464a      	mov	r2, r9
 80007ee:	4661      	mov	r1, ip
 80007f0:	6011      	str	r1, [r2, #0]
 80007f2:	2284      	movs	r2, #132	; 0x84
 80007f4:	4641      	mov	r1, r8
 80007f6:	0052      	lsls	r2, r2, #1
 80007f8:	50a1      	str	r1, [r4, r2]
 80007fa:	2e02      	cmp	r6, #2
 80007fc:	d1bb      	bne.n	8000776 <__register_exitproc+0x3a>
 80007fe:	0002      	movs	r2, r0
 8000800:	465c      	mov	r4, fp
 8000802:	328d      	adds	r2, #141	; 0x8d
 8000804:	32ff      	adds	r2, #255	; 0xff
 8000806:	6811      	ldr	r1, [r2, #0]
 8000808:	430c      	orrs	r4, r1
 800080a:	6014      	str	r4, [r2, #0]
 800080c:	e7b3      	b.n	8000776 <__register_exitproc+0x3a>
 800080e:	0020      	movs	r0, r4
 8000810:	304d      	adds	r0, #77	; 0x4d
 8000812:	30ff      	adds	r0, #255	; 0xff
 8000814:	50e0      	str	r0, [r4, r3]
 8000816:	e7a7      	b.n	8000768 <__register_exitproc+0x2c>
 8000818:	6828      	ldr	r0, [r5, #0]
 800081a:	f7ff ff8d 	bl	8000738 <__retarget_lock_release_recursive>
 800081e:	2001      	movs	r0, #1
 8000820:	4240      	negs	r0, r0
 8000822:	e7b1      	b.n	8000788 <__register_exitproc+0x4c>
 8000824:	20000430 	.word	0x20000430
 8000828:	08000848 	.word	0x08000848
 800082c:	00000000 	.word	0x00000000

08000830 <_init>:
 8000830:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000832:	46c0      	nop			; (mov r8, r8)
 8000834:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8000836:	bc08      	pop	{r3}
 8000838:	469e      	mov	lr, r3
 800083a:	4770      	bx	lr

0800083c <_fini>:
 800083c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800083e:	46c0      	nop			; (mov r8, r8)
 8000840:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8000842:	bc08      	pop	{r3}
 8000844:	469e      	mov	lr, r3
 8000846:	4770      	bx	lr
