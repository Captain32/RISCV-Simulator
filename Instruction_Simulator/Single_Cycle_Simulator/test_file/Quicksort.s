
Quicksort.elf:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c791                	beqz	a5,100c4 <register_fini+0x14>
   100ba:	6545                	lui	a0,0x11
   100bc:	82c50513          	addi	a0,a0,-2004 # 1082c <__libc_fini_array>
   100c0:	7a00006f          	j	10860 <atexit>
   100c4:	8082                	ret

00000000000100c6 <_start>:
   100c6:	00001197          	auipc	gp,0x1
   100ca:	75a18193          	addi	gp,gp,1882 # 11820 <__global_pointer$>
   100ce:	f6018513          	addi	a0,gp,-160 # 11780 <_edata>
   100d2:	f9818613          	addi	a2,gp,-104 # 117b8 <__BSS_END__>
   100d6:	8e09                	sub	a2,a2,a0
   100d8:	4581                	li	a1,0
   100da:	5e6000ef          	jal	ra,106c0 <memset>
   100de:	00000517          	auipc	a0,0x0
   100e2:	78250513          	addi	a0,a0,1922 # 10860 <atexit>
   100e6:	c519                	beqz	a0,100f4 <_start+0x2e>
   100e8:	00000517          	auipc	a0,0x0
   100ec:	74450513          	addi	a0,a0,1860 # 1082c <__libc_fini_array>
   100f0:	770000ef          	jal	ra,10860 <atexit>
   100f4:	562000ef          	jal	ra,10656 <__libc_init_array>
   100f8:	4502                	lw	a0,0(sp)
   100fa:	002c                	addi	a1,sp,8
   100fc:	4601                	li	a2,0
   100fe:	422000ef          	jal	ra,10520 <main>
   10102:	ab1d                	j	10638 <exit>

0000000000010104 <__do_global_dtors_aux>:
   10104:	f601c703          	lbu	a4,-160(gp) # 11780 <_edata>
   10108:	eb05                	bnez	a4,10138 <__do_global_dtors_aux+0x34>
   1010a:	1141                	addi	sp,sp,-16
   1010c:	e022                	sd	s0,0(sp)
   1010e:	843e                	mv	s0,a5
   10110:	000007b7          	lui	a5,0x0
   10114:	e406                	sd	ra,8(sp)
   10116:	00078793          	mv	a5,a5
   1011a:	cb81                	beqz	a5,1012a <__do_global_dtors_aux+0x26>
   1011c:	6545                	lui	a0,0x11
   1011e:	00050513          	mv	a0,a0
   10122:	00000097          	auipc	ra,0x0
   10126:	000000e7          	jalr	zero # 0 <register_fini-0x100b0>
   1012a:	4785                	li	a5,1
   1012c:	60a2                	ld	ra,8(sp)
   1012e:	f6f18023          	sb	a5,-160(gp) # 11780 <_edata>
   10132:	6402                	ld	s0,0(sp)
   10134:	0141                	addi	sp,sp,16
   10136:	8082                	ret
   10138:	8082                	ret

000000000001013a <frame_dummy>:
   1013a:	000007b7          	lui	a5,0x0
   1013e:	00078793          	mv	a5,a5
   10142:	cb91                	beqz	a5,10156 <frame_dummy+0x1c>
   10144:	6545                	lui	a0,0x11
   10146:	f6818593          	addi	a1,gp,-152 # 11788 <object.5532>
   1014a:	00050513          	mv	a0,a0
   1014e:	00000317          	auipc	t1,0x0
   10152:	00000067          	jr	zero # 0 <register_fini-0x100b0>
   10156:	8082                	ret

0000000000010158 <Int2Str>:
   10158:	fd010113          	addi	sp,sp,-48
   1015c:	02813423          	sd	s0,40(sp)
   10160:	03010413          	addi	s0,sp,48
   10164:	00050793          	mv	a5,a0
   10168:	fcb43823          	sd	a1,-48(s0)
   1016c:	fcf42e23          	sw	a5,-36(s0)
   10170:	fe042623          	sw	zero,-20(s0)
   10174:	fe042423          	sw	zero,-24(s0)
   10178:	fdc42783          	lw	a5,-36(s0)
   1017c:	0007879b          	sext.w	a5,a5
   10180:	0007dc63          	bgez	a5,10198 <Int2Str+0x40>
   10184:	00100793          	li	a5,1
   10188:	fef42423          	sw	a5,-24(s0)
   1018c:	fdc42783          	lw	a5,-36(s0)
   10190:	40f007bb          	negw	a5,a5
   10194:	fcf42e23          	sw	a5,-36(s0)
   10198:	fdc42783          	lw	a5,-36(s0)
   1019c:	0007879b          	sext.w	a5,a5
   101a0:	06079a63          	bnez	a5,10214 <Int2Str+0xbc>
   101a4:	fec42783          	lw	a5,-20(s0)
   101a8:	0017871b          	addiw	a4,a5,1
   101ac:	fee42623          	sw	a4,-20(s0)
   101b0:	00078713          	mv	a4,a5
   101b4:	fd043783          	ld	a5,-48(s0)
   101b8:	00e787b3          	add	a5,a5,a4
   101bc:	03000713          	li	a4,48
   101c0:	00e78023          	sb	a4,0(a5) # 0 <register_fini-0x100b0>
   101c4:	fec42783          	lw	a5,-20(s0)
   101c8:	1240006f          	j	102ec <Int2Str+0x194>
   101cc:	fdc42703          	lw	a4,-36(s0)
   101d0:	00a00793          	li	a5,10
   101d4:	02f767bb          	remw	a5,a4,a5
   101d8:	0007879b          	sext.w	a5,a5
   101dc:	0ff7f713          	andi	a4,a5,255
   101e0:	fec42783          	lw	a5,-20(s0)
   101e4:	0017869b          	addiw	a3,a5,1
   101e8:	fed42623          	sw	a3,-20(s0)
   101ec:	00078693          	mv	a3,a5
   101f0:	fd043783          	ld	a5,-48(s0)
   101f4:	00d787b3          	add	a5,a5,a3
   101f8:	0307071b          	addiw	a4,a4,48
   101fc:	0ff77713          	andi	a4,a4,255
   10200:	00e78023          	sb	a4,0(a5)
   10204:	fdc42703          	lw	a4,-36(s0)
   10208:	00a00793          	li	a5,10
   1020c:	02f747bb          	divw	a5,a4,a5
   10210:	fcf42e23          	sw	a5,-36(s0)
   10214:	fdc42783          	lw	a5,-36(s0)
   10218:	0007879b          	sext.w	a5,a5
   1021c:	fa0798e3          	bnez	a5,101cc <Int2Str+0x74>
   10220:	fe842783          	lw	a5,-24(s0)
   10224:	0007879b          	sext.w	a5,a5
   10228:	02078263          	beqz	a5,1024c <Int2Str+0xf4>
   1022c:	fec42783          	lw	a5,-20(s0)
   10230:	0017871b          	addiw	a4,a5,1
   10234:	fee42623          	sw	a4,-20(s0)
   10238:	00078713          	mv	a4,a5
   1023c:	fd043783          	ld	a5,-48(s0)
   10240:	00e787b3          	add	a5,a5,a4
   10244:	02d00713          	li	a4,45
   10248:	00e78023          	sb	a4,0(a5)
   1024c:	fe042223          	sw	zero,-28(s0)
   10250:	0780006f          	j	102c8 <Int2Str+0x170>
   10254:	fe442783          	lw	a5,-28(s0)
   10258:	fd043703          	ld	a4,-48(s0)
   1025c:	00f707b3          	add	a5,a4,a5
   10260:	0007c783          	lbu	a5,0(a5)
   10264:	fef401a3          	sb	a5,-29(s0)
   10268:	fec42703          	lw	a4,-20(s0)
   1026c:	fe442783          	lw	a5,-28(s0)
   10270:	40f707bb          	subw	a5,a4,a5
   10274:	0007879b          	sext.w	a5,a5
   10278:	fff78793          	addi	a5,a5,-1
   1027c:	fd043703          	ld	a4,-48(s0)
   10280:	00f70733          	add	a4,a4,a5
   10284:	fe442783          	lw	a5,-28(s0)
   10288:	fd043683          	ld	a3,-48(s0)
   1028c:	00f687b3          	add	a5,a3,a5
   10290:	00074703          	lbu	a4,0(a4)
   10294:	00e78023          	sb	a4,0(a5)
   10298:	fec42703          	lw	a4,-20(s0)
   1029c:	fe442783          	lw	a5,-28(s0)
   102a0:	40f707bb          	subw	a5,a4,a5
   102a4:	0007879b          	sext.w	a5,a5
   102a8:	fff78793          	addi	a5,a5,-1
   102ac:	fd043703          	ld	a4,-48(s0)
   102b0:	00f707b3          	add	a5,a4,a5
   102b4:	fe344703          	lbu	a4,-29(s0)
   102b8:	00e78023          	sb	a4,0(a5)
   102bc:	fe442783          	lw	a5,-28(s0)
   102c0:	0017879b          	addiw	a5,a5,1
   102c4:	fef42223          	sw	a5,-28(s0)
   102c8:	fec42783          	lw	a5,-20(s0)
   102cc:	01f7d71b          	srliw	a4,a5,0x1f
   102d0:	00f707bb          	addw	a5,a4,a5
   102d4:	4017d79b          	sraiw	a5,a5,0x1
   102d8:	0007871b          	sext.w	a4,a5
   102dc:	fe442783          	lw	a5,-28(s0)
   102e0:	0007879b          	sext.w	a5,a5
   102e4:	f6e7c8e3          	blt	a5,a4,10254 <Int2Str+0xfc>
   102e8:	fec42783          	lw	a5,-20(s0)
   102ec:	00078513          	mv	a0,a5
   102f0:	02813403          	ld	s0,40(sp)
   102f4:	03010113          	addi	sp,sp,48
   102f8:	00008067          	ret

00000000000102fc <my_syscall>:
   102fc:	fc010113          	addi	sp,sp,-64
   10300:	02813c23          	sd	s0,56(sp)
   10304:	04010413          	addi	s0,sp,64
   10308:	fea43423          	sd	a0,-24(s0)
   1030c:	feb43023          	sd	a1,-32(s0)
   10310:	fcc43c23          	sd	a2,-40(s0)
   10314:	fcd43823          	sd	a3,-48(s0)
   10318:	fce43423          	sd	a4,-56(s0)
   1031c:	fe043503          	ld	a0,-32(s0)
   10320:	fd843583          	ld	a1,-40(s0)
   10324:	fd043603          	ld	a2,-48(s0)
   10328:	fc843683          	ld	a3,-56(s0)
   1032c:	fe843883          	ld	a7,-24(s0)
   10330:	00000073          	ecall
   10334:	00050793          	mv	a5,a0
   10338:	00078513          	mv	a0,a5
   1033c:	03813403          	ld	s0,56(sp)
   10340:	04010113          	addi	sp,sp,64
   10344:	00008067          	ret

0000000000010348 <quicksort>:
   10348:	fd010113          	addi	sp,sp,-48
   1034c:	02113423          	sd	ra,40(sp)
   10350:	02813023          	sd	s0,32(sp)
   10354:	03010413          	addi	s0,sp,48
   10358:	fca43c23          	sd	a0,-40(s0)
   1035c:	00058793          	mv	a5,a1
   10360:	00060713          	mv	a4,a2
   10364:	fcf42a23          	sw	a5,-44(s0)
   10368:	00070793          	mv	a5,a4
   1036c:	fcf42823          	sw	a5,-48(s0)
   10370:	fd442703          	lw	a4,-44(s0)
   10374:	fd042783          	lw	a5,-48(s0)
   10378:	0007071b          	sext.w	a4,a4
   1037c:	0007879b          	sext.w	a5,a5
   10380:	18f75663          	bge	a4,a5,1050c <quicksort+0x1c4>
   10384:	fd442783          	lw	a5,-44(s0)
   10388:	00279793          	slli	a5,a5,0x2
   1038c:	fd843703          	ld	a4,-40(s0)
   10390:	00f707b3          	add	a5,a4,a5
   10394:	0007a783          	lw	a5,0(a5)
   10398:	fef42223          	sw	a5,-28(s0)
   1039c:	fd442783          	lw	a5,-44(s0)
   103a0:	fef42623          	sw	a5,-20(s0)
   103a4:	fd042783          	lw	a5,-48(s0)
   103a8:	fef42423          	sw	a5,-24(s0)
   103ac:	fd442783          	lw	a5,-44(s0)
   103b0:	00279793          	slli	a5,a5,0x2
   103b4:	fd843703          	ld	a4,-40(s0)
   103b8:	00f707b3          	add	a5,a4,a5
   103bc:	0007a783          	lw	a5,0(a5)
   103c0:	fef42023          	sw	a5,-32(s0)
   103c4:	0d80006f          	j	1049c <quicksort+0x154>
   103c8:	fe842783          	lw	a5,-24(s0)
   103cc:	fff7879b          	addiw	a5,a5,-1
   103d0:	fef42423          	sw	a5,-24(s0)
   103d4:	fec42703          	lw	a4,-20(s0)
   103d8:	fe842783          	lw	a5,-24(s0)
   103dc:	0007071b          	sext.w	a4,a4
   103e0:	0007879b          	sext.w	a5,a5
   103e4:	02f75263          	bge	a4,a5,10408 <quicksort+0xc0>
   103e8:	fe842783          	lw	a5,-24(s0)
   103ec:	00279793          	slli	a5,a5,0x2
   103f0:	fd843703          	ld	a4,-40(s0)
   103f4:	00f707b3          	add	a5,a4,a5
   103f8:	0007a703          	lw	a4,0(a5)
   103fc:	fe042783          	lw	a5,-32(s0)
   10400:	0007879b          	sext.w	a5,a5
   10404:	fcf752e3          	bge	a4,a5,103c8 <quicksort+0x80>
   10408:	fe842783          	lw	a5,-24(s0)
   1040c:	00279793          	slli	a5,a5,0x2
   10410:	fd843703          	ld	a4,-40(s0)
   10414:	00f70733          	add	a4,a4,a5
   10418:	fec42783          	lw	a5,-20(s0)
   1041c:	00279793          	slli	a5,a5,0x2
   10420:	fd843683          	ld	a3,-40(s0)
   10424:	00f687b3          	add	a5,a3,a5
   10428:	00072703          	lw	a4,0(a4)
   1042c:	00e7a023          	sw	a4,0(a5)
   10430:	0100006f          	j	10440 <quicksort+0xf8>
   10434:	fec42783          	lw	a5,-20(s0)
   10438:	0017879b          	addiw	a5,a5,1
   1043c:	fef42623          	sw	a5,-20(s0)
   10440:	fec42703          	lw	a4,-20(s0)
   10444:	fe842783          	lw	a5,-24(s0)
   10448:	0007071b          	sext.w	a4,a4
   1044c:	0007879b          	sext.w	a5,a5
   10450:	02f75263          	bge	a4,a5,10474 <quicksort+0x12c>
   10454:	fec42783          	lw	a5,-20(s0)
   10458:	00279793          	slli	a5,a5,0x2
   1045c:	fd843703          	ld	a4,-40(s0)
   10460:	00f707b3          	add	a5,a4,a5
   10464:	0007a703          	lw	a4,0(a5)
   10468:	fe042783          	lw	a5,-32(s0)
   1046c:	0007879b          	sext.w	a5,a5
   10470:	fce7d2e3          	bge	a5,a4,10434 <quicksort+0xec>
   10474:	fec42783          	lw	a5,-20(s0)
   10478:	00279793          	slli	a5,a5,0x2
   1047c:	fd843703          	ld	a4,-40(s0)
   10480:	00f70733          	add	a4,a4,a5
   10484:	fe842783          	lw	a5,-24(s0)
   10488:	00279793          	slli	a5,a5,0x2
   1048c:	fd843683          	ld	a3,-40(s0)
   10490:	00f687b3          	add	a5,a3,a5
   10494:	00072703          	lw	a4,0(a4)
   10498:	00e7a023          	sw	a4,0(a5)
   1049c:	fec42703          	lw	a4,-20(s0)
   104a0:	fe842783          	lw	a5,-24(s0)
   104a4:	0007071b          	sext.w	a4,a4
   104a8:	0007879b          	sext.w	a5,a5
   104ac:	f2f744e3          	blt	a4,a5,103d4 <quicksort+0x8c>
   104b0:	fec42783          	lw	a5,-20(s0)
   104b4:	00279793          	slli	a5,a5,0x2
   104b8:	fd843703          	ld	a4,-40(s0)
   104bc:	00f707b3          	add	a5,a4,a5
   104c0:	fe442703          	lw	a4,-28(s0)
   104c4:	00e7a023          	sw	a4,0(a5)
   104c8:	fec42783          	lw	a5,-20(s0)
   104cc:	fff7879b          	addiw	a5,a5,-1
   104d0:	0007871b          	sext.w	a4,a5
   104d4:	fd442783          	lw	a5,-44(s0)
   104d8:	00070613          	mv	a2,a4
   104dc:	00078593          	mv	a1,a5
   104e0:	fd843503          	ld	a0,-40(s0)
   104e4:	e65ff0ef          	jal	ra,10348 <quicksort>
   104e8:	fec42783          	lw	a5,-20(s0)
   104ec:	0017879b          	addiw	a5,a5,1
   104f0:	0007879b          	sext.w	a5,a5
   104f4:	fd042703          	lw	a4,-48(s0)
   104f8:	00070613          	mv	a2,a4
   104fc:	00078593          	mv	a1,a5
   10500:	fd843503          	ld	a0,-40(s0)
   10504:	e45ff0ef          	jal	ra,10348 <quicksort>
   10508:	0080006f          	j	10510 <quicksort+0x1c8>
   1050c:	00000013          	nop
   10510:	02813083          	ld	ra,40(sp)
   10514:	02013403          	ld	s0,32(sp)
   10518:	03010113          	addi	sp,sp,48
   1051c:	00008067          	ret

0000000000010520 <main>:
   10520:	fa010113          	addi	sp,sp,-96
   10524:	04113c23          	sd	ra,88(sp)
   10528:	04813823          	sd	s0,80(sp)
   1052c:	06010413          	addi	s0,sp,96
   10530:	000117b7          	lui	a5,0x11
   10534:	91878793          	addi	a5,a5,-1768 # 10918 <__errno+0xc>
   10538:	0007b583          	ld	a1,0(a5)
   1053c:	0087b603          	ld	a2,8(a5)
   10540:	0107b683          	ld	a3,16(a5)
   10544:	0187b703          	ld	a4,24(a5)
   10548:	0207b783          	ld	a5,32(a5)
   1054c:	fab43423          	sd	a1,-88(s0)
   10550:	fac43823          	sd	a2,-80(s0)
   10554:	fad43c23          	sd	a3,-72(s0)
   10558:	fce43023          	sd	a4,-64(s0)
   1055c:	fcf43423          	sd	a5,-56(s0)
   10560:	fa840793          	addi	a5,s0,-88
   10564:	00900613          	li	a2,9
   10568:	00000593          	li	a1,0
   1056c:	00078513          	mv	a0,a5
   10570:	dd9ff0ef          	jal	ra,10348 <quicksort>
   10574:	fe042623          	sw	zero,-20(s0)
   10578:	0740006f          	j	105ec <main+0xcc>
   1057c:	fec42783          	lw	a5,-20(s0)
   10580:	00279793          	slli	a5,a5,0x2
   10584:	ff040713          	addi	a4,s0,-16
   10588:	00f707b3          	add	a5,a4,a5
   1058c:	fb87a783          	lw	a5,-72(a5)
   10590:	fd040713          	addi	a4,s0,-48
   10594:	00070593          	mv	a1,a4
   10598:	00078513          	mv	a0,a5
   1059c:	bbdff0ef          	jal	ra,10158 <Int2Str>
   105a0:	00050793          	mv	a5,a0
   105a4:	fef42423          	sw	a5,-24(s0)
   105a8:	fe842783          	lw	a5,-24(s0)
   105ac:	0017871b          	addiw	a4,a5,1
   105b0:	fee42423          	sw	a4,-24(s0)
   105b4:	ff040713          	addi	a4,s0,-16
   105b8:	00f707b3          	add	a5,a4,a5
   105bc:	02000713          	li	a4,32
   105c0:	fee78023          	sb	a4,-32(a5)
   105c4:	fd040793          	addi	a5,s0,-48
   105c8:	fe842683          	lw	a3,-24(s0)
   105cc:	00000713          	li	a4,0
   105d0:	00078613          	mv	a2,a5
   105d4:	00000593          	li	a1,0
   105d8:	04000513          	li	a0,64
   105dc:	d21ff0ef          	jal	ra,102fc <my_syscall>
   105e0:	fec42783          	lw	a5,-20(s0)
   105e4:	0017879b          	addiw	a5,a5,1
   105e8:	fef42623          	sw	a5,-20(s0)
   105ec:	fec42783          	lw	a5,-20(s0)
   105f0:	0007871b          	sext.w	a4,a5
   105f4:	00900793          	li	a5,9
   105f8:	f8e7d2e3          	bge	a5,a4,1057c <main+0x5c>
   105fc:	00a00793          	li	a5,10
   10600:	fcf40823          	sb	a5,-48(s0)
   10604:	fd040793          	addi	a5,s0,-48
   10608:	00000713          	li	a4,0
   1060c:	00100693          	li	a3,1
   10610:	00078613          	mv	a2,a5
   10614:	00000593          	li	a1,0
   10618:	04000513          	li	a0,64
   1061c:	ce1ff0ef          	jal	ra,102fc <my_syscall>
   10620:	00000793          	li	a5,0
   10624:	00078513          	mv	a0,a5
   10628:	05813083          	ld	ra,88(sp)
   1062c:	05013403          	ld	s0,80(sp)
   10630:	06010113          	addi	sp,sp,96
   10634:	00008067          	ret

0000000000010638 <exit>:
   10638:	1141                	addi	sp,sp,-16
   1063a:	4581                	li	a1,0
   1063c:	e022                	sd	s0,0(sp)
   1063e:	e406                	sd	ra,8(sp)
   10640:	842a                	mv	s0,a0
   10642:	128000ef          	jal	ra,1076a <__call_exitprocs>
   10646:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   1064a:	6d3c                	ld	a5,88(a0)
   1064c:	c391                	beqz	a5,10650 <exit+0x18>
   1064e:	9782                	jalr	a5
   10650:	8522                	mv	a0,s0
   10652:	28e000ef          	jal	ra,108e0 <_exit>

0000000000010656 <__libc_init_array>:
   10656:	1101                	addi	sp,sp,-32
   10658:	e822                	sd	s0,16(sp)
   1065a:	e04a                	sd	s2,0(sp)
   1065c:	6445                	lui	s0,0x11
   1065e:	6945                	lui	s2,0x11
   10660:	00440793          	addi	a5,s0,4 # 11004 <__preinit_array_end>
   10664:	00490913          	addi	s2,s2,4 # 11004 <__preinit_array_end>
   10668:	40f90933          	sub	s2,s2,a5
   1066c:	ec06                	sd	ra,24(sp)
   1066e:	e426                	sd	s1,8(sp)
   10670:	40395913          	srai	s2,s2,0x3
   10674:	00090b63          	beqz	s2,1068a <__libc_init_array+0x34>
   10678:	00440413          	addi	s0,s0,4
   1067c:	4481                	li	s1,0
   1067e:	601c                	ld	a5,0(s0)
   10680:	0485                	addi	s1,s1,1
   10682:	0421                	addi	s0,s0,8
   10684:	9782                	jalr	a5
   10686:	fe991ce3          	bne	s2,s1,1067e <__libc_init_array+0x28>
   1068a:	6445                	lui	s0,0x11
   1068c:	6945                	lui	s2,0x11
   1068e:	00840793          	addi	a5,s0,8 # 11008 <__init_array_start>
   10692:	01890913          	addi	s2,s2,24 # 11018 <__init_array_end>
   10696:	40f90933          	sub	s2,s2,a5
   1069a:	40395913          	srai	s2,s2,0x3
   1069e:	00090b63          	beqz	s2,106b4 <__libc_init_array+0x5e>
   106a2:	00840413          	addi	s0,s0,8
   106a6:	4481                	li	s1,0
   106a8:	601c                	ld	a5,0(s0)
   106aa:	0485                	addi	s1,s1,1
   106ac:	0421                	addi	s0,s0,8
   106ae:	9782                	jalr	a5
   106b0:	fe991ce3          	bne	s2,s1,106a8 <__libc_init_array+0x52>
   106b4:	60e2                	ld	ra,24(sp)
   106b6:	6442                	ld	s0,16(sp)
   106b8:	64a2                	ld	s1,8(sp)
   106ba:	6902                	ld	s2,0(sp)
   106bc:	6105                	addi	sp,sp,32
   106be:	8082                	ret

00000000000106c0 <memset>:
   106c0:	433d                	li	t1,15
   106c2:	872a                	mv	a4,a0
   106c4:	02c37163          	bgeu	t1,a2,106e6 <memset+0x26>
   106c8:	00f77793          	andi	a5,a4,15
   106cc:	e3c1                	bnez	a5,1074c <memset+0x8c>
   106ce:	e1bd                	bnez	a1,10734 <memset+0x74>
   106d0:	ff067693          	andi	a3,a2,-16
   106d4:	8a3d                	andi	a2,a2,15
   106d6:	96ba                	add	a3,a3,a4
   106d8:	e30c                	sd	a1,0(a4)
   106da:	e70c                	sd	a1,8(a4)
   106dc:	0741                	addi	a4,a4,16
   106de:	fed76de3          	bltu	a4,a3,106d8 <memset+0x18>
   106e2:	e211                	bnez	a2,106e6 <memset+0x26>
   106e4:	8082                	ret
   106e6:	40c306b3          	sub	a3,t1,a2
   106ea:	068a                	slli	a3,a3,0x2
   106ec:	00000297          	auipc	t0,0x0
   106f0:	9696                	add	a3,a3,t0
   106f2:	00a68067          	jr	10(a3)
   106f6:	00b70723          	sb	a1,14(a4)
   106fa:	00b706a3          	sb	a1,13(a4)
   106fe:	00b70623          	sb	a1,12(a4)
   10702:	00b705a3          	sb	a1,11(a4)
   10706:	00b70523          	sb	a1,10(a4)
   1070a:	00b704a3          	sb	a1,9(a4)
   1070e:	00b70423          	sb	a1,8(a4)
   10712:	00b703a3          	sb	a1,7(a4)
   10716:	00b70323          	sb	a1,6(a4)
   1071a:	00b702a3          	sb	a1,5(a4)
   1071e:	00b70223          	sb	a1,4(a4)
   10722:	00b701a3          	sb	a1,3(a4)
   10726:	00b70123          	sb	a1,2(a4)
   1072a:	00b700a3          	sb	a1,1(a4)
   1072e:	00b70023          	sb	a1,0(a4)
   10732:	8082                	ret
   10734:	0ff5f593          	andi	a1,a1,255
   10738:	00859693          	slli	a3,a1,0x8
   1073c:	8dd5                	or	a1,a1,a3
   1073e:	01059693          	slli	a3,a1,0x10
   10742:	8dd5                	or	a1,a1,a3
   10744:	02059693          	slli	a3,a1,0x20
   10748:	8dd5                	or	a1,a1,a3
   1074a:	b759                	j	106d0 <memset+0x10>
   1074c:	00279693          	slli	a3,a5,0x2
   10750:	00000297          	auipc	t0,0x0
   10754:	9696                	add	a3,a3,t0
   10756:	8286                	mv	t0,ra
   10758:	fa2680e7          	jalr	-94(a3)
   1075c:	8096                	mv	ra,t0
   1075e:	17c1                	addi	a5,a5,-16
   10760:	8f1d                	sub	a4,a4,a5
   10762:	963e                	add	a2,a2,a5
   10764:	f8c371e3          	bgeu	t1,a2,106e6 <memset+0x26>
   10768:	b79d                	j	106ce <memset+0xe>

000000000001076a <__call_exitprocs>:
   1076a:	715d                	addi	sp,sp,-80
   1076c:	f052                	sd	s4,32(sp)
   1076e:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   10772:	f84a                	sd	s2,48(sp)
   10774:	e486                	sd	ra,72(sp)
   10776:	1f8a3903          	ld	s2,504(s4)
   1077a:	e0a2                	sd	s0,64(sp)
   1077c:	fc26                	sd	s1,56(sp)
   1077e:	f44e                	sd	s3,40(sp)
   10780:	ec56                	sd	s5,24(sp)
   10782:	e85a                	sd	s6,16(sp)
   10784:	e45e                	sd	s7,8(sp)
   10786:	e062                	sd	s8,0(sp)
   10788:	02090863          	beqz	s2,107b8 <__call_exitprocs+0x4e>
   1078c:	8b2a                	mv	s6,a0
   1078e:	8bae                	mv	s7,a1
   10790:	4a85                	li	s5,1
   10792:	59fd                	li	s3,-1
   10794:	00892483          	lw	s1,8(s2)
   10798:	fff4841b          	addiw	s0,s1,-1
   1079c:	00044e63          	bltz	s0,107b8 <__call_exitprocs+0x4e>
   107a0:	048e                	slli	s1,s1,0x3
   107a2:	94ca                	add	s1,s1,s2
   107a4:	020b8663          	beqz	s7,107d0 <__call_exitprocs+0x66>
   107a8:	2084b783          	ld	a5,520(s1)
   107ac:	03778263          	beq	a5,s7,107d0 <__call_exitprocs+0x66>
   107b0:	347d                	addiw	s0,s0,-1
   107b2:	14e1                	addi	s1,s1,-8
   107b4:	ff3418e3          	bne	s0,s3,107a4 <__call_exitprocs+0x3a>
   107b8:	60a6                	ld	ra,72(sp)
   107ba:	6406                	ld	s0,64(sp)
   107bc:	74e2                	ld	s1,56(sp)
   107be:	7942                	ld	s2,48(sp)
   107c0:	79a2                	ld	s3,40(sp)
   107c2:	7a02                	ld	s4,32(sp)
   107c4:	6ae2                	ld	s5,24(sp)
   107c6:	6b42                	ld	s6,16(sp)
   107c8:	6ba2                	ld	s7,8(sp)
   107ca:	6c02                	ld	s8,0(sp)
   107cc:	6161                	addi	sp,sp,80
   107ce:	8082                	ret
   107d0:	00892783          	lw	a5,8(s2)
   107d4:	6498                	ld	a4,8(s1)
   107d6:	37fd                	addiw	a5,a5,-1
   107d8:	04878463          	beq	a5,s0,10820 <__call_exitprocs+0xb6>
   107dc:	0004b423          	sd	zero,8(s1)
   107e0:	db61                	beqz	a4,107b0 <__call_exitprocs+0x46>
   107e2:	31092783          	lw	a5,784(s2)
   107e6:	008a96bb          	sllw	a3,s5,s0
   107ea:	00892c03          	lw	s8,8(s2)
   107ee:	8ff5                	and	a5,a5,a3
   107f0:	2781                	sext.w	a5,a5
   107f2:	ef89                	bnez	a5,1080c <__call_exitprocs+0xa2>
   107f4:	9702                	jalr	a4
   107f6:	00892703          	lw	a4,8(s2)
   107fa:	1f8a3783          	ld	a5,504(s4)
   107fe:	01871463          	bne	a4,s8,10806 <__call_exitprocs+0x9c>
   10802:	faf907e3          	beq	s2,a5,107b0 <__call_exitprocs+0x46>
   10806:	dbcd                	beqz	a5,107b8 <__call_exitprocs+0x4e>
   10808:	893e                	mv	s2,a5
   1080a:	b769                	j	10794 <__call_exitprocs+0x2a>
   1080c:	31492783          	lw	a5,788(s2)
   10810:	1084b583          	ld	a1,264(s1)
   10814:	8ff5                	and	a5,a5,a3
   10816:	2781                	sext.w	a5,a5
   10818:	e799                	bnez	a5,10826 <__call_exitprocs+0xbc>
   1081a:	855a                	mv	a0,s6
   1081c:	9702                	jalr	a4
   1081e:	bfe1                	j	107f6 <__call_exitprocs+0x8c>
   10820:	00892423          	sw	s0,8(s2)
   10824:	bf75                	j	107e0 <__call_exitprocs+0x76>
   10826:	852e                	mv	a0,a1
   10828:	9702                	jalr	a4
   1082a:	b7f1                	j	107f6 <__call_exitprocs+0x8c>

000000000001082c <__libc_fini_array>:
   1082c:	1101                	addi	sp,sp,-32
   1082e:	e822                	sd	s0,16(sp)
   10830:	67c5                	lui	a5,0x11
   10832:	6445                	lui	s0,0x11
   10834:	01840413          	addi	s0,s0,24 # 11018 <__init_array_end>
   10838:	02078793          	addi	a5,a5,32 # 11020 <__fini_array_end>
   1083c:	8f81                	sub	a5,a5,s0
   1083e:	e426                	sd	s1,8(sp)
   10840:	ec06                	sd	ra,24(sp)
   10842:	4037d493          	srai	s1,a5,0x3
   10846:	c881                	beqz	s1,10856 <__libc_fini_array+0x2a>
   10848:	17e1                	addi	a5,a5,-8
   1084a:	943e                	add	s0,s0,a5
   1084c:	601c                	ld	a5,0(s0)
   1084e:	14fd                	addi	s1,s1,-1
   10850:	1461                	addi	s0,s0,-8
   10852:	9782                	jalr	a5
   10854:	fce5                	bnez	s1,1084c <__libc_fini_array+0x20>
   10856:	60e2                	ld	ra,24(sp)
   10858:	6442                	ld	s0,16(sp)
   1085a:	64a2                	ld	s1,8(sp)
   1085c:	6105                	addi	sp,sp,32
   1085e:	8082                	ret

0000000000010860 <atexit>:
   10860:	85aa                	mv	a1,a0
   10862:	4681                	li	a3,0
   10864:	4601                	li	a2,0
   10866:	4501                	li	a0,0
   10868:	a009                	j	1086a <__register_exitproc>

000000000001086a <__register_exitproc>:
   1086a:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   1086e:	1f873783          	ld	a5,504(a4)
   10872:	c3b1                	beqz	a5,108b6 <__register_exitproc+0x4c>
   10874:	4798                	lw	a4,8(a5)
   10876:	487d                	li	a6,31
   10878:	06e84263          	blt	a6,a4,108dc <__register_exitproc+0x72>
   1087c:	c505                	beqz	a0,108a4 <__register_exitproc+0x3a>
   1087e:	00371813          	slli	a6,a4,0x3
   10882:	983e                	add	a6,a6,a5
   10884:	10c83823          	sd	a2,272(a6)
   10888:	3107a883          	lw	a7,784(a5)
   1088c:	4605                	li	a2,1
   1088e:	00e6163b          	sllw	a2,a2,a4
   10892:	00c8e8b3          	or	a7,a7,a2
   10896:	3117a823          	sw	a7,784(a5)
   1089a:	20d83823          	sd	a3,528(a6)
   1089e:	4689                	li	a3,2
   108a0:	02d50063          	beq	a0,a3,108c0 <__register_exitproc+0x56>
   108a4:	00270693          	addi	a3,a4,2
   108a8:	068e                	slli	a3,a3,0x3
   108aa:	2705                	addiw	a4,a4,1
   108ac:	c798                	sw	a4,8(a5)
   108ae:	97b6                	add	a5,a5,a3
   108b0:	e38c                	sd	a1,0(a5)
   108b2:	4501                	li	a0,0
   108b4:	8082                	ret
   108b6:	20070793          	addi	a5,a4,512
   108ba:	1ef73c23          	sd	a5,504(a4)
   108be:	bf5d                	j	10874 <__register_exitproc+0xa>
   108c0:	3147a683          	lw	a3,788(a5)
   108c4:	4501                	li	a0,0
   108c6:	8e55                	or	a2,a2,a3
   108c8:	00270693          	addi	a3,a4,2
   108cc:	068e                	slli	a3,a3,0x3
   108ce:	2705                	addiw	a4,a4,1
   108d0:	30c7aa23          	sw	a2,788(a5)
   108d4:	c798                	sw	a4,8(a5)
   108d6:	97b6                	add	a5,a5,a3
   108d8:	e38c                	sd	a1,0(a5)
   108da:	8082                	ret
   108dc:	557d                	li	a0,-1
   108de:	8082                	ret

00000000000108e0 <_exit>:
   108e0:	4581                	li	a1,0
   108e2:	4601                	li	a2,0
   108e4:	4681                	li	a3,0
   108e6:	4701                	li	a4,0
   108e8:	4781                	li	a5,0
   108ea:	05d00893          	li	a7,93
   108ee:	00000073          	ecall
   108f2:	00054363          	bltz	a0,108f8 <_exit+0x18>
   108f6:	a001                	j	108f6 <_exit+0x16>
   108f8:	1141                	addi	sp,sp,-16
   108fa:	e022                	sd	s0,0(sp)
   108fc:	842a                	mv	s0,a0
   108fe:	e406                	sd	ra,8(sp)
   10900:	4080043b          	negw	s0,s0
   10904:	008000ef          	jal	ra,1090c <__errno>
   10908:	c100                	sw	s0,0(a0)
   1090a:	a001                	j	1090a <_exit+0x2a>

000000000001090c <__errno>:
   1090c:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10910:	8082                	ret

Quicksort.elf:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c791                	beqz	a5,100c4 <register_fini+0x14>
   100ba:	6545                	lui	a0,0x11
   100bc:	83450513          	addi	a0,a0,-1996 # 10834 <__libc_fini_array>
   100c0:	7a80006f          	j	10868 <atexit>
   100c4:	8082                	ret

00000000000100c6 <_start>:
   100c6:	00001197          	auipc	gp,0x1
   100ca:	75a18193          	addi	gp,gp,1882 # 11820 <__global_pointer$>
   100ce:	f6018513          	addi	a0,gp,-160 # 11780 <_edata>
   100d2:	f9818613          	addi	a2,gp,-104 # 117b8 <__BSS_END__>
   100d6:	8e09                	sub	a2,a2,a0
   100d8:	4581                	li	a1,0
   100da:	5ee000ef          	jal	ra,106c8 <memset>
   100de:	00000517          	auipc	a0,0x0
   100e2:	78a50513          	addi	a0,a0,1930 # 10868 <atexit>
   100e6:	c519                	beqz	a0,100f4 <_start+0x2e>
   100e8:	00000517          	auipc	a0,0x0
   100ec:	74c50513          	addi	a0,a0,1868 # 10834 <__libc_fini_array>
   100f0:	778000ef          	jal	ra,10868 <atexit>
   100f4:	56a000ef          	jal	ra,1065e <__libc_init_array>
   100f8:	4502                	lw	a0,0(sp)
   100fa:	002c                	addi	a1,sp,8
   100fc:	4601                	li	a2,0
   100fe:	422000ef          	jal	ra,10520 <main>
   10102:	ab3d                	j	10640 <exit>

0000000000010104 <__do_global_dtors_aux>:
   10104:	f601c703          	lbu	a4,-160(gp) # 11780 <_edata>
   10108:	eb05                	bnez	a4,10138 <__do_global_dtors_aux+0x34>
   1010a:	1141                	addi	sp,sp,-16
   1010c:	e022                	sd	s0,0(sp)
   1010e:	843e                	mv	s0,a5
   10110:	000007b7          	lui	a5,0x0
   10114:	e406                	sd	ra,8(sp)
   10116:	00078793          	mv	a5,a5
   1011a:	cb81                	beqz	a5,1012a <__do_global_dtors_aux+0x26>
   1011c:	6545                	lui	a0,0x11
   1011e:	00050513          	mv	a0,a0
   10122:	00000097          	auipc	ra,0x0
   10126:	000000e7          	jalr	zero # 0 <register_fini-0x100b0>
   1012a:	4785                	li	a5,1
   1012c:	60a2                	ld	ra,8(sp)
   1012e:	f6f18023          	sb	a5,-160(gp) # 11780 <_edata>
   10132:	6402                	ld	s0,0(sp)
   10134:	0141                	addi	sp,sp,16
   10136:	8082                	ret
   10138:	8082                	ret

000000000001013a <frame_dummy>:
   1013a:	000007b7          	lui	a5,0x0
   1013e:	00078793          	mv	a5,a5
   10142:	cb91                	beqz	a5,10156 <frame_dummy+0x1c>
   10144:	6545                	lui	a0,0x11
   10146:	f6818593          	addi	a1,gp,-152 # 11788 <object.5532>
   1014a:	00050513          	mv	a0,a0
   1014e:	00000317          	auipc	t1,0x0
   10152:	00000067          	jr	zero # 0 <register_fini-0x100b0>
   10156:	8082                	ret

0000000000010158 <Int2Str>:
   10158:	fd010113          	addi	sp,sp,-48
   1015c:	02813423          	sd	s0,40(sp)
   10160:	03010413          	addi	s0,sp,48
   10164:	00050793          	mv	a5,a0
   10168:	fcb43823          	sd	a1,-48(s0)
   1016c:	fcf42e23          	sw	a5,-36(s0)
   10170:	fe042623          	sw	zero,-20(s0)
   10174:	fe042423          	sw	zero,-24(s0)
   10178:	fdc42783          	lw	a5,-36(s0)
   1017c:	0007879b          	sext.w	a5,a5
   10180:	0007dc63          	bgez	a5,10198 <Int2Str+0x40>
   10184:	00100793          	li	a5,1
   10188:	fef42423          	sw	a5,-24(s0)
   1018c:	fdc42783          	lw	a5,-36(s0)
   10190:	40f007bb          	negw	a5,a5
   10194:	fcf42e23          	sw	a5,-36(s0)
   10198:	fdc42783          	lw	a5,-36(s0)
   1019c:	0007879b          	sext.w	a5,a5
   101a0:	06079a63          	bnez	a5,10214 <Int2Str+0xbc>
   101a4:	fec42783          	lw	a5,-20(s0)
   101a8:	0017871b          	addiw	a4,a5,1
   101ac:	fee42623          	sw	a4,-20(s0)
   101b0:	00078713          	mv	a4,a5
   101b4:	fd043783          	ld	a5,-48(s0)
   101b8:	00e787b3          	add	a5,a5,a4
   101bc:	03000713          	li	a4,48
   101c0:	00e78023          	sb	a4,0(a5) # 0 <register_fini-0x100b0>
   101c4:	fec42783          	lw	a5,-20(s0)
   101c8:	1240006f          	j	102ec <Int2Str+0x194>
   101cc:	fdc42703          	lw	a4,-36(s0)
   101d0:	00a00793          	li	a5,10
   101d4:	02f767bb          	remw	a5,a4,a5
   101d8:	0007879b          	sext.w	a5,a5
   101dc:	0ff7f713          	andi	a4,a5,255
   101e0:	fec42783          	lw	a5,-20(s0)
   101e4:	0017869b          	addiw	a3,a5,1
   101e8:	fed42623          	sw	a3,-20(s0)
   101ec:	00078693          	mv	a3,a5
   101f0:	fd043783          	ld	a5,-48(s0)
   101f4:	00d787b3          	add	a5,a5,a3
   101f8:	0307071b          	addiw	a4,a4,48
   101fc:	0ff77713          	andi	a4,a4,255
   10200:	00e78023          	sb	a4,0(a5)
   10204:	fdc42703          	lw	a4,-36(s0)
   10208:	00a00793          	li	a5,10
   1020c:	02f747bb          	divw	a5,a4,a5
   10210:	fcf42e23          	sw	a5,-36(s0)
   10214:	fdc42783          	lw	a5,-36(s0)
   10218:	0007879b          	sext.w	a5,a5
   1021c:	fa0798e3          	bnez	a5,101cc <Int2Str+0x74>
   10220:	fe842783          	lw	a5,-24(s0)
   10224:	0007879b          	sext.w	a5,a5
   10228:	02078263          	beqz	a5,1024c <Int2Str+0xf4>
   1022c:	fec42783          	lw	a5,-20(s0)
   10230:	0017871b          	addiw	a4,a5,1
   10234:	fee42623          	sw	a4,-20(s0)
   10238:	00078713          	mv	a4,a5
   1023c:	fd043783          	ld	a5,-48(s0)
   10240:	00e787b3          	add	a5,a5,a4
   10244:	02d00713          	li	a4,45
   10248:	00e78023          	sb	a4,0(a5)
   1024c:	fe042223          	sw	zero,-28(s0)
   10250:	0780006f          	j	102c8 <Int2Str+0x170>
   10254:	fe442783          	lw	a5,-28(s0)
   10258:	fd043703          	ld	a4,-48(s0)
   1025c:	00f707b3          	add	a5,a4,a5
   10260:	0007c783          	lbu	a5,0(a5)
   10264:	fef401a3          	sb	a5,-29(s0)
   10268:	fec42703          	lw	a4,-20(s0)
   1026c:	fe442783          	lw	a5,-28(s0)
   10270:	40f707bb          	subw	a5,a4,a5
   10274:	0007879b          	sext.w	a5,a5
   10278:	fff78793          	addi	a5,a5,-1
   1027c:	fd043703          	ld	a4,-48(s0)
   10280:	00f70733          	add	a4,a4,a5
   10284:	fe442783          	lw	a5,-28(s0)
   10288:	fd043683          	ld	a3,-48(s0)
   1028c:	00f687b3          	add	a5,a3,a5
   10290:	00074703          	lbu	a4,0(a4)
   10294:	00e78023          	sb	a4,0(a5)
   10298:	fec42703          	lw	a4,-20(s0)
   1029c:	fe442783          	lw	a5,-28(s0)
   102a0:	40f707bb          	subw	a5,a4,a5
   102a4:	0007879b          	sext.w	a5,a5
   102a8:	fff78793          	addi	a5,a5,-1
   102ac:	fd043703          	ld	a4,-48(s0)
   102b0:	00f707b3          	add	a5,a4,a5
   102b4:	fe344703          	lbu	a4,-29(s0)
   102b8:	00e78023          	sb	a4,0(a5)
   102bc:	fe442783          	lw	a5,-28(s0)
   102c0:	0017879b          	addiw	a5,a5,1
   102c4:	fef42223          	sw	a5,-28(s0)
   102c8:	fec42783          	lw	a5,-20(s0)
   102cc:	01f7d71b          	srliw	a4,a5,0x1f
   102d0:	00f707bb          	addw	a5,a4,a5
   102d4:	4017d79b          	sraiw	a5,a5,0x1
   102d8:	0007871b          	sext.w	a4,a5
   102dc:	fe442783          	lw	a5,-28(s0)
   102e0:	0007879b          	sext.w	a5,a5
   102e4:	f6e7c8e3          	blt	a5,a4,10254 <Int2Str+0xfc>
   102e8:	fec42783          	lw	a5,-20(s0)
   102ec:	00078513          	mv	a0,a5
   102f0:	02813403          	ld	s0,40(sp)
   102f4:	03010113          	addi	sp,sp,48
   102f8:	00008067          	ret

00000000000102fc <my_syscall>:
   102fc:	fc010113          	addi	sp,sp,-64
   10300:	02813c23          	sd	s0,56(sp)
   10304:	04010413          	addi	s0,sp,64
   10308:	fea43423          	sd	a0,-24(s0)
   1030c:	feb43023          	sd	a1,-32(s0)
   10310:	fcc43c23          	sd	a2,-40(s0)
   10314:	fcd43823          	sd	a3,-48(s0)
   10318:	fce43423          	sd	a4,-56(s0)
   1031c:	fe043503          	ld	a0,-32(s0)
   10320:	fd843583          	ld	a1,-40(s0)
   10324:	fd043603          	ld	a2,-48(s0)
   10328:	fc843683          	ld	a3,-56(s0)
   1032c:	fe843883          	ld	a7,-24(s0)
   10330:	00000073          	ecall
   10334:	00050793          	mv	a5,a0
   10338:	00078513          	mv	a0,a5
   1033c:	03813403          	ld	s0,56(sp)
   10340:	04010113          	addi	sp,sp,64
   10344:	00008067          	ret

0000000000010348 <quicksort>:
   10348:	fd010113          	addi	sp,sp,-48
   1034c:	02113423          	sd	ra,40(sp)
   10350:	02813023          	sd	s0,32(sp)
   10354:	03010413          	addi	s0,sp,48
   10358:	fca43c23          	sd	a0,-40(s0)
   1035c:	00058793          	mv	a5,a1
   10360:	00060713          	mv	a4,a2
   10364:	fcf42a23          	sw	a5,-44(s0)
   10368:	00070793          	mv	a5,a4
   1036c:	fcf42823          	sw	a5,-48(s0)
   10370:	fd442703          	lw	a4,-44(s0)
   10374:	fd042783          	lw	a5,-48(s0)
   10378:	0007071b          	sext.w	a4,a4
   1037c:	0007879b          	sext.w	a5,a5
   10380:	18f75663          	bge	a4,a5,1050c <quicksort+0x1c4>
   10384:	fd442783          	lw	a5,-44(s0)
   10388:	00279793          	slli	a5,a5,0x2
   1038c:	fd843703          	ld	a4,-40(s0)
   10390:	00f707b3          	add	a5,a4,a5
   10394:	0007a783          	lw	a5,0(a5)
   10398:	fef42223          	sw	a5,-28(s0)
   1039c:	fd442783          	lw	a5,-44(s0)
   103a0:	fef42623          	sw	a5,-20(s0)
   103a4:	fd042783          	lw	a5,-48(s0)
   103a8:	fef42423          	sw	a5,-24(s0)
   103ac:	fd442783          	lw	a5,-44(s0)
   103b0:	00279793          	slli	a5,a5,0x2
   103b4:	fd843703          	ld	a4,-40(s0)
   103b8:	00f707b3          	add	a5,a4,a5
   103bc:	0007a783          	lw	a5,0(a5)
   103c0:	fef42023          	sw	a5,-32(s0)
   103c4:	0d80006f          	j	1049c <quicksort+0x154>
   103c8:	fe842783          	lw	a5,-24(s0)
   103cc:	fff7879b          	addiw	a5,a5,-1
   103d0:	fef42423          	sw	a5,-24(s0)
   103d4:	fec42703          	lw	a4,-20(s0)
   103d8:	fe842783          	lw	a5,-24(s0)
   103dc:	0007071b          	sext.w	a4,a4
   103e0:	0007879b          	sext.w	a5,a5
   103e4:	02f75263          	bge	a4,a5,10408 <quicksort+0xc0>
   103e8:	fe842783          	lw	a5,-24(s0)
   103ec:	00279793          	slli	a5,a5,0x2
   103f0:	fd843703          	ld	a4,-40(s0)
   103f4:	00f707b3          	add	a5,a4,a5
   103f8:	0007a703          	lw	a4,0(a5)
   103fc:	fe042783          	lw	a5,-32(s0)
   10400:	0007879b          	sext.w	a5,a5
   10404:	fcf752e3          	bge	a4,a5,103c8 <quicksort+0x80>
   10408:	fe842783          	lw	a5,-24(s0)
   1040c:	00279793          	slli	a5,a5,0x2
   10410:	fd843703          	ld	a4,-40(s0)
   10414:	00f70733          	add	a4,a4,a5
   10418:	fec42783          	lw	a5,-20(s0)
   1041c:	00279793          	slli	a5,a5,0x2
   10420:	fd843683          	ld	a3,-40(s0)
   10424:	00f687b3          	add	a5,a3,a5
   10428:	00072703          	lw	a4,0(a4)
   1042c:	00e7a023          	sw	a4,0(a5)
   10430:	0100006f          	j	10440 <quicksort+0xf8>
   10434:	fec42783          	lw	a5,-20(s0)
   10438:	0017879b          	addiw	a5,a5,1
   1043c:	fef42623          	sw	a5,-20(s0)
   10440:	fec42703          	lw	a4,-20(s0)
   10444:	fe842783          	lw	a5,-24(s0)
   10448:	0007071b          	sext.w	a4,a4
   1044c:	0007879b          	sext.w	a5,a5
   10450:	02f75263          	bge	a4,a5,10474 <quicksort+0x12c>
   10454:	fec42783          	lw	a5,-20(s0)
   10458:	00279793          	slli	a5,a5,0x2
   1045c:	fd843703          	ld	a4,-40(s0)
   10460:	00f707b3          	add	a5,a4,a5
   10464:	0007a703          	lw	a4,0(a5)
   10468:	fe042783          	lw	a5,-32(s0)
   1046c:	0007879b          	sext.w	a5,a5
   10470:	fce7d2e3          	bge	a5,a4,10434 <quicksort+0xec>
   10474:	fec42783          	lw	a5,-20(s0)
   10478:	00279793          	slli	a5,a5,0x2
   1047c:	fd843703          	ld	a4,-40(s0)
   10480:	00f70733          	add	a4,a4,a5
   10484:	fe842783          	lw	a5,-24(s0)
   10488:	00279793          	slli	a5,a5,0x2
   1048c:	fd843683          	ld	a3,-40(s0)
   10490:	00f687b3          	add	a5,a3,a5
   10494:	00072703          	lw	a4,0(a4)
   10498:	00e7a023          	sw	a4,0(a5)
   1049c:	fec42703          	lw	a4,-20(s0)
   104a0:	fe842783          	lw	a5,-24(s0)
   104a4:	0007071b          	sext.w	a4,a4
   104a8:	0007879b          	sext.w	a5,a5
   104ac:	f2f744e3          	blt	a4,a5,103d4 <quicksort+0x8c>
   104b0:	fec42783          	lw	a5,-20(s0)
   104b4:	00279793          	slli	a5,a5,0x2
   104b8:	fd843703          	ld	a4,-40(s0)
   104bc:	00f707b3          	add	a5,a4,a5
   104c0:	fe442703          	lw	a4,-28(s0)
   104c4:	00e7a023          	sw	a4,0(a5)
   104c8:	fec42783          	lw	a5,-20(s0)
   104cc:	fff7879b          	addiw	a5,a5,-1
   104d0:	0007871b          	sext.w	a4,a5
   104d4:	fd442783          	lw	a5,-44(s0)
   104d8:	00070613          	mv	a2,a4
   104dc:	00078593          	mv	a1,a5
   104e0:	fd843503          	ld	a0,-40(s0)
   104e4:	e65ff0ef          	jal	ra,10348 <quicksort>
   104e8:	fec42783          	lw	a5,-20(s0)
   104ec:	0017879b          	addiw	a5,a5,1
   104f0:	0007879b          	sext.w	a5,a5
   104f4:	fd042703          	lw	a4,-48(s0)
   104f8:	00070613          	mv	a2,a4
   104fc:	00078593          	mv	a1,a5
   10500:	fd843503          	ld	a0,-40(s0)
   10504:	e45ff0ef          	jal	ra,10348 <quicksort>
   10508:	0080006f          	j	10510 <quicksort+0x1c8>
   1050c:	00000013          	nop
   10510:	02813083          	ld	ra,40(sp)
   10514:	02013403          	ld	s0,32(sp)
   10518:	03010113          	addi	sp,sp,48
   1051c:	00008067          	ret

0000000000010520 <main>:
   10520:	fa010113          	addi	sp,sp,-96
   10524:	04113c23          	sd	ra,88(sp)
   10528:	04813823          	sd	s0,80(sp)
   1052c:	06010413          	addi	s0,sp,96
   10530:	000117b7          	lui	a5,0x11
   10534:	92078793          	addi	a5,a5,-1760 # 10920 <__errno+0xc>
   10538:	0007b583          	ld	a1,0(a5)
   1053c:	0087b603          	ld	a2,8(a5)
   10540:	0107b683          	ld	a3,16(a5)
   10544:	0187b703          	ld	a4,24(a5)
   10548:	0207b783          	ld	a5,32(a5)
   1054c:	fab43423          	sd	a1,-88(s0)
   10550:	fac43823          	sd	a2,-80(s0)
   10554:	fad43c23          	sd	a3,-72(s0)
   10558:	fce43023          	sd	a4,-64(s0)
   1055c:	fcf43423          	sd	a5,-56(s0)
   10560:	fa840793          	addi	a5,s0,-88
   10564:	00900613          	li	a2,9
   10568:	00000593          	li	a1,0
   1056c:	00078513          	mv	a0,a5
   10570:	dd9ff0ef          	jal	ra,10348 <quicksort>
   10574:	fe042623          	sw	zero,-20(s0)
   10578:	07c0006f          	j	105f4 <main+0xd4>
   1057c:	fec42783          	lw	a5,-20(s0)
   10580:	00279793          	slli	a5,a5,0x2
   10584:	ff040713          	addi	a4,s0,-16
   10588:	00f707b3          	add	a5,a4,a5
   1058c:	fb87a783          	lw	a5,-72(a5)
   10590:	fd040713          	addi	a4,s0,-48
   10594:	00070593          	mv	a1,a4
   10598:	00078513          	mv	a0,a5
   1059c:	bbdff0ef          	jal	ra,10158 <Int2Str>
   105a0:	00050793          	mv	a5,a0
   105a4:	fef42423          	sw	a5,-24(s0)
   105a8:	fd040793          	addi	a5,s0,-48
   105ac:	fe842683          	lw	a3,-24(s0)
   105b0:	00000713          	li	a4,0
   105b4:	00078613          	mv	a2,a5
   105b8:	00100593          	li	a1,1
   105bc:	04000513          	li	a0,64
   105c0:	d3dff0ef          	jal	ra,102fc <my_syscall>
   105c4:	02000793          	li	a5,32
   105c8:	fcf40823          	sb	a5,-48(s0)
   105cc:	fd040793          	addi	a5,s0,-48
   105d0:	00000713          	li	a4,0
   105d4:	00100693          	li	a3,1
   105d8:	00078613          	mv	a2,a5
   105dc:	00100593          	li	a1,1
   105e0:	04000513          	li	a0,64
   105e4:	d19ff0ef          	jal	ra,102fc <my_syscall>
   105e8:	fec42783          	lw	a5,-20(s0)
   105ec:	0017879b          	addiw	a5,a5,1
   105f0:	fef42623          	sw	a5,-20(s0)
   105f4:	fec42783          	lw	a5,-20(s0)
   105f8:	0007871b          	sext.w	a4,a5
   105fc:	00900793          	li	a5,9
   10600:	f6e7dee3          	bge	a5,a4,1057c <main+0x5c>
   10604:	00a00793          	li	a5,10
   10608:	fcf40823          	sb	a5,-48(s0)
   1060c:	fd040793          	addi	a5,s0,-48
   10610:	00000713          	li	a4,0
   10614:	00100693          	li	a3,1
   10618:	00078613          	mv	a2,a5
   1061c:	00100593          	li	a1,1
   10620:	04000513          	li	a0,64
   10624:	cd9ff0ef          	jal	ra,102fc <my_syscall>
   10628:	00000793          	li	a5,0
   1062c:	00078513          	mv	a0,a5
   10630:	05813083          	ld	ra,88(sp)
   10634:	05013403          	ld	s0,80(sp)
   10638:	06010113          	addi	sp,sp,96
   1063c:	00008067          	ret

0000000000010640 <exit>:
   10640:	1141                	addi	sp,sp,-16
   10642:	4581                	li	a1,0
   10644:	e022                	sd	s0,0(sp)
   10646:	e406                	sd	ra,8(sp)
   10648:	842a                	mv	s0,a0
   1064a:	128000ef          	jal	ra,10772 <__call_exitprocs>
   1064e:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10652:	6d3c                	ld	a5,88(a0)
   10654:	c391                	beqz	a5,10658 <exit+0x18>
   10656:	9782                	jalr	a5
   10658:	8522                	mv	a0,s0
   1065a:	28e000ef          	jal	ra,108e8 <_exit>

000000000001065e <__libc_init_array>:
   1065e:	1101                	addi	sp,sp,-32
   10660:	e822                	sd	s0,16(sp)
   10662:	e04a                	sd	s2,0(sp)
   10664:	6445                	lui	s0,0x11
   10666:	6945                	lui	s2,0x11
   10668:	00440793          	addi	a5,s0,4 # 11004 <__preinit_array_end>
   1066c:	00490913          	addi	s2,s2,4 # 11004 <__preinit_array_end>
   10670:	40f90933          	sub	s2,s2,a5
   10674:	ec06                	sd	ra,24(sp)
   10676:	e426                	sd	s1,8(sp)
   10678:	40395913          	srai	s2,s2,0x3
   1067c:	00090b63          	beqz	s2,10692 <__libc_init_array+0x34>
   10680:	00440413          	addi	s0,s0,4
   10684:	4481                	li	s1,0
   10686:	601c                	ld	a5,0(s0)
   10688:	0485                	addi	s1,s1,1
   1068a:	0421                	addi	s0,s0,8
   1068c:	9782                	jalr	a5
   1068e:	fe991ce3          	bne	s2,s1,10686 <__libc_init_array+0x28>
   10692:	6445                	lui	s0,0x11
   10694:	6945                	lui	s2,0x11
   10696:	00840793          	addi	a5,s0,8 # 11008 <__init_array_start>
   1069a:	01890913          	addi	s2,s2,24 # 11018 <__init_array_end>
   1069e:	40f90933          	sub	s2,s2,a5
   106a2:	40395913          	srai	s2,s2,0x3
   106a6:	00090b63          	beqz	s2,106bc <__libc_init_array+0x5e>
   106aa:	00840413          	addi	s0,s0,8
   106ae:	4481                	li	s1,0
   106b0:	601c                	ld	a5,0(s0)
   106b2:	0485                	addi	s1,s1,1
   106b4:	0421                	addi	s0,s0,8
   106b6:	9782                	jalr	a5
   106b8:	fe991ce3          	bne	s2,s1,106b0 <__libc_init_array+0x52>
   106bc:	60e2                	ld	ra,24(sp)
   106be:	6442                	ld	s0,16(sp)
   106c0:	64a2                	ld	s1,8(sp)
   106c2:	6902                	ld	s2,0(sp)
   106c4:	6105                	addi	sp,sp,32
   106c6:	8082                	ret

00000000000106c8 <memset>:
   106c8:	433d                	li	t1,15
   106ca:	872a                	mv	a4,a0
   106cc:	02c37163          	bgeu	t1,a2,106ee <memset+0x26>
   106d0:	00f77793          	andi	a5,a4,15
   106d4:	e3c1                	bnez	a5,10754 <memset+0x8c>
   106d6:	e1bd                	bnez	a1,1073c <memset+0x74>
   106d8:	ff067693          	andi	a3,a2,-16
   106dc:	8a3d                	andi	a2,a2,15
   106de:	96ba                	add	a3,a3,a4
   106e0:	e30c                	sd	a1,0(a4)
   106e2:	e70c                	sd	a1,8(a4)
   106e4:	0741                	addi	a4,a4,16
   106e6:	fed76de3          	bltu	a4,a3,106e0 <memset+0x18>
   106ea:	e211                	bnez	a2,106ee <memset+0x26>
   106ec:	8082                	ret
   106ee:	40c306b3          	sub	a3,t1,a2
   106f2:	068a                	slli	a3,a3,0x2
   106f4:	00000297          	auipc	t0,0x0
   106f8:	9696                	add	a3,a3,t0
   106fa:	00a68067          	jr	10(a3)
   106fe:	00b70723          	sb	a1,14(a4)
   10702:	00b706a3          	sb	a1,13(a4)
   10706:	00b70623          	sb	a1,12(a4)
   1070a:	00b705a3          	sb	a1,11(a4)
   1070e:	00b70523          	sb	a1,10(a4)
   10712:	00b704a3          	sb	a1,9(a4)
   10716:	00b70423          	sb	a1,8(a4)
   1071a:	00b703a3          	sb	a1,7(a4)
   1071e:	00b70323          	sb	a1,6(a4)
   10722:	00b702a3          	sb	a1,5(a4)
   10726:	00b70223          	sb	a1,4(a4)
   1072a:	00b701a3          	sb	a1,3(a4)
   1072e:	00b70123          	sb	a1,2(a4)
   10732:	00b700a3          	sb	a1,1(a4)
   10736:	00b70023          	sb	a1,0(a4)
   1073a:	8082                	ret
   1073c:	0ff5f593          	andi	a1,a1,255
   10740:	00859693          	slli	a3,a1,0x8
   10744:	8dd5                	or	a1,a1,a3
   10746:	01059693          	slli	a3,a1,0x10
   1074a:	8dd5                	or	a1,a1,a3
   1074c:	02059693          	slli	a3,a1,0x20
   10750:	8dd5                	or	a1,a1,a3
   10752:	b759                	j	106d8 <memset+0x10>
   10754:	00279693          	slli	a3,a5,0x2
   10758:	00000297          	auipc	t0,0x0
   1075c:	9696                	add	a3,a3,t0
   1075e:	8286                	mv	t0,ra
   10760:	fa2680e7          	jalr	-94(a3)
   10764:	8096                	mv	ra,t0
   10766:	17c1                	addi	a5,a5,-16
   10768:	8f1d                	sub	a4,a4,a5
   1076a:	963e                	add	a2,a2,a5
   1076c:	f8c371e3          	bgeu	t1,a2,106ee <memset+0x26>
   10770:	b79d                	j	106d6 <memset+0xe>

0000000000010772 <__call_exitprocs>:
   10772:	715d                	addi	sp,sp,-80
   10774:	f052                	sd	s4,32(sp)
   10776:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   1077a:	f84a                	sd	s2,48(sp)
   1077c:	e486                	sd	ra,72(sp)
   1077e:	1f8a3903          	ld	s2,504(s4)
   10782:	e0a2                	sd	s0,64(sp)
   10784:	fc26                	sd	s1,56(sp)
   10786:	f44e                	sd	s3,40(sp)
   10788:	ec56                	sd	s5,24(sp)
   1078a:	e85a                	sd	s6,16(sp)
   1078c:	e45e                	sd	s7,8(sp)
   1078e:	e062                	sd	s8,0(sp)
   10790:	02090863          	beqz	s2,107c0 <__call_exitprocs+0x4e>
   10794:	8b2a                	mv	s6,a0
   10796:	8bae                	mv	s7,a1
   10798:	4a85                	li	s5,1
   1079a:	59fd                	li	s3,-1
   1079c:	00892483          	lw	s1,8(s2)
   107a0:	fff4841b          	addiw	s0,s1,-1
   107a4:	00044e63          	bltz	s0,107c0 <__call_exitprocs+0x4e>
   107a8:	048e                	slli	s1,s1,0x3
   107aa:	94ca                	add	s1,s1,s2
   107ac:	020b8663          	beqz	s7,107d8 <__call_exitprocs+0x66>
   107b0:	2084b783          	ld	a5,520(s1)
   107b4:	03778263          	beq	a5,s7,107d8 <__call_exitprocs+0x66>
   107b8:	347d                	addiw	s0,s0,-1
   107ba:	14e1                	addi	s1,s1,-8
   107bc:	ff3418e3          	bne	s0,s3,107ac <__call_exitprocs+0x3a>
   107c0:	60a6                	ld	ra,72(sp)
   107c2:	6406                	ld	s0,64(sp)
   107c4:	74e2                	ld	s1,56(sp)
   107c6:	7942                	ld	s2,48(sp)
   107c8:	79a2                	ld	s3,40(sp)
   107ca:	7a02                	ld	s4,32(sp)
   107cc:	6ae2                	ld	s5,24(sp)
   107ce:	6b42                	ld	s6,16(sp)
   107d0:	6ba2                	ld	s7,8(sp)
   107d2:	6c02                	ld	s8,0(sp)
   107d4:	6161                	addi	sp,sp,80
   107d6:	8082                	ret
   107d8:	00892783          	lw	a5,8(s2)
   107dc:	6498                	ld	a4,8(s1)
   107de:	37fd                	addiw	a5,a5,-1
   107e0:	04878463          	beq	a5,s0,10828 <__call_exitprocs+0xb6>
   107e4:	0004b423          	sd	zero,8(s1)
   107e8:	db61                	beqz	a4,107b8 <__call_exitprocs+0x46>
   107ea:	31092783          	lw	a5,784(s2)
   107ee:	008a96bb          	sllw	a3,s5,s0
   107f2:	00892c03          	lw	s8,8(s2)
   107f6:	8ff5                	and	a5,a5,a3
   107f8:	2781                	sext.w	a5,a5
   107fa:	ef89                	bnez	a5,10814 <__call_exitprocs+0xa2>
   107fc:	9702                	jalr	a4
   107fe:	00892703          	lw	a4,8(s2)
   10802:	1f8a3783          	ld	a5,504(s4)
   10806:	01871463          	bne	a4,s8,1080e <__call_exitprocs+0x9c>
   1080a:	faf907e3          	beq	s2,a5,107b8 <__call_exitprocs+0x46>
   1080e:	dbcd                	beqz	a5,107c0 <__call_exitprocs+0x4e>
   10810:	893e                	mv	s2,a5
   10812:	b769                	j	1079c <__call_exitprocs+0x2a>
   10814:	31492783          	lw	a5,788(s2)
   10818:	1084b583          	ld	a1,264(s1)
   1081c:	8ff5                	and	a5,a5,a3
   1081e:	2781                	sext.w	a5,a5
   10820:	e799                	bnez	a5,1082e <__call_exitprocs+0xbc>
   10822:	855a                	mv	a0,s6
   10824:	9702                	jalr	a4
   10826:	bfe1                	j	107fe <__call_exitprocs+0x8c>
   10828:	00892423          	sw	s0,8(s2)
   1082c:	bf75                	j	107e8 <__call_exitprocs+0x76>
   1082e:	852e                	mv	a0,a1
   10830:	9702                	jalr	a4
   10832:	b7f1                	j	107fe <__call_exitprocs+0x8c>

0000000000010834 <__libc_fini_array>:
   10834:	1101                	addi	sp,sp,-32
   10836:	e822                	sd	s0,16(sp)
   10838:	67c5                	lui	a5,0x11
   1083a:	6445                	lui	s0,0x11
   1083c:	01840413          	addi	s0,s0,24 # 11018 <__init_array_end>
   10840:	02078793          	addi	a5,a5,32 # 11020 <__fini_array_end>
   10844:	8f81                	sub	a5,a5,s0
   10846:	e426                	sd	s1,8(sp)
   10848:	ec06                	sd	ra,24(sp)
   1084a:	4037d493          	srai	s1,a5,0x3
   1084e:	c881                	beqz	s1,1085e <__libc_fini_array+0x2a>
   10850:	17e1                	addi	a5,a5,-8
   10852:	943e                	add	s0,s0,a5
   10854:	601c                	ld	a5,0(s0)
   10856:	14fd                	addi	s1,s1,-1
   10858:	1461                	addi	s0,s0,-8
   1085a:	9782                	jalr	a5
   1085c:	fce5                	bnez	s1,10854 <__libc_fini_array+0x20>
   1085e:	60e2                	ld	ra,24(sp)
   10860:	6442                	ld	s0,16(sp)
   10862:	64a2                	ld	s1,8(sp)
   10864:	6105                	addi	sp,sp,32
   10866:	8082                	ret

0000000000010868 <atexit>:
   10868:	85aa                	mv	a1,a0
   1086a:	4681                	li	a3,0
   1086c:	4601                	li	a2,0
   1086e:	4501                	li	a0,0
   10870:	a009                	j	10872 <__register_exitproc>

0000000000010872 <__register_exitproc>:
   10872:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   10876:	1f873783          	ld	a5,504(a4)
   1087a:	c3b1                	beqz	a5,108be <__register_exitproc+0x4c>
   1087c:	4798                	lw	a4,8(a5)
   1087e:	487d                	li	a6,31
   10880:	06e84263          	blt	a6,a4,108e4 <__register_exitproc+0x72>
   10884:	c505                	beqz	a0,108ac <__register_exitproc+0x3a>
   10886:	00371813          	slli	a6,a4,0x3
   1088a:	983e                	add	a6,a6,a5
   1088c:	10c83823          	sd	a2,272(a6)
   10890:	3107a883          	lw	a7,784(a5)
   10894:	4605                	li	a2,1
   10896:	00e6163b          	sllw	a2,a2,a4
   1089a:	00c8e8b3          	or	a7,a7,a2
   1089e:	3117a823          	sw	a7,784(a5)
   108a2:	20d83823          	sd	a3,528(a6)
   108a6:	4689                	li	a3,2
   108a8:	02d50063          	beq	a0,a3,108c8 <__register_exitproc+0x56>
   108ac:	00270693          	addi	a3,a4,2
   108b0:	068e                	slli	a3,a3,0x3
   108b2:	2705                	addiw	a4,a4,1
   108b4:	c798                	sw	a4,8(a5)
   108b6:	97b6                	add	a5,a5,a3
   108b8:	e38c                	sd	a1,0(a5)
   108ba:	4501                	li	a0,0
   108bc:	8082                	ret
   108be:	20070793          	addi	a5,a4,512
   108c2:	1ef73c23          	sd	a5,504(a4)
   108c6:	bf5d                	j	1087c <__register_exitproc+0xa>
   108c8:	3147a683          	lw	a3,788(a5)
   108cc:	4501                	li	a0,0
   108ce:	8e55                	or	a2,a2,a3
   108d0:	00270693          	addi	a3,a4,2
   108d4:	068e                	slli	a3,a3,0x3
   108d6:	2705                	addiw	a4,a4,1
   108d8:	30c7aa23          	sw	a2,788(a5)
   108dc:	c798                	sw	a4,8(a5)
   108de:	97b6                	add	a5,a5,a3
   108e0:	e38c                	sd	a1,0(a5)
   108e2:	8082                	ret
   108e4:	557d                	li	a0,-1
   108e6:	8082                	ret

00000000000108e8 <_exit>:
   108e8:	4581                	li	a1,0
   108ea:	4601                	li	a2,0
   108ec:	4681                	li	a3,0
   108ee:	4701                	li	a4,0
   108f0:	4781                	li	a5,0
   108f2:	05d00893          	li	a7,93
   108f6:	00000073          	ecall
   108fa:	00054363          	bltz	a0,10900 <_exit+0x18>
   108fe:	a001                	j	108fe <_exit+0x16>
   10900:	1141                	addi	sp,sp,-16
   10902:	e022                	sd	s0,0(sp)
   10904:	842a                	mv	s0,a0
   10906:	e406                	sd	ra,8(sp)
   10908:	4080043b          	negw	s0,s0
   1090c:	008000ef          	jal	ra,10914 <__errno>
   10910:	c100                	sw	s0,0(a0)
   10912:	a001                	j	10912 <_exit+0x2a>

0000000000010914 <__errno>:
   10914:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10918:	8082                	ret
