
Matrixmul.elf:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c791                	beqz	a5,100c4 <register_fini+0x14>
   100ba:	6545                	lui	a0,0x11
   100bc:	95a50513          	addi	a0,a0,-1702 # 1095a <__libc_fini_array>
   100c0:	0cf0006f          	j	1098e <atexit>
   100c4:	8082                	ret

00000000000100c6 <_start>:
   100c6:	00001197          	auipc	gp,0x1
   100ca:	75a18193          	addi	gp,gp,1882 # 11820 <__global_pointer$>
   100ce:	f6018513          	addi	a0,gp,-160 # 11780 <_edata>
   100d2:	f9818613          	addi	a2,gp,-104 # 117b8 <__BSS_END__>
   100d6:	8e09                	sub	a2,a2,a0
   100d8:	4581                	li	a1,0
   100da:	714000ef          	jal	ra,107ee <memset>
   100de:	00001517          	auipc	a0,0x1
   100e2:	8b050513          	addi	a0,a0,-1872 # 1098e <atexit>
   100e6:	c519                	beqz	a0,100f4 <_start+0x2e>
   100e8:	00001517          	auipc	a0,0x1
   100ec:	87250513          	addi	a0,a0,-1934 # 1095a <__libc_fini_array>
   100f0:	09f000ef          	jal	ra,1098e <atexit>
   100f4:	5b2000ef          	jal	ra,106a6 <__libc_init_array>
   100f8:	4502                	lw	a0,0(sp)
   100fa:	002c                	addi	a1,sp,8
   100fc:	4601                	li	a2,0
   100fe:	412000ef          	jal	ra,10510 <main>
   10102:	a359                	j	10688 <exit>

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

0000000000010348 <matrixmul>:
   10348:	fb010113          	addi	sp,sp,-80
   1034c:	04813423          	sd	s0,72(sp)
   10350:	05010413          	addi	s0,sp,80
   10354:	fca43c23          	sd	a0,-40(s0)
   10358:	fcb43823          	sd	a1,-48(s0)
   1035c:	fcc43423          	sd	a2,-56(s0)
   10360:	00068613          	mv	a2,a3
   10364:	00070693          	mv	a3,a4
   10368:	00078713          	mv	a4,a5
   1036c:	00060793          	mv	a5,a2
   10370:	fcf42223          	sw	a5,-60(s0)
   10374:	00068793          	mv	a5,a3
   10378:	fcf42023          	sw	a5,-64(s0)
   1037c:	00070793          	mv	a5,a4
   10380:	faf42e23          	sw	a5,-68(s0)
   10384:	fe042623          	sw	zero,-20(s0)
   10388:	1600006f          	j	104e8 <matrixmul+0x1a0>
   1038c:	fe042423          	sw	zero,-24(s0)
   10390:	1380006f          	j	104c8 <matrixmul+0x180>
   10394:	fec42703          	lw	a4,-20(s0)
   10398:	00070793          	mv	a5,a4
   1039c:	00279793          	slli	a5,a5,0x2
   103a0:	00e787b3          	add	a5,a5,a4
   103a4:	00279793          	slli	a5,a5,0x2
   103a8:	00078713          	mv	a4,a5
   103ac:	fc843783          	ld	a5,-56(s0)
   103b0:	00e78733          	add	a4,a5,a4
   103b4:	fe842783          	lw	a5,-24(s0)
   103b8:	00279793          	slli	a5,a5,0x2
   103bc:	00f707b3          	add	a5,a4,a5
   103c0:	0007a023          	sw	zero,0(a5)
   103c4:	fe042223          	sw	zero,-28(s0)
   103c8:	0e00006f          	j	104a8 <matrixmul+0x160>
   103cc:	fec42703          	lw	a4,-20(s0)
   103d0:	00070793          	mv	a5,a4
   103d4:	00279793          	slli	a5,a5,0x2
   103d8:	00e787b3          	add	a5,a5,a4
   103dc:	00279793          	slli	a5,a5,0x2
   103e0:	00078713          	mv	a4,a5
   103e4:	fc843783          	ld	a5,-56(s0)
   103e8:	00e78733          	add	a4,a5,a4
   103ec:	fe842783          	lw	a5,-24(s0)
   103f0:	00279793          	slli	a5,a5,0x2
   103f4:	00f707b3          	add	a5,a4,a5
   103f8:	0007a583          	lw	a1,0(a5)
   103fc:	fec42703          	lw	a4,-20(s0)
   10400:	00070793          	mv	a5,a4
   10404:	00279793          	slli	a5,a5,0x2
   10408:	00e787b3          	add	a5,a5,a4
   1040c:	00279793          	slli	a5,a5,0x2
   10410:	00078713          	mv	a4,a5
   10414:	fd843783          	ld	a5,-40(s0)
   10418:	00e78733          	add	a4,a5,a4
   1041c:	fe442783          	lw	a5,-28(s0)
   10420:	00279793          	slli	a5,a5,0x2
   10424:	00f707b3          	add	a5,a4,a5
   10428:	0007a683          	lw	a3,0(a5)
   1042c:	fe442703          	lw	a4,-28(s0)
   10430:	00070793          	mv	a5,a4
   10434:	00279793          	slli	a5,a5,0x2
   10438:	00e787b3          	add	a5,a5,a4
   1043c:	00279793          	slli	a5,a5,0x2
   10440:	00078713          	mv	a4,a5
   10444:	fd043783          	ld	a5,-48(s0)
   10448:	00e78733          	add	a4,a5,a4
   1044c:	fe842783          	lw	a5,-24(s0)
   10450:	00279793          	slli	a5,a5,0x2
   10454:	00f707b3          	add	a5,a4,a5
   10458:	0007a783          	lw	a5,0(a5)
   1045c:	02f687bb          	mulw	a5,a3,a5
   10460:	0007861b          	sext.w	a2,a5
   10464:	fec42703          	lw	a4,-20(s0)
   10468:	00070793          	mv	a5,a4
   1046c:	00279793          	slli	a5,a5,0x2
   10470:	00e787b3          	add	a5,a5,a4
   10474:	00279793          	slli	a5,a5,0x2
   10478:	00078713          	mv	a4,a5
   1047c:	fc843783          	ld	a5,-56(s0)
   10480:	00e786b3          	add	a3,a5,a4
   10484:	00c587bb          	addw	a5,a1,a2
   10488:	0007871b          	sext.w	a4,a5
   1048c:	fe842783          	lw	a5,-24(s0)
   10490:	00279793          	slli	a5,a5,0x2
   10494:	00f687b3          	add	a5,a3,a5
   10498:	00e7a023          	sw	a4,0(a5)
   1049c:	fe442783          	lw	a5,-28(s0)
   104a0:	0017879b          	addiw	a5,a5,1
   104a4:	fef42223          	sw	a5,-28(s0)
   104a8:	fe442703          	lw	a4,-28(s0)
   104ac:	fc042783          	lw	a5,-64(s0)
   104b0:	0007071b          	sext.w	a4,a4
   104b4:	0007879b          	sext.w	a5,a5
   104b8:	f0f74ae3          	blt	a4,a5,103cc <matrixmul+0x84>
   104bc:	fe842783          	lw	a5,-24(s0)
   104c0:	0017879b          	addiw	a5,a5,1
   104c4:	fef42423          	sw	a5,-24(s0)
   104c8:	fe842703          	lw	a4,-24(s0)
   104cc:	fbc42783          	lw	a5,-68(s0)
   104d0:	0007071b          	sext.w	a4,a4
   104d4:	0007879b          	sext.w	a5,a5
   104d8:	eaf74ee3          	blt	a4,a5,10394 <matrixmul+0x4c>
   104dc:	fec42783          	lw	a5,-20(s0)
   104e0:	0017879b          	addiw	a5,a5,1
   104e4:	fef42623          	sw	a5,-20(s0)
   104e8:	fec42703          	lw	a4,-20(s0)
   104ec:	fc442783          	lw	a5,-60(s0)
   104f0:	0007071b          	sext.w	a4,a4
   104f4:	0007879b          	sext.w	a5,a5
   104f8:	e8f74ae3          	blt	a4,a5,1038c <matrixmul+0x44>
   104fc:	00000013          	nop
   10500:	00000013          	nop
   10504:	04813403          	ld	s0,72(sp)
   10508:	05010113          	addi	sp,sp,80
   1050c:	00008067          	ret

0000000000010510 <main>:
   10510:	e9010113          	addi	sp,sp,-368
   10514:	16113423          	sd	ra,360(sp)
   10518:	16813023          	sd	s0,352(sp)
   1051c:	17010413          	addi	s0,sp,368
   10520:	000117b7          	lui	a5,0x11
   10524:	a4078713          	addi	a4,a5,-1472 # 10a40 <__errno+0x6>
   10528:	f8040793          	addi	a5,s0,-128
   1052c:	00070693          	mv	a3,a4
   10530:	06400713          	li	a4,100
   10534:	00070613          	mv	a2,a4
   10538:	00068593          	mv	a1,a3
   1053c:	00078513          	mv	a0,a5
   10540:	1d0000ef          	jal	ra,10710 <memcpy>
   10544:	000117b7          	lui	a5,0x11
   10548:	aa878713          	addi	a4,a5,-1368 # 10aa8 <__errno+0x6e>
   1054c:	f1840793          	addi	a5,s0,-232
   10550:	00070693          	mv	a3,a4
   10554:	06400713          	li	a4,100
   10558:	00070613          	mv	a2,a4
   1055c:	00068593          	mv	a1,a3
   10560:	00078513          	mv	a0,a5
   10564:	1ac000ef          	jal	ra,10710 <memcpy>
   10568:	eb040613          	addi	a2,s0,-336
   1056c:	f1840593          	addi	a1,s0,-232
   10570:	f8040513          	addi	a0,s0,-128
   10574:	00500793          	li	a5,5
   10578:	00500713          	li	a4,5
   1057c:	00500693          	li	a3,5
   10580:	dc9ff0ef          	jal	ra,10348 <matrixmul>
   10584:	fe042623          	sw	zero,-20(s0)
   10588:	0d80006f          	j	10660 <main+0x150>
   1058c:	fe042423          	sw	zero,-24(s0)
   10590:	0900006f          	j	10620 <main+0x110>
   10594:	fe842683          	lw	a3,-24(s0)
   10598:	fec42703          	lw	a4,-20(s0)
   1059c:	00070793          	mv	a5,a4
   105a0:	00279793          	slli	a5,a5,0x2
   105a4:	00e787b3          	add	a5,a5,a4
   105a8:	00d787b3          	add	a5,a5,a3
   105ac:	00279793          	slli	a5,a5,0x2
   105b0:	ff040713          	addi	a4,s0,-16
   105b4:	00f707b3          	add	a5,a4,a5
   105b8:	ec07a783          	lw	a5,-320(a5)
   105bc:	e9840713          	addi	a4,s0,-360
   105c0:	00070593          	mv	a1,a4
   105c4:	00078513          	mv	a0,a5
   105c8:	b91ff0ef          	jal	ra,10158 <Int2Str>
   105cc:	00050793          	mv	a5,a0
   105d0:	fef42223          	sw	a5,-28(s0)
   105d4:	e9840793          	addi	a5,s0,-360
   105d8:	fe442683          	lw	a3,-28(s0)
   105dc:	00000713          	li	a4,0
   105e0:	00078613          	mv	a2,a5
   105e4:	00100593          	li	a1,1
   105e8:	04000513          	li	a0,64
   105ec:	d11ff0ef          	jal	ra,102fc <my_syscall>
   105f0:	02000793          	li	a5,32
   105f4:	e8f40c23          	sb	a5,-360(s0)
   105f8:	e9840793          	addi	a5,s0,-360
   105fc:	00000713          	li	a4,0
   10600:	00100693          	li	a3,1
   10604:	00078613          	mv	a2,a5
   10608:	00100593          	li	a1,1
   1060c:	04000513          	li	a0,64
   10610:	cedff0ef          	jal	ra,102fc <my_syscall>
   10614:	fe842783          	lw	a5,-24(s0)
   10618:	0017879b          	addiw	a5,a5,1
   1061c:	fef42423          	sw	a5,-24(s0)
   10620:	fe842783          	lw	a5,-24(s0)
   10624:	0007871b          	sext.w	a4,a5
   10628:	00400793          	li	a5,4
   1062c:	f6e7d4e3          	bge	a5,a4,10594 <main+0x84>
   10630:	00a00793          	li	a5,10
   10634:	e8f40c23          	sb	a5,-360(s0)
   10638:	e9840793          	addi	a5,s0,-360
   1063c:	00000713          	li	a4,0
   10640:	00100693          	li	a3,1
   10644:	00078613          	mv	a2,a5
   10648:	00100593          	li	a1,1
   1064c:	04000513          	li	a0,64
   10650:	cadff0ef          	jal	ra,102fc <my_syscall>
   10654:	fec42783          	lw	a5,-20(s0)
   10658:	0017879b          	addiw	a5,a5,1
   1065c:	fef42623          	sw	a5,-20(s0)
   10660:	fec42783          	lw	a5,-20(s0)
   10664:	0007871b          	sext.w	a4,a5
   10668:	00400793          	li	a5,4
   1066c:	f2e7d0e3          	bge	a5,a4,1058c <main+0x7c>
   10670:	00000793          	li	a5,0
   10674:	00078513          	mv	a0,a5
   10678:	16813083          	ld	ra,360(sp)
   1067c:	16013403          	ld	s0,352(sp)
   10680:	17010113          	addi	sp,sp,368
   10684:	00008067          	ret

0000000000010688 <exit>:
   10688:	1141                	addi	sp,sp,-16
   1068a:	4581                	li	a1,0
   1068c:	e022                	sd	s0,0(sp)
   1068e:	e406                	sd	ra,8(sp)
   10690:	842a                	mv	s0,a0
   10692:	206000ef          	jal	ra,10898 <__call_exitprocs>
   10696:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   1069a:	6d3c                	ld	a5,88(a0)
   1069c:	c391                	beqz	a5,106a0 <exit+0x18>
   1069e:	9782                	jalr	a5
   106a0:	8522                	mv	a0,s0
   106a2:	36c000ef          	jal	ra,10a0e <_exit>

00000000000106a6 <__libc_init_array>:
   106a6:	1101                	addi	sp,sp,-32
   106a8:	e822                	sd	s0,16(sp)
   106aa:	e04a                	sd	s2,0(sp)
   106ac:	6445                	lui	s0,0x11
   106ae:	6945                	lui	s2,0x11
   106b0:	00440793          	addi	a5,s0,4 # 11004 <__preinit_array_end>
   106b4:	00490913          	addi	s2,s2,4 # 11004 <__preinit_array_end>
   106b8:	40f90933          	sub	s2,s2,a5
   106bc:	ec06                	sd	ra,24(sp)
   106be:	e426                	sd	s1,8(sp)
   106c0:	40395913          	srai	s2,s2,0x3
   106c4:	00090b63          	beqz	s2,106da <__libc_init_array+0x34>
   106c8:	00440413          	addi	s0,s0,4
   106cc:	4481                	li	s1,0
   106ce:	601c                	ld	a5,0(s0)
   106d0:	0485                	addi	s1,s1,1
   106d2:	0421                	addi	s0,s0,8
   106d4:	9782                	jalr	a5
   106d6:	fe991ce3          	bne	s2,s1,106ce <__libc_init_array+0x28>
   106da:	6445                	lui	s0,0x11
   106dc:	6945                	lui	s2,0x11
   106de:	00840793          	addi	a5,s0,8 # 11008 <__init_array_start>
   106e2:	01890913          	addi	s2,s2,24 # 11018 <__init_array_end>
   106e6:	40f90933          	sub	s2,s2,a5
   106ea:	40395913          	srai	s2,s2,0x3
   106ee:	00090b63          	beqz	s2,10704 <__libc_init_array+0x5e>
   106f2:	00840413          	addi	s0,s0,8
   106f6:	4481                	li	s1,0
   106f8:	601c                	ld	a5,0(s0)
   106fa:	0485                	addi	s1,s1,1
   106fc:	0421                	addi	s0,s0,8
   106fe:	9782                	jalr	a5
   10700:	fe991ce3          	bne	s2,s1,106f8 <__libc_init_array+0x52>
   10704:	60e2                	ld	ra,24(sp)
   10706:	6442                	ld	s0,16(sp)
   10708:	64a2                	ld	s1,8(sp)
   1070a:	6902                	ld	s2,0(sp)
   1070c:	6105                	addi	sp,sp,32
   1070e:	8082                	ret

0000000000010710 <memcpy>:
   10710:	00a5c7b3          	xor	a5,a1,a0
   10714:	8b9d                	andi	a5,a5,7
   10716:	00c508b3          	add	a7,a0,a2
   1071a:	e7a1                	bnez	a5,10762 <memcpy+0x52>
   1071c:	479d                	li	a5,7
   1071e:	04c7f263          	bgeu	a5,a2,10762 <memcpy+0x52>
   10722:	00757793          	andi	a5,a0,7
   10726:	872a                	mv	a4,a0
   10728:	eba9                	bnez	a5,1077a <memcpy+0x6a>
   1072a:	ff88f613          	andi	a2,a7,-8
   1072e:	fc060793          	addi	a5,a2,-64
   10732:	06f76763          	bltu	a4,a5,107a0 <memcpy+0x90>
   10736:	02c77363          	bgeu	a4,a2,1075c <memcpy+0x4c>
   1073a:	86ae                	mv	a3,a1
   1073c:	87ba                	mv	a5,a4
   1073e:	0006b803          	ld	a6,0(a3)
   10742:	07a1                	addi	a5,a5,8
   10744:	06a1                	addi	a3,a3,8
   10746:	ff07bc23          	sd	a6,-8(a5)
   1074a:	fec7eae3          	bltu	a5,a2,1073e <memcpy+0x2e>
   1074e:	fff60793          	addi	a5,a2,-1
   10752:	8f99                	sub	a5,a5,a4
   10754:	9be1                	andi	a5,a5,-8
   10756:	07a1                	addi	a5,a5,8
   10758:	973e                	add	a4,a4,a5
   1075a:	95be                	add	a1,a1,a5
   1075c:	01176663          	bltu	a4,a7,10768 <memcpy+0x58>
   10760:	8082                	ret
   10762:	872a                	mv	a4,a0
   10764:	ff157ee3          	bgeu	a0,a7,10760 <memcpy+0x50>
   10768:	0005c783          	lbu	a5,0(a1)
   1076c:	0705                	addi	a4,a4,1
   1076e:	0585                	addi	a1,a1,1
   10770:	fef70fa3          	sb	a5,-1(a4)
   10774:	ff176ae3          	bltu	a4,a7,10768 <memcpy+0x58>
   10778:	8082                	ret
   1077a:	0005c683          	lbu	a3,0(a1)
   1077e:	0705                	addi	a4,a4,1
   10780:	00777793          	andi	a5,a4,7
   10784:	fed70fa3          	sb	a3,-1(a4)
   10788:	0585                	addi	a1,a1,1
   1078a:	d3c5                	beqz	a5,1072a <memcpy+0x1a>
   1078c:	0005c683          	lbu	a3,0(a1)
   10790:	0705                	addi	a4,a4,1
   10792:	00777793          	andi	a5,a4,7
   10796:	fed70fa3          	sb	a3,-1(a4)
   1079a:	0585                	addi	a1,a1,1
   1079c:	fff9                	bnez	a5,1077a <memcpy+0x6a>
   1079e:	b771                	j	1072a <memcpy+0x1a>
   107a0:	6594                	ld	a3,8(a1)
   107a2:	0005b283          	ld	t0,0(a1)
   107a6:	0105bf83          	ld	t6,16(a1)
   107aa:	0185bf03          	ld	t5,24(a1)
   107ae:	0205be83          	ld	t4,32(a1)
   107b2:	0285be03          	ld	t3,40(a1)
   107b6:	0305b303          	ld	t1,48(a1)
   107ba:	0385b803          	ld	a6,56(a1)
   107be:	e714                	sd	a3,8(a4)
   107c0:	61b4                	ld	a3,64(a1)
   107c2:	00573023          	sd	t0,0(a4)
   107c6:	01f73823          	sd	t6,16(a4)
   107ca:	01e73c23          	sd	t5,24(a4)
   107ce:	03d73023          	sd	t4,32(a4)
   107d2:	03c73423          	sd	t3,40(a4)
   107d6:	02673823          	sd	t1,48(a4)
   107da:	03073c23          	sd	a6,56(a4)
   107de:	e334                	sd	a3,64(a4)
   107e0:	04870713          	addi	a4,a4,72
   107e4:	04858593          	addi	a1,a1,72
   107e8:	faf76ce3          	bltu	a4,a5,107a0 <memcpy+0x90>
   107ec:	b7a9                	j	10736 <memcpy+0x26>

00000000000107ee <memset>:
   107ee:	433d                	li	t1,15
   107f0:	872a                	mv	a4,a0
   107f2:	02c37163          	bgeu	t1,a2,10814 <memset+0x26>
   107f6:	00f77793          	andi	a5,a4,15
   107fa:	e3c1                	bnez	a5,1087a <memset+0x8c>
   107fc:	e1bd                	bnez	a1,10862 <memset+0x74>
   107fe:	ff067693          	andi	a3,a2,-16
   10802:	8a3d                	andi	a2,a2,15
   10804:	96ba                	add	a3,a3,a4
   10806:	e30c                	sd	a1,0(a4)
   10808:	e70c                	sd	a1,8(a4)
   1080a:	0741                	addi	a4,a4,16
   1080c:	fed76de3          	bltu	a4,a3,10806 <memset+0x18>
   10810:	e211                	bnez	a2,10814 <memset+0x26>
   10812:	8082                	ret
   10814:	40c306b3          	sub	a3,t1,a2
   10818:	068a                	slli	a3,a3,0x2
   1081a:	00000297          	auipc	t0,0x0
   1081e:	9696                	add	a3,a3,t0
   10820:	00a68067          	jr	10(a3)
   10824:	00b70723          	sb	a1,14(a4)
   10828:	00b706a3          	sb	a1,13(a4)
   1082c:	00b70623          	sb	a1,12(a4)
   10830:	00b705a3          	sb	a1,11(a4)
   10834:	00b70523          	sb	a1,10(a4)
   10838:	00b704a3          	sb	a1,9(a4)
   1083c:	00b70423          	sb	a1,8(a4)
   10840:	00b703a3          	sb	a1,7(a4)
   10844:	00b70323          	sb	a1,6(a4)
   10848:	00b702a3          	sb	a1,5(a4)
   1084c:	00b70223          	sb	a1,4(a4)
   10850:	00b701a3          	sb	a1,3(a4)
   10854:	00b70123          	sb	a1,2(a4)
   10858:	00b700a3          	sb	a1,1(a4)
   1085c:	00b70023          	sb	a1,0(a4)
   10860:	8082                	ret
   10862:	0ff5f593          	andi	a1,a1,255
   10866:	00859693          	slli	a3,a1,0x8
   1086a:	8dd5                	or	a1,a1,a3
   1086c:	01059693          	slli	a3,a1,0x10
   10870:	8dd5                	or	a1,a1,a3
   10872:	02059693          	slli	a3,a1,0x20
   10876:	8dd5                	or	a1,a1,a3
   10878:	b759                	j	107fe <memset+0x10>
   1087a:	00279693          	slli	a3,a5,0x2
   1087e:	00000297          	auipc	t0,0x0
   10882:	9696                	add	a3,a3,t0
   10884:	8286                	mv	t0,ra
   10886:	fa2680e7          	jalr	-94(a3)
   1088a:	8096                	mv	ra,t0
   1088c:	17c1                	addi	a5,a5,-16
   1088e:	8f1d                	sub	a4,a4,a5
   10890:	963e                	add	a2,a2,a5
   10892:	f8c371e3          	bgeu	t1,a2,10814 <memset+0x26>
   10896:	b79d                	j	107fc <memset+0xe>

0000000000010898 <__call_exitprocs>:
   10898:	715d                	addi	sp,sp,-80
   1089a:	f052                	sd	s4,32(sp)
   1089c:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   108a0:	f84a                	sd	s2,48(sp)
   108a2:	e486                	sd	ra,72(sp)
   108a4:	1f8a3903          	ld	s2,504(s4)
   108a8:	e0a2                	sd	s0,64(sp)
   108aa:	fc26                	sd	s1,56(sp)
   108ac:	f44e                	sd	s3,40(sp)
   108ae:	ec56                	sd	s5,24(sp)
   108b0:	e85a                	sd	s6,16(sp)
   108b2:	e45e                	sd	s7,8(sp)
   108b4:	e062                	sd	s8,0(sp)
   108b6:	02090863          	beqz	s2,108e6 <__call_exitprocs+0x4e>
   108ba:	8b2a                	mv	s6,a0
   108bc:	8bae                	mv	s7,a1
   108be:	4a85                	li	s5,1
   108c0:	59fd                	li	s3,-1
   108c2:	00892483          	lw	s1,8(s2)
   108c6:	fff4841b          	addiw	s0,s1,-1
   108ca:	00044e63          	bltz	s0,108e6 <__call_exitprocs+0x4e>
   108ce:	048e                	slli	s1,s1,0x3
   108d0:	94ca                	add	s1,s1,s2
   108d2:	020b8663          	beqz	s7,108fe <__call_exitprocs+0x66>
   108d6:	2084b783          	ld	a5,520(s1)
   108da:	03778263          	beq	a5,s7,108fe <__call_exitprocs+0x66>
   108de:	347d                	addiw	s0,s0,-1
   108e0:	14e1                	addi	s1,s1,-8
   108e2:	ff3418e3          	bne	s0,s3,108d2 <__call_exitprocs+0x3a>
   108e6:	60a6                	ld	ra,72(sp)
   108e8:	6406                	ld	s0,64(sp)
   108ea:	74e2                	ld	s1,56(sp)
   108ec:	7942                	ld	s2,48(sp)
   108ee:	79a2                	ld	s3,40(sp)
   108f0:	7a02                	ld	s4,32(sp)
   108f2:	6ae2                	ld	s5,24(sp)
   108f4:	6b42                	ld	s6,16(sp)
   108f6:	6ba2                	ld	s7,8(sp)
   108f8:	6c02                	ld	s8,0(sp)
   108fa:	6161                	addi	sp,sp,80
   108fc:	8082                	ret
   108fe:	00892783          	lw	a5,8(s2)
   10902:	6498                	ld	a4,8(s1)
   10904:	37fd                	addiw	a5,a5,-1
   10906:	04878463          	beq	a5,s0,1094e <__call_exitprocs+0xb6>
   1090a:	0004b423          	sd	zero,8(s1)
   1090e:	db61                	beqz	a4,108de <__call_exitprocs+0x46>
   10910:	31092783          	lw	a5,784(s2)
   10914:	008a96bb          	sllw	a3,s5,s0
   10918:	00892c03          	lw	s8,8(s2)
   1091c:	8ff5                	and	a5,a5,a3
   1091e:	2781                	sext.w	a5,a5
   10920:	ef89                	bnez	a5,1093a <__call_exitprocs+0xa2>
   10922:	9702                	jalr	a4
   10924:	00892703          	lw	a4,8(s2)
   10928:	1f8a3783          	ld	a5,504(s4)
   1092c:	01871463          	bne	a4,s8,10934 <__call_exitprocs+0x9c>
   10930:	faf907e3          	beq	s2,a5,108de <__call_exitprocs+0x46>
   10934:	dbcd                	beqz	a5,108e6 <__call_exitprocs+0x4e>
   10936:	893e                	mv	s2,a5
   10938:	b769                	j	108c2 <__call_exitprocs+0x2a>
   1093a:	31492783          	lw	a5,788(s2)
   1093e:	1084b583          	ld	a1,264(s1)
   10942:	8ff5                	and	a5,a5,a3
   10944:	2781                	sext.w	a5,a5
   10946:	e799                	bnez	a5,10954 <__call_exitprocs+0xbc>
   10948:	855a                	mv	a0,s6
   1094a:	9702                	jalr	a4
   1094c:	bfe1                	j	10924 <__call_exitprocs+0x8c>
   1094e:	00892423          	sw	s0,8(s2)
   10952:	bf75                	j	1090e <__call_exitprocs+0x76>
   10954:	852e                	mv	a0,a1
   10956:	9702                	jalr	a4
   10958:	b7f1                	j	10924 <__call_exitprocs+0x8c>

000000000001095a <__libc_fini_array>:
   1095a:	1101                	addi	sp,sp,-32
   1095c:	e822                	sd	s0,16(sp)
   1095e:	67c5                	lui	a5,0x11
   10960:	6445                	lui	s0,0x11
   10962:	01840413          	addi	s0,s0,24 # 11018 <__init_array_end>
   10966:	02078793          	addi	a5,a5,32 # 11020 <__fini_array_end>
   1096a:	8f81                	sub	a5,a5,s0
   1096c:	e426                	sd	s1,8(sp)
   1096e:	ec06                	sd	ra,24(sp)
   10970:	4037d493          	srai	s1,a5,0x3
   10974:	c881                	beqz	s1,10984 <__libc_fini_array+0x2a>
   10976:	17e1                	addi	a5,a5,-8
   10978:	943e                	add	s0,s0,a5
   1097a:	601c                	ld	a5,0(s0)
   1097c:	14fd                	addi	s1,s1,-1
   1097e:	1461                	addi	s0,s0,-8
   10980:	9782                	jalr	a5
   10982:	fce5                	bnez	s1,1097a <__libc_fini_array+0x20>
   10984:	60e2                	ld	ra,24(sp)
   10986:	6442                	ld	s0,16(sp)
   10988:	64a2                	ld	s1,8(sp)
   1098a:	6105                	addi	sp,sp,32
   1098c:	8082                	ret

000000000001098e <atexit>:
   1098e:	85aa                	mv	a1,a0
   10990:	4681                	li	a3,0
   10992:	4601                	li	a2,0
   10994:	4501                	li	a0,0
   10996:	a009                	j	10998 <__register_exitproc>

0000000000010998 <__register_exitproc>:
   10998:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   1099c:	1f873783          	ld	a5,504(a4)
   109a0:	c3b1                	beqz	a5,109e4 <__register_exitproc+0x4c>
   109a2:	4798                	lw	a4,8(a5)
   109a4:	487d                	li	a6,31
   109a6:	06e84263          	blt	a6,a4,10a0a <__register_exitproc+0x72>
   109aa:	c505                	beqz	a0,109d2 <__register_exitproc+0x3a>
   109ac:	00371813          	slli	a6,a4,0x3
   109b0:	983e                	add	a6,a6,a5
   109b2:	10c83823          	sd	a2,272(a6)
   109b6:	3107a883          	lw	a7,784(a5)
   109ba:	4605                	li	a2,1
   109bc:	00e6163b          	sllw	a2,a2,a4
   109c0:	00c8e8b3          	or	a7,a7,a2
   109c4:	3117a823          	sw	a7,784(a5)
   109c8:	20d83823          	sd	a3,528(a6)
   109cc:	4689                	li	a3,2
   109ce:	02d50063          	beq	a0,a3,109ee <__register_exitproc+0x56>
   109d2:	00270693          	addi	a3,a4,2
   109d6:	068e                	slli	a3,a3,0x3
   109d8:	2705                	addiw	a4,a4,1
   109da:	c798                	sw	a4,8(a5)
   109dc:	97b6                	add	a5,a5,a3
   109de:	e38c                	sd	a1,0(a5)
   109e0:	4501                	li	a0,0
   109e2:	8082                	ret
   109e4:	20070793          	addi	a5,a4,512
   109e8:	1ef73c23          	sd	a5,504(a4)
   109ec:	bf5d                	j	109a2 <__register_exitproc+0xa>
   109ee:	3147a683          	lw	a3,788(a5)
   109f2:	4501                	li	a0,0
   109f4:	8e55                	or	a2,a2,a3
   109f6:	00270693          	addi	a3,a4,2
   109fa:	068e                	slli	a3,a3,0x3
   109fc:	2705                	addiw	a4,a4,1
   109fe:	30c7aa23          	sw	a2,788(a5)
   10a02:	c798                	sw	a4,8(a5)
   10a04:	97b6                	add	a5,a5,a3
   10a06:	e38c                	sd	a1,0(a5)
   10a08:	8082                	ret
   10a0a:	557d                	li	a0,-1
   10a0c:	8082                	ret

0000000000010a0e <_exit>:
   10a0e:	4581                	li	a1,0
   10a10:	4601                	li	a2,0
   10a12:	4681                	li	a3,0
   10a14:	4701                	li	a4,0
   10a16:	4781                	li	a5,0
   10a18:	05d00893          	li	a7,93
   10a1c:	00000073          	ecall
   10a20:	00054363          	bltz	a0,10a26 <_exit+0x18>
   10a24:	a001                	j	10a24 <_exit+0x16>
   10a26:	1141                	addi	sp,sp,-16
   10a28:	e022                	sd	s0,0(sp)
   10a2a:	842a                	mv	s0,a0
   10a2c:	e406                	sd	ra,8(sp)
   10a2e:	4080043b          	negw	s0,s0
   10a32:	008000ef          	jal	ra,10a3a <__errno>
   10a36:	c100                	sw	s0,0(a0)
   10a38:	a001                	j	10a38 <_exit+0x2a>

0000000000010a3a <__errno>:
   10a3a:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10a3e:	8082                	ret

Matrixmul.elf:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c791                	beqz	a5,100c4 <register_fini+0x14>
   100ba:	6545                	lui	a0,0x11
   100bc:	93450513          	addi	a0,a0,-1740 # 10934 <__libc_fini_array>
   100c0:	0a90006f          	j	10968 <atexit>
   100c4:	8082                	ret

00000000000100c6 <_start>:
   100c6:	00001197          	auipc	gp,0x1
   100ca:	75a18193          	addi	gp,gp,1882 # 11820 <__global_pointer$>
   100ce:	f6018513          	addi	a0,gp,-160 # 11780 <_edata>
   100d2:	f9818613          	addi	a2,gp,-104 # 117b8 <__BSS_END__>
   100d6:	8e09                	sub	a2,a2,a0
   100d8:	4581                	li	a1,0
   100da:	6ee000ef          	jal	ra,107c8 <memset>
   100de:	00001517          	auipc	a0,0x1
   100e2:	88a50513          	addi	a0,a0,-1910 # 10968 <atexit>
   100e6:	c519                	beqz	a0,100f4 <_start+0x2e>
   100e8:	00001517          	auipc	a0,0x1
   100ec:	84c50513          	addi	a0,a0,-1972 # 10934 <__libc_fini_array>
   100f0:	079000ef          	jal	ra,10968 <atexit>
   100f4:	66a000ef          	jal	ra,1075e <__libc_init_array>
   100f8:	4502                	lw	a0,0(sp)
   100fa:	002c                	addi	a1,sp,8
   100fc:	4601                	li	a2,0
   100fe:	412000ef          	jal	ra,10510 <main>
   10102:	ad3d                	j	10740 <exit>

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

0000000000010348 <matrixmul>:
   10348:	fb010113          	addi	sp,sp,-80
   1034c:	04813423          	sd	s0,72(sp)
   10350:	05010413          	addi	s0,sp,80
   10354:	fca43c23          	sd	a0,-40(s0)
   10358:	fcb43823          	sd	a1,-48(s0)
   1035c:	fcc43423          	sd	a2,-56(s0)
   10360:	00068613          	mv	a2,a3
   10364:	00070693          	mv	a3,a4
   10368:	00078713          	mv	a4,a5
   1036c:	00060793          	mv	a5,a2
   10370:	fcf42223          	sw	a5,-60(s0)
   10374:	00068793          	mv	a5,a3
   10378:	fcf42023          	sw	a5,-64(s0)
   1037c:	00070793          	mv	a5,a4
   10380:	faf42e23          	sw	a5,-68(s0)
   10384:	fe042623          	sw	zero,-20(s0)
   10388:	1600006f          	j	104e8 <matrixmul+0x1a0>
   1038c:	fe042423          	sw	zero,-24(s0)
   10390:	1380006f          	j	104c8 <matrixmul+0x180>
   10394:	fec42703          	lw	a4,-20(s0)
   10398:	00070793          	mv	a5,a4
   1039c:	00279793          	slli	a5,a5,0x2
   103a0:	00e787b3          	add	a5,a5,a4
   103a4:	00279793          	slli	a5,a5,0x2
   103a8:	00078713          	mv	a4,a5
   103ac:	fc843783          	ld	a5,-56(s0)
   103b0:	00e78733          	add	a4,a5,a4
   103b4:	fe842783          	lw	a5,-24(s0)
   103b8:	00279793          	slli	a5,a5,0x2
   103bc:	00f707b3          	add	a5,a4,a5
   103c0:	0007a023          	sw	zero,0(a5)
   103c4:	fe042223          	sw	zero,-28(s0)
   103c8:	0e00006f          	j	104a8 <matrixmul+0x160>
   103cc:	fec42703          	lw	a4,-20(s0)
   103d0:	00070793          	mv	a5,a4
   103d4:	00279793          	slli	a5,a5,0x2
   103d8:	00e787b3          	add	a5,a5,a4
   103dc:	00279793          	slli	a5,a5,0x2
   103e0:	00078713          	mv	a4,a5
   103e4:	fc843783          	ld	a5,-56(s0)
   103e8:	00e78733          	add	a4,a5,a4
   103ec:	fe842783          	lw	a5,-24(s0)
   103f0:	00279793          	slli	a5,a5,0x2
   103f4:	00f707b3          	add	a5,a4,a5
   103f8:	0007a583          	lw	a1,0(a5)
   103fc:	fec42703          	lw	a4,-20(s0)
   10400:	00070793          	mv	a5,a4
   10404:	00279793          	slli	a5,a5,0x2
   10408:	00e787b3          	add	a5,a5,a4
   1040c:	00279793          	slli	a5,a5,0x2
   10410:	00078713          	mv	a4,a5
   10414:	fd843783          	ld	a5,-40(s0)
   10418:	00e78733          	add	a4,a5,a4
   1041c:	fe442783          	lw	a5,-28(s0)
   10420:	00279793          	slli	a5,a5,0x2
   10424:	00f707b3          	add	a5,a4,a5
   10428:	0007a683          	lw	a3,0(a5)
   1042c:	fe442703          	lw	a4,-28(s0)
   10430:	00070793          	mv	a5,a4
   10434:	00279793          	slli	a5,a5,0x2
   10438:	00e787b3          	add	a5,a5,a4
   1043c:	00279793          	slli	a5,a5,0x2
   10440:	00078713          	mv	a4,a5
   10444:	fd043783          	ld	a5,-48(s0)
   10448:	00e78733          	add	a4,a5,a4
   1044c:	fe842783          	lw	a5,-24(s0)
   10450:	00279793          	slli	a5,a5,0x2
   10454:	00f707b3          	add	a5,a4,a5
   10458:	0007a783          	lw	a5,0(a5)
   1045c:	02f687bb          	mulw	a5,a3,a5
   10460:	0007861b          	sext.w	a2,a5
   10464:	fec42703          	lw	a4,-20(s0)
   10468:	00070793          	mv	a5,a4
   1046c:	00279793          	slli	a5,a5,0x2
   10470:	00e787b3          	add	a5,a5,a4
   10474:	00279793          	slli	a5,a5,0x2
   10478:	00078713          	mv	a4,a5
   1047c:	fc843783          	ld	a5,-56(s0)
   10480:	00e786b3          	add	a3,a5,a4
   10484:	00c587bb          	addw	a5,a1,a2
   10488:	0007871b          	sext.w	a4,a5
   1048c:	fe842783          	lw	a5,-24(s0)
   10490:	00279793          	slli	a5,a5,0x2
   10494:	00f687b3          	add	a5,a3,a5
   10498:	00e7a023          	sw	a4,0(a5)
   1049c:	fe442783          	lw	a5,-28(s0)
   104a0:	0017879b          	addiw	a5,a5,1
   104a4:	fef42223          	sw	a5,-28(s0)
   104a8:	fe442703          	lw	a4,-28(s0)
   104ac:	fc042783          	lw	a5,-64(s0)
   104b0:	0007071b          	sext.w	a4,a4
   104b4:	0007879b          	sext.w	a5,a5
   104b8:	f0f74ae3          	blt	a4,a5,103cc <matrixmul+0x84>
   104bc:	fe842783          	lw	a5,-24(s0)
   104c0:	0017879b          	addiw	a5,a5,1
   104c4:	fef42423          	sw	a5,-24(s0)
   104c8:	fe842703          	lw	a4,-24(s0)
   104cc:	fbc42783          	lw	a5,-68(s0)
   104d0:	0007071b          	sext.w	a4,a4
   104d4:	0007879b          	sext.w	a5,a5
   104d8:	eaf74ee3          	blt	a4,a5,10394 <matrixmul+0x4c>
   104dc:	fec42783          	lw	a5,-20(s0)
   104e0:	0017879b          	addiw	a5,a5,1
   104e4:	fef42623          	sw	a5,-20(s0)
   104e8:	fec42703          	lw	a4,-20(s0)
   104ec:	fc442783          	lw	a5,-60(s0)
   104f0:	0007071b          	sext.w	a4,a4
   104f4:	0007879b          	sext.w	a5,a5
   104f8:	e8f74ae3          	blt	a4,a5,1038c <matrixmul+0x44>
   104fc:	00000013          	nop
   10500:	00000013          	nop
   10504:	04813403          	ld	s0,72(sp)
   10508:	05010113          	addi	sp,sp,80
   1050c:	00008067          	ret

0000000000010510 <main>:
   10510:	e9010113          	addi	sp,sp,-368
   10514:	16113423          	sd	ra,360(sp)
   10518:	16813023          	sd	s0,352(sp)
   1051c:	17010413          	addi	s0,sp,368
   10520:	fe042623          	sw	zero,-20(s0)
   10524:	0ec0006f          	j	10610 <main+0x100>
   10528:	fe042423          	sw	zero,-24(s0)
   1052c:	0c80006f          	j	105f4 <main+0xe4>
   10530:	fec42703          	lw	a4,-20(s0)
   10534:	41f7579b          	sraiw	a5,a4,0x1f
   10538:	01f7d79b          	srliw	a5,a5,0x1f
   1053c:	00f7073b          	addw	a4,a4,a5
   10540:	00177713          	andi	a4,a4,1
   10544:	40f707bb          	subw	a5,a4,a5
   10548:	0007871b          	sext.w	a4,a5
   1054c:	fe842683          	lw	a3,-24(s0)
   10550:	00300793          	li	a5,3
   10554:	02f6e7bb          	remw	a5,a3,a5
   10558:	0007879b          	sext.w	a5,a5
   1055c:	00f707bb          	addw	a5,a4,a5
   10560:	0007869b          	sext.w	a3,a5
   10564:	fe842603          	lw	a2,-24(s0)
   10568:	fec42703          	lw	a4,-20(s0)
   1056c:	00070793          	mv	a5,a4
   10570:	00279793          	slli	a5,a5,0x2
   10574:	00e787b3          	add	a5,a5,a4
   10578:	00c787b3          	add	a5,a5,a2
   1057c:	00279793          	slli	a5,a5,0x2
   10580:	ff040713          	addi	a4,s0,-16
   10584:	00f707b3          	add	a5,a4,a5
   10588:	f8d7a423          	sw	a3,-120(a5)
   1058c:	fec42703          	lw	a4,-20(s0)
   10590:	00300793          	li	a5,3
   10594:	02f767bb          	remw	a5,a4,a5
   10598:	0007869b          	sext.w	a3,a5
   1059c:	fe842703          	lw	a4,-24(s0)
   105a0:	41f7579b          	sraiw	a5,a4,0x1f
   105a4:	01f7d79b          	srliw	a5,a5,0x1f
   105a8:	00f7073b          	addw	a4,a4,a5
   105ac:	00177713          	andi	a4,a4,1
   105b0:	40f707bb          	subw	a5,a4,a5
   105b4:	0007879b          	sext.w	a5,a5
   105b8:	00f687bb          	addw	a5,a3,a5
   105bc:	0007869b          	sext.w	a3,a5
   105c0:	fe842603          	lw	a2,-24(s0)
   105c4:	fec42703          	lw	a4,-20(s0)
   105c8:	00070793          	mv	a5,a4
   105cc:	00279793          	slli	a5,a5,0x2
   105d0:	00e787b3          	add	a5,a5,a4
   105d4:	00c787b3          	add	a5,a5,a2
   105d8:	00279793          	slli	a5,a5,0x2
   105dc:	ff040713          	addi	a4,s0,-16
   105e0:	00f707b3          	add	a5,a4,a5
   105e4:	f2d7a023          	sw	a3,-224(a5)
   105e8:	fe842783          	lw	a5,-24(s0)
   105ec:	0017879b          	addiw	a5,a5,1
   105f0:	fef42423          	sw	a5,-24(s0)
   105f4:	fe842783          	lw	a5,-24(s0)
   105f8:	0007871b          	sext.w	a4,a5
   105fc:	00400793          	li	a5,4
   10600:	f2e7d8e3          	bge	a5,a4,10530 <main+0x20>
   10604:	fec42783          	lw	a5,-20(s0)
   10608:	0017879b          	addiw	a5,a5,1
   1060c:	fef42623          	sw	a5,-20(s0)
   10610:	fec42783          	lw	a5,-20(s0)
   10614:	0007871b          	sext.w	a4,a5
   10618:	00400793          	li	a5,4
   1061c:	f0e7d6e3          	bge	a5,a4,10528 <main+0x18>
   10620:	ea840613          	addi	a2,s0,-344
   10624:	f1040593          	addi	a1,s0,-240
   10628:	f7840513          	addi	a0,s0,-136
   1062c:	00500793          	li	a5,5
   10630:	00500713          	li	a4,5
   10634:	00500693          	li	a3,5
   10638:	d11ff0ef          	jal	ra,10348 <matrixmul>
   1063c:	fe042223          	sw	zero,-28(s0)
   10640:	0d80006f          	j	10718 <main+0x208>
   10644:	fe042023          	sw	zero,-32(s0)
   10648:	0900006f          	j	106d8 <main+0x1c8>
   1064c:	fe042683          	lw	a3,-32(s0)
   10650:	fe442703          	lw	a4,-28(s0)
   10654:	00070793          	mv	a5,a4
   10658:	00279793          	slli	a5,a5,0x2
   1065c:	00e787b3          	add	a5,a5,a4
   10660:	00d787b3          	add	a5,a5,a3
   10664:	00279793          	slli	a5,a5,0x2
   10668:	ff040713          	addi	a4,s0,-16
   1066c:	00f707b3          	add	a5,a4,a5
   10670:	eb87a783          	lw	a5,-328(a5)
   10674:	e9040713          	addi	a4,s0,-368
   10678:	00070593          	mv	a1,a4
   1067c:	00078513          	mv	a0,a5
   10680:	ad9ff0ef          	jal	ra,10158 <Int2Str>
   10684:	00050793          	mv	a5,a0
   10688:	fcf42e23          	sw	a5,-36(s0)
   1068c:	e9040793          	addi	a5,s0,-368
   10690:	fdc42683          	lw	a3,-36(s0)
   10694:	00000713          	li	a4,0
   10698:	00078613          	mv	a2,a5
   1069c:	00100593          	li	a1,1
   106a0:	04000513          	li	a0,64
   106a4:	c59ff0ef          	jal	ra,102fc <my_syscall>
   106a8:	02000793          	li	a5,32
   106ac:	e8f40823          	sb	a5,-368(s0)
   106b0:	e9040793          	addi	a5,s0,-368
   106b4:	00000713          	li	a4,0
   106b8:	00100693          	li	a3,1
   106bc:	00078613          	mv	a2,a5
   106c0:	00100593          	li	a1,1
   106c4:	04000513          	li	a0,64
   106c8:	c35ff0ef          	jal	ra,102fc <my_syscall>
   106cc:	fe042783          	lw	a5,-32(s0)
   106d0:	0017879b          	addiw	a5,a5,1
   106d4:	fef42023          	sw	a5,-32(s0)
   106d8:	fe042783          	lw	a5,-32(s0)
   106dc:	0007871b          	sext.w	a4,a5
   106e0:	00400793          	li	a5,4
   106e4:	f6e7d4e3          	bge	a5,a4,1064c <main+0x13c>
   106e8:	00a00793          	li	a5,10
   106ec:	e8f40823          	sb	a5,-368(s0)
   106f0:	e9040793          	addi	a5,s0,-368
   106f4:	00000713          	li	a4,0
   106f8:	00100693          	li	a3,1
   106fc:	00078613          	mv	a2,a5
   10700:	00100593          	li	a1,1
   10704:	04000513          	li	a0,64
   10708:	bf5ff0ef          	jal	ra,102fc <my_syscall>
   1070c:	fe442783          	lw	a5,-28(s0)
   10710:	0017879b          	addiw	a5,a5,1
   10714:	fef42223          	sw	a5,-28(s0)
   10718:	fe442783          	lw	a5,-28(s0)
   1071c:	0007871b          	sext.w	a4,a5
   10720:	00400793          	li	a5,4
   10724:	f2e7d0e3          	bge	a5,a4,10644 <main+0x134>
   10728:	00000793          	li	a5,0
   1072c:	00078513          	mv	a0,a5
   10730:	16813083          	ld	ra,360(sp)
   10734:	16013403          	ld	s0,352(sp)
   10738:	17010113          	addi	sp,sp,368
   1073c:	00008067          	ret

0000000000010740 <exit>:
   10740:	1141                	addi	sp,sp,-16
   10742:	4581                	li	a1,0
   10744:	e022                	sd	s0,0(sp)
   10746:	e406                	sd	ra,8(sp)
   10748:	842a                	mv	s0,a0
   1074a:	128000ef          	jal	ra,10872 <__call_exitprocs>
   1074e:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10752:	6d3c                	ld	a5,88(a0)
   10754:	c391                	beqz	a5,10758 <exit+0x18>
   10756:	9782                	jalr	a5
   10758:	8522                	mv	a0,s0
   1075a:	28e000ef          	jal	ra,109e8 <_exit>

000000000001075e <__libc_init_array>:
   1075e:	1101                	addi	sp,sp,-32
   10760:	e822                	sd	s0,16(sp)
   10762:	e04a                	sd	s2,0(sp)
   10764:	6445                	lui	s0,0x11
   10766:	6945                	lui	s2,0x11
   10768:	00440793          	addi	a5,s0,4 # 11004 <__preinit_array_end>
   1076c:	00490913          	addi	s2,s2,4 # 11004 <__preinit_array_end>
   10770:	40f90933          	sub	s2,s2,a5
   10774:	ec06                	sd	ra,24(sp)
   10776:	e426                	sd	s1,8(sp)
   10778:	40395913          	srai	s2,s2,0x3
   1077c:	00090b63          	beqz	s2,10792 <__libc_init_array+0x34>
   10780:	00440413          	addi	s0,s0,4
   10784:	4481                	li	s1,0
   10786:	601c                	ld	a5,0(s0)
   10788:	0485                	addi	s1,s1,1
   1078a:	0421                	addi	s0,s0,8
   1078c:	9782                	jalr	a5
   1078e:	fe991ce3          	bne	s2,s1,10786 <__libc_init_array+0x28>
   10792:	6445                	lui	s0,0x11
   10794:	6945                	lui	s2,0x11
   10796:	00840793          	addi	a5,s0,8 # 11008 <__init_array_start>
   1079a:	01890913          	addi	s2,s2,24 # 11018 <__init_array_end>
   1079e:	40f90933          	sub	s2,s2,a5
   107a2:	40395913          	srai	s2,s2,0x3
   107a6:	00090b63          	beqz	s2,107bc <__libc_init_array+0x5e>
   107aa:	00840413          	addi	s0,s0,8
   107ae:	4481                	li	s1,0
   107b0:	601c                	ld	a5,0(s0)
   107b2:	0485                	addi	s1,s1,1
   107b4:	0421                	addi	s0,s0,8
   107b6:	9782                	jalr	a5
   107b8:	fe991ce3          	bne	s2,s1,107b0 <__libc_init_array+0x52>
   107bc:	60e2                	ld	ra,24(sp)
   107be:	6442                	ld	s0,16(sp)
   107c0:	64a2                	ld	s1,8(sp)
   107c2:	6902                	ld	s2,0(sp)
   107c4:	6105                	addi	sp,sp,32
   107c6:	8082                	ret

00000000000107c8 <memset>:
   107c8:	433d                	li	t1,15
   107ca:	872a                	mv	a4,a0
   107cc:	02c37163          	bgeu	t1,a2,107ee <memset+0x26>
   107d0:	00f77793          	andi	a5,a4,15
   107d4:	e3c1                	bnez	a5,10854 <memset+0x8c>
   107d6:	e1bd                	bnez	a1,1083c <memset+0x74>
   107d8:	ff067693          	andi	a3,a2,-16
   107dc:	8a3d                	andi	a2,a2,15
   107de:	96ba                	add	a3,a3,a4
   107e0:	e30c                	sd	a1,0(a4)
   107e2:	e70c                	sd	a1,8(a4)
   107e4:	0741                	addi	a4,a4,16
   107e6:	fed76de3          	bltu	a4,a3,107e0 <memset+0x18>
   107ea:	e211                	bnez	a2,107ee <memset+0x26>
   107ec:	8082                	ret
   107ee:	40c306b3          	sub	a3,t1,a2
   107f2:	068a                	slli	a3,a3,0x2
   107f4:	00000297          	auipc	t0,0x0
   107f8:	9696                	add	a3,a3,t0
   107fa:	00a68067          	jr	10(a3)
   107fe:	00b70723          	sb	a1,14(a4)
   10802:	00b706a3          	sb	a1,13(a4)
   10806:	00b70623          	sb	a1,12(a4)
   1080a:	00b705a3          	sb	a1,11(a4)
   1080e:	00b70523          	sb	a1,10(a4)
   10812:	00b704a3          	sb	a1,9(a4)
   10816:	00b70423          	sb	a1,8(a4)
   1081a:	00b703a3          	sb	a1,7(a4)
   1081e:	00b70323          	sb	a1,6(a4)
   10822:	00b702a3          	sb	a1,5(a4)
   10826:	00b70223          	sb	a1,4(a4)
   1082a:	00b701a3          	sb	a1,3(a4)
   1082e:	00b70123          	sb	a1,2(a4)
   10832:	00b700a3          	sb	a1,1(a4)
   10836:	00b70023          	sb	a1,0(a4)
   1083a:	8082                	ret
   1083c:	0ff5f593          	andi	a1,a1,255
   10840:	00859693          	slli	a3,a1,0x8
   10844:	8dd5                	or	a1,a1,a3
   10846:	01059693          	slli	a3,a1,0x10
   1084a:	8dd5                	or	a1,a1,a3
   1084c:	02059693          	slli	a3,a1,0x20
   10850:	8dd5                	or	a1,a1,a3
   10852:	b759                	j	107d8 <memset+0x10>
   10854:	00279693          	slli	a3,a5,0x2
   10858:	00000297          	auipc	t0,0x0
   1085c:	9696                	add	a3,a3,t0
   1085e:	8286                	mv	t0,ra
   10860:	fa2680e7          	jalr	-94(a3)
   10864:	8096                	mv	ra,t0
   10866:	17c1                	addi	a5,a5,-16
   10868:	8f1d                	sub	a4,a4,a5
   1086a:	963e                	add	a2,a2,a5
   1086c:	f8c371e3          	bgeu	t1,a2,107ee <memset+0x26>
   10870:	b79d                	j	107d6 <memset+0xe>

0000000000010872 <__call_exitprocs>:
   10872:	715d                	addi	sp,sp,-80
   10874:	f052                	sd	s4,32(sp)
   10876:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   1087a:	f84a                	sd	s2,48(sp)
   1087c:	e486                	sd	ra,72(sp)
   1087e:	1f8a3903          	ld	s2,504(s4)
   10882:	e0a2                	sd	s0,64(sp)
   10884:	fc26                	sd	s1,56(sp)
   10886:	f44e                	sd	s3,40(sp)
   10888:	ec56                	sd	s5,24(sp)
   1088a:	e85a                	sd	s6,16(sp)
   1088c:	e45e                	sd	s7,8(sp)
   1088e:	e062                	sd	s8,0(sp)
   10890:	02090863          	beqz	s2,108c0 <__call_exitprocs+0x4e>
   10894:	8b2a                	mv	s6,a0
   10896:	8bae                	mv	s7,a1
   10898:	4a85                	li	s5,1
   1089a:	59fd                	li	s3,-1
   1089c:	00892483          	lw	s1,8(s2)
   108a0:	fff4841b          	addiw	s0,s1,-1
   108a4:	00044e63          	bltz	s0,108c0 <__call_exitprocs+0x4e>
   108a8:	048e                	slli	s1,s1,0x3
   108aa:	94ca                	add	s1,s1,s2
   108ac:	020b8663          	beqz	s7,108d8 <__call_exitprocs+0x66>
   108b0:	2084b783          	ld	a5,520(s1)
   108b4:	03778263          	beq	a5,s7,108d8 <__call_exitprocs+0x66>
   108b8:	347d                	addiw	s0,s0,-1
   108ba:	14e1                	addi	s1,s1,-8
   108bc:	ff3418e3          	bne	s0,s3,108ac <__call_exitprocs+0x3a>
   108c0:	60a6                	ld	ra,72(sp)
   108c2:	6406                	ld	s0,64(sp)
   108c4:	74e2                	ld	s1,56(sp)
   108c6:	7942                	ld	s2,48(sp)
   108c8:	79a2                	ld	s3,40(sp)
   108ca:	7a02                	ld	s4,32(sp)
   108cc:	6ae2                	ld	s5,24(sp)
   108ce:	6b42                	ld	s6,16(sp)
   108d0:	6ba2                	ld	s7,8(sp)
   108d2:	6c02                	ld	s8,0(sp)
   108d4:	6161                	addi	sp,sp,80
   108d6:	8082                	ret
   108d8:	00892783          	lw	a5,8(s2)
   108dc:	6498                	ld	a4,8(s1)
   108de:	37fd                	addiw	a5,a5,-1
   108e0:	04878463          	beq	a5,s0,10928 <__call_exitprocs+0xb6>
   108e4:	0004b423          	sd	zero,8(s1)
   108e8:	db61                	beqz	a4,108b8 <__call_exitprocs+0x46>
   108ea:	31092783          	lw	a5,784(s2)
   108ee:	008a96bb          	sllw	a3,s5,s0
   108f2:	00892c03          	lw	s8,8(s2)
   108f6:	8ff5                	and	a5,a5,a3
   108f8:	2781                	sext.w	a5,a5
   108fa:	ef89                	bnez	a5,10914 <__call_exitprocs+0xa2>
   108fc:	9702                	jalr	a4
   108fe:	00892703          	lw	a4,8(s2)
   10902:	1f8a3783          	ld	a5,504(s4)
   10906:	01871463          	bne	a4,s8,1090e <__call_exitprocs+0x9c>
   1090a:	faf907e3          	beq	s2,a5,108b8 <__call_exitprocs+0x46>
   1090e:	dbcd                	beqz	a5,108c0 <__call_exitprocs+0x4e>
   10910:	893e                	mv	s2,a5
   10912:	b769                	j	1089c <__call_exitprocs+0x2a>
   10914:	31492783          	lw	a5,788(s2)
   10918:	1084b583          	ld	a1,264(s1)
   1091c:	8ff5                	and	a5,a5,a3
   1091e:	2781                	sext.w	a5,a5
   10920:	e799                	bnez	a5,1092e <__call_exitprocs+0xbc>
   10922:	855a                	mv	a0,s6
   10924:	9702                	jalr	a4
   10926:	bfe1                	j	108fe <__call_exitprocs+0x8c>
   10928:	00892423          	sw	s0,8(s2)
   1092c:	bf75                	j	108e8 <__call_exitprocs+0x76>
   1092e:	852e                	mv	a0,a1
   10930:	9702                	jalr	a4
   10932:	b7f1                	j	108fe <__call_exitprocs+0x8c>

0000000000010934 <__libc_fini_array>:
   10934:	1101                	addi	sp,sp,-32
   10936:	e822                	sd	s0,16(sp)
   10938:	67c5                	lui	a5,0x11
   1093a:	6445                	lui	s0,0x11
   1093c:	01840413          	addi	s0,s0,24 # 11018 <__init_array_end>
   10940:	02078793          	addi	a5,a5,32 # 11020 <__fini_array_end>
   10944:	8f81                	sub	a5,a5,s0
   10946:	e426                	sd	s1,8(sp)
   10948:	ec06                	sd	ra,24(sp)
   1094a:	4037d493          	srai	s1,a5,0x3
   1094e:	c881                	beqz	s1,1095e <__libc_fini_array+0x2a>
   10950:	17e1                	addi	a5,a5,-8
   10952:	943e                	add	s0,s0,a5
   10954:	601c                	ld	a5,0(s0)
   10956:	14fd                	addi	s1,s1,-1
   10958:	1461                	addi	s0,s0,-8
   1095a:	9782                	jalr	a5
   1095c:	fce5                	bnez	s1,10954 <__libc_fini_array+0x20>
   1095e:	60e2                	ld	ra,24(sp)
   10960:	6442                	ld	s0,16(sp)
   10962:	64a2                	ld	s1,8(sp)
   10964:	6105                	addi	sp,sp,32
   10966:	8082                	ret

0000000000010968 <atexit>:
   10968:	85aa                	mv	a1,a0
   1096a:	4681                	li	a3,0
   1096c:	4601                	li	a2,0
   1096e:	4501                	li	a0,0
   10970:	a009                	j	10972 <__register_exitproc>

0000000000010972 <__register_exitproc>:
   10972:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   10976:	1f873783          	ld	a5,504(a4)
   1097a:	c3b1                	beqz	a5,109be <__register_exitproc+0x4c>
   1097c:	4798                	lw	a4,8(a5)
   1097e:	487d                	li	a6,31
   10980:	06e84263          	blt	a6,a4,109e4 <__register_exitproc+0x72>
   10984:	c505                	beqz	a0,109ac <__register_exitproc+0x3a>
   10986:	00371813          	slli	a6,a4,0x3
   1098a:	983e                	add	a6,a6,a5
   1098c:	10c83823          	sd	a2,272(a6)
   10990:	3107a883          	lw	a7,784(a5)
   10994:	4605                	li	a2,1
   10996:	00e6163b          	sllw	a2,a2,a4
   1099a:	00c8e8b3          	or	a7,a7,a2
   1099e:	3117a823          	sw	a7,784(a5)
   109a2:	20d83823          	sd	a3,528(a6)
   109a6:	4689                	li	a3,2
   109a8:	02d50063          	beq	a0,a3,109c8 <__register_exitproc+0x56>
   109ac:	00270693          	addi	a3,a4,2
   109b0:	068e                	slli	a3,a3,0x3
   109b2:	2705                	addiw	a4,a4,1
   109b4:	c798                	sw	a4,8(a5)
   109b6:	97b6                	add	a5,a5,a3
   109b8:	e38c                	sd	a1,0(a5)
   109ba:	4501                	li	a0,0
   109bc:	8082                	ret
   109be:	20070793          	addi	a5,a4,512
   109c2:	1ef73c23          	sd	a5,504(a4)
   109c6:	bf5d                	j	1097c <__register_exitproc+0xa>
   109c8:	3147a683          	lw	a3,788(a5)
   109cc:	4501                	li	a0,0
   109ce:	8e55                	or	a2,a2,a3
   109d0:	00270693          	addi	a3,a4,2
   109d4:	068e                	slli	a3,a3,0x3
   109d6:	2705                	addiw	a4,a4,1
   109d8:	30c7aa23          	sw	a2,788(a5)
   109dc:	c798                	sw	a4,8(a5)
   109de:	97b6                	add	a5,a5,a3
   109e0:	e38c                	sd	a1,0(a5)
   109e2:	8082                	ret
   109e4:	557d                	li	a0,-1
   109e6:	8082                	ret

00000000000109e8 <_exit>:
   109e8:	4581                	li	a1,0
   109ea:	4601                	li	a2,0
   109ec:	4681                	li	a3,0
   109ee:	4701                	li	a4,0
   109f0:	4781                	li	a5,0
   109f2:	05d00893          	li	a7,93
   109f6:	00000073          	ecall
   109fa:	00054363          	bltz	a0,10a00 <_exit+0x18>
   109fe:	a001                	j	109fe <_exit+0x16>
   10a00:	1141                	addi	sp,sp,-16
   10a02:	e022                	sd	s0,0(sp)
   10a04:	842a                	mv	s0,a0
   10a06:	e406                	sd	ra,8(sp)
   10a08:	4080043b          	negw	s0,s0
   10a0c:	008000ef          	jal	ra,10a14 <__errno>
   10a10:	c100                	sw	s0,0(a0)
   10a12:	a001                	j	10a12 <_exit+0x2a>

0000000000010a14 <__errno>:
   10a14:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10a18:	8082                	ret

Matrixmul.elf:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c791                	beqz	a5,100c4 <register_fini+0x14>
   100ba:	6545                	lui	a0,0x11
   100bc:	93450513          	addi	a0,a0,-1740 # 10934 <__libc_fini_array>
   100c0:	0a90006f          	j	10968 <atexit>
   100c4:	8082                	ret

00000000000100c6 <_start>:
   100c6:	00001197          	auipc	gp,0x1
   100ca:	75a18193          	addi	gp,gp,1882 # 11820 <__global_pointer$>
   100ce:	f6018513          	addi	a0,gp,-160 # 11780 <_edata>
   100d2:	f9818613          	addi	a2,gp,-104 # 117b8 <__BSS_END__>
   100d6:	8e09                	sub	a2,a2,a0
   100d8:	4581                	li	a1,0
   100da:	6ee000ef          	jal	ra,107c8 <memset>
   100de:	00001517          	auipc	a0,0x1
   100e2:	88a50513          	addi	a0,a0,-1910 # 10968 <atexit>
   100e6:	c519                	beqz	a0,100f4 <_start+0x2e>
   100e8:	00001517          	auipc	a0,0x1
   100ec:	84c50513          	addi	a0,a0,-1972 # 10934 <__libc_fini_array>
   100f0:	079000ef          	jal	ra,10968 <atexit>
   100f4:	66a000ef          	jal	ra,1075e <__libc_init_array>
   100f8:	4502                	lw	a0,0(sp)
   100fa:	002c                	addi	a1,sp,8
   100fc:	4601                	li	a2,0
   100fe:	412000ef          	jal	ra,10510 <main>
   10102:	ad3d                	j	10740 <exit>

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

0000000000010348 <matrixmul>:
   10348:	fb010113          	addi	sp,sp,-80
   1034c:	04813423          	sd	s0,72(sp)
   10350:	05010413          	addi	s0,sp,80
   10354:	fca43c23          	sd	a0,-40(s0)
   10358:	fcb43823          	sd	a1,-48(s0)
   1035c:	fcc43423          	sd	a2,-56(s0)
   10360:	00068613          	mv	a2,a3
   10364:	00070693          	mv	a3,a4
   10368:	00078713          	mv	a4,a5
   1036c:	00060793          	mv	a5,a2
   10370:	fcf42223          	sw	a5,-60(s0)
   10374:	00068793          	mv	a5,a3
   10378:	fcf42023          	sw	a5,-64(s0)
   1037c:	00070793          	mv	a5,a4
   10380:	faf42e23          	sw	a5,-68(s0)
   10384:	fe042623          	sw	zero,-20(s0)
   10388:	1600006f          	j	104e8 <matrixmul+0x1a0>
   1038c:	fe042423          	sw	zero,-24(s0)
   10390:	1380006f          	j	104c8 <matrixmul+0x180>
   10394:	fec42703          	lw	a4,-20(s0)
   10398:	00070793          	mv	a5,a4
   1039c:	00279793          	slli	a5,a5,0x2
   103a0:	00e787b3          	add	a5,a5,a4
   103a4:	00279793          	slli	a5,a5,0x2
   103a8:	00078713          	mv	a4,a5
   103ac:	fc843783          	ld	a5,-56(s0)
   103b0:	00e78733          	add	a4,a5,a4
   103b4:	fe842783          	lw	a5,-24(s0)
   103b8:	00279793          	slli	a5,a5,0x2
   103bc:	00f707b3          	add	a5,a4,a5
   103c0:	0007a023          	sw	zero,0(a5)
   103c4:	fe042223          	sw	zero,-28(s0)
   103c8:	0e00006f          	j	104a8 <matrixmul+0x160>
   103cc:	fec42703          	lw	a4,-20(s0)
   103d0:	00070793          	mv	a5,a4
   103d4:	00279793          	slli	a5,a5,0x2
   103d8:	00e787b3          	add	a5,a5,a4
   103dc:	00279793          	slli	a5,a5,0x2
   103e0:	00078713          	mv	a4,a5
   103e4:	fc843783          	ld	a5,-56(s0)
   103e8:	00e78733          	add	a4,a5,a4
   103ec:	fe842783          	lw	a5,-24(s0)
   103f0:	00279793          	slli	a5,a5,0x2
   103f4:	00f707b3          	add	a5,a4,a5
   103f8:	0007a583          	lw	a1,0(a5)
   103fc:	fec42703          	lw	a4,-20(s0)
   10400:	00070793          	mv	a5,a4
   10404:	00279793          	slli	a5,a5,0x2
   10408:	00e787b3          	add	a5,a5,a4
   1040c:	00279793          	slli	a5,a5,0x2
   10410:	00078713          	mv	a4,a5
   10414:	fd843783          	ld	a5,-40(s0)
   10418:	00e78733          	add	a4,a5,a4
   1041c:	fe442783          	lw	a5,-28(s0)
   10420:	00279793          	slli	a5,a5,0x2
   10424:	00f707b3          	add	a5,a4,a5
   10428:	0007a683          	lw	a3,0(a5)
   1042c:	fe442703          	lw	a4,-28(s0)
   10430:	00070793          	mv	a5,a4
   10434:	00279793          	slli	a5,a5,0x2
   10438:	00e787b3          	add	a5,a5,a4
   1043c:	00279793          	slli	a5,a5,0x2
   10440:	00078713          	mv	a4,a5
   10444:	fd043783          	ld	a5,-48(s0)
   10448:	00e78733          	add	a4,a5,a4
   1044c:	fe842783          	lw	a5,-24(s0)
   10450:	00279793          	slli	a5,a5,0x2
   10454:	00f707b3          	add	a5,a4,a5
   10458:	0007a783          	lw	a5,0(a5)
   1045c:	02f687bb          	mulw	a5,a3,a5
   10460:	0007861b          	sext.w	a2,a5
   10464:	fec42703          	lw	a4,-20(s0)
   10468:	00070793          	mv	a5,a4
   1046c:	00279793          	slli	a5,a5,0x2
   10470:	00e787b3          	add	a5,a5,a4
   10474:	00279793          	slli	a5,a5,0x2
   10478:	00078713          	mv	a4,a5
   1047c:	fc843783          	ld	a5,-56(s0)
   10480:	00e786b3          	add	a3,a5,a4
   10484:	00c587bb          	addw	a5,a1,a2
   10488:	0007871b          	sext.w	a4,a5
   1048c:	fe842783          	lw	a5,-24(s0)
   10490:	00279793          	slli	a5,a5,0x2
   10494:	00f687b3          	add	a5,a3,a5
   10498:	00e7a023          	sw	a4,0(a5)
   1049c:	fe442783          	lw	a5,-28(s0)
   104a0:	0017879b          	addiw	a5,a5,1
   104a4:	fef42223          	sw	a5,-28(s0)
   104a8:	fe442703          	lw	a4,-28(s0)
   104ac:	fc042783          	lw	a5,-64(s0)
   104b0:	0007071b          	sext.w	a4,a4
   104b4:	0007879b          	sext.w	a5,a5
   104b8:	f0f74ae3          	blt	a4,a5,103cc <matrixmul+0x84>
   104bc:	fe842783          	lw	a5,-24(s0)
   104c0:	0017879b          	addiw	a5,a5,1
   104c4:	fef42423          	sw	a5,-24(s0)
   104c8:	fe842703          	lw	a4,-24(s0)
   104cc:	fbc42783          	lw	a5,-68(s0)
   104d0:	0007071b          	sext.w	a4,a4
   104d4:	0007879b          	sext.w	a5,a5
   104d8:	eaf74ee3          	blt	a4,a5,10394 <matrixmul+0x4c>
   104dc:	fec42783          	lw	a5,-20(s0)
   104e0:	0017879b          	addiw	a5,a5,1
   104e4:	fef42623          	sw	a5,-20(s0)
   104e8:	fec42703          	lw	a4,-20(s0)
   104ec:	fc442783          	lw	a5,-60(s0)
   104f0:	0007071b          	sext.w	a4,a4
   104f4:	0007879b          	sext.w	a5,a5
   104f8:	e8f74ae3          	blt	a4,a5,1038c <matrixmul+0x44>
   104fc:	00000013          	nop
   10500:	00000013          	nop
   10504:	04813403          	ld	s0,72(sp)
   10508:	05010113          	addi	sp,sp,80
   1050c:	00008067          	ret

0000000000010510 <main>:
   10510:	e9010113          	addi	sp,sp,-368
   10514:	16113423          	sd	ra,360(sp)
   10518:	16813023          	sd	s0,352(sp)
   1051c:	17010413          	addi	s0,sp,368
   10520:	fe042623          	sw	zero,-20(s0)
   10524:	0ec0006f          	j	10610 <main+0x100>
   10528:	fe042423          	sw	zero,-24(s0)
   1052c:	0c80006f          	j	105f4 <main+0xe4>
   10530:	fec42703          	lw	a4,-20(s0)
   10534:	41f7579b          	sraiw	a5,a4,0x1f
   10538:	01f7d79b          	srliw	a5,a5,0x1f
   1053c:	00f7073b          	addw	a4,a4,a5
   10540:	00177713          	andi	a4,a4,1
   10544:	40f707bb          	subw	a5,a4,a5
   10548:	0007871b          	sext.w	a4,a5
   1054c:	fe842683          	lw	a3,-24(s0)
   10550:	00300793          	li	a5,3
   10554:	02f6e7bb          	remw	a5,a3,a5
   10558:	0007879b          	sext.w	a5,a5
   1055c:	00f707bb          	addw	a5,a4,a5
   10560:	0007869b          	sext.w	a3,a5
   10564:	fe842603          	lw	a2,-24(s0)
   10568:	fec42703          	lw	a4,-20(s0)
   1056c:	00070793          	mv	a5,a4
   10570:	00279793          	slli	a5,a5,0x2
   10574:	00e787b3          	add	a5,a5,a4
   10578:	00c787b3          	add	a5,a5,a2
   1057c:	00279793          	slli	a5,a5,0x2
   10580:	ff040713          	addi	a4,s0,-16
   10584:	00f707b3          	add	a5,a4,a5
   10588:	f8d7a423          	sw	a3,-120(a5)
   1058c:	fec42703          	lw	a4,-20(s0)
   10590:	00300793          	li	a5,3
   10594:	02f767bb          	remw	a5,a4,a5
   10598:	0007869b          	sext.w	a3,a5
   1059c:	fe842703          	lw	a4,-24(s0)
   105a0:	41f7579b          	sraiw	a5,a4,0x1f
   105a4:	01f7d79b          	srliw	a5,a5,0x1f
   105a8:	00f7073b          	addw	a4,a4,a5
   105ac:	00177713          	andi	a4,a4,1
   105b0:	40f707bb          	subw	a5,a4,a5
   105b4:	0007879b          	sext.w	a5,a5
   105b8:	00f687bb          	addw	a5,a3,a5
   105bc:	0007869b          	sext.w	a3,a5
   105c0:	fe842603          	lw	a2,-24(s0)
   105c4:	fec42703          	lw	a4,-20(s0)
   105c8:	00070793          	mv	a5,a4
   105cc:	00279793          	slli	a5,a5,0x2
   105d0:	00e787b3          	add	a5,a5,a4
   105d4:	00c787b3          	add	a5,a5,a2
   105d8:	00279793          	slli	a5,a5,0x2
   105dc:	ff040713          	addi	a4,s0,-16
   105e0:	00f707b3          	add	a5,a4,a5
   105e4:	f2d7a023          	sw	a3,-224(a5)
   105e8:	fe842783          	lw	a5,-24(s0)
   105ec:	0017879b          	addiw	a5,a5,1
   105f0:	fef42423          	sw	a5,-24(s0)
   105f4:	fe842783          	lw	a5,-24(s0)
   105f8:	0007871b          	sext.w	a4,a5
   105fc:	00400793          	li	a5,4
   10600:	f2e7d8e3          	bge	a5,a4,10530 <main+0x20>
   10604:	fec42783          	lw	a5,-20(s0)
   10608:	0017879b          	addiw	a5,a5,1
   1060c:	fef42623          	sw	a5,-20(s0)
   10610:	fec42783          	lw	a5,-20(s0)
   10614:	0007871b          	sext.w	a4,a5
   10618:	00400793          	li	a5,4
   1061c:	f0e7d6e3          	bge	a5,a4,10528 <main+0x18>
   10620:	ea840613          	addi	a2,s0,-344
   10624:	f1040593          	addi	a1,s0,-240
   10628:	f7840513          	addi	a0,s0,-136
   1062c:	00500793          	li	a5,5
   10630:	00500713          	li	a4,5
   10634:	00500693          	li	a3,5
   10638:	d11ff0ef          	jal	ra,10348 <matrixmul>
   1063c:	fe042223          	sw	zero,-28(s0)
   10640:	0d80006f          	j	10718 <main+0x208>
   10644:	fe042023          	sw	zero,-32(s0)
   10648:	0900006f          	j	106d8 <main+0x1c8>
   1064c:	fe042683          	lw	a3,-32(s0)
   10650:	fe442703          	lw	a4,-28(s0)
   10654:	00070793          	mv	a5,a4
   10658:	00279793          	slli	a5,a5,0x2
   1065c:	00e787b3          	add	a5,a5,a4
   10660:	00d787b3          	add	a5,a5,a3
   10664:	00279793          	slli	a5,a5,0x2
   10668:	ff040713          	addi	a4,s0,-16
   1066c:	00f707b3          	add	a5,a4,a5
   10670:	eb87a783          	lw	a5,-328(a5)
   10674:	e9040713          	addi	a4,s0,-368
   10678:	00070593          	mv	a1,a4
   1067c:	00078513          	mv	a0,a5
   10680:	ad9ff0ef          	jal	ra,10158 <Int2Str>
   10684:	00050793          	mv	a5,a0
   10688:	fcf42e23          	sw	a5,-36(s0)
   1068c:	e9040793          	addi	a5,s0,-368
   10690:	fdc42683          	lw	a3,-36(s0)
   10694:	00000713          	li	a4,0
   10698:	00078613          	mv	a2,a5
   1069c:	00100593          	li	a1,1
   106a0:	04000513          	li	a0,64
   106a4:	c59ff0ef          	jal	ra,102fc <my_syscall>
   106a8:	02000793          	li	a5,32
   106ac:	e8f40823          	sb	a5,-368(s0)
   106b0:	e9040793          	addi	a5,s0,-368
   106b4:	00000713          	li	a4,0
   106b8:	00100693          	li	a3,1
   106bc:	00078613          	mv	a2,a5
   106c0:	00100593          	li	a1,1
   106c4:	04000513          	li	a0,64
   106c8:	c35ff0ef          	jal	ra,102fc <my_syscall>
   106cc:	fe042783          	lw	a5,-32(s0)
   106d0:	0017879b          	addiw	a5,a5,1
   106d4:	fef42023          	sw	a5,-32(s0)
   106d8:	fe042783          	lw	a5,-32(s0)
   106dc:	0007871b          	sext.w	a4,a5
   106e0:	00400793          	li	a5,4
   106e4:	f6e7d4e3          	bge	a5,a4,1064c <main+0x13c>
   106e8:	00a00793          	li	a5,10
   106ec:	e8f40823          	sb	a5,-368(s0)
   106f0:	e9040793          	addi	a5,s0,-368
   106f4:	00000713          	li	a4,0
   106f8:	00100693          	li	a3,1
   106fc:	00078613          	mv	a2,a5
   10700:	00100593          	li	a1,1
   10704:	04000513          	li	a0,64
   10708:	bf5ff0ef          	jal	ra,102fc <my_syscall>
   1070c:	fe442783          	lw	a5,-28(s0)
   10710:	0017879b          	addiw	a5,a5,1
   10714:	fef42223          	sw	a5,-28(s0)
   10718:	fe442783          	lw	a5,-28(s0)
   1071c:	0007871b          	sext.w	a4,a5
   10720:	00400793          	li	a5,4
   10724:	f2e7d0e3          	bge	a5,a4,10644 <main+0x134>
   10728:	00000793          	li	a5,0
   1072c:	00078513          	mv	a0,a5
   10730:	16813083          	ld	ra,360(sp)
   10734:	16013403          	ld	s0,352(sp)
   10738:	17010113          	addi	sp,sp,368
   1073c:	00008067          	ret

0000000000010740 <exit>:
   10740:	1141                	addi	sp,sp,-16
   10742:	4581                	li	a1,0
   10744:	e022                	sd	s0,0(sp)
   10746:	e406                	sd	ra,8(sp)
   10748:	842a                	mv	s0,a0
   1074a:	128000ef          	jal	ra,10872 <__call_exitprocs>
   1074e:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10752:	6d3c                	ld	a5,88(a0)
   10754:	c391                	beqz	a5,10758 <exit+0x18>
   10756:	9782                	jalr	a5
   10758:	8522                	mv	a0,s0
   1075a:	28e000ef          	jal	ra,109e8 <_exit>

000000000001075e <__libc_init_array>:
   1075e:	1101                	addi	sp,sp,-32
   10760:	e822                	sd	s0,16(sp)
   10762:	e04a                	sd	s2,0(sp)
   10764:	6445                	lui	s0,0x11
   10766:	6945                	lui	s2,0x11
   10768:	00440793          	addi	a5,s0,4 # 11004 <__preinit_array_end>
   1076c:	00490913          	addi	s2,s2,4 # 11004 <__preinit_array_end>
   10770:	40f90933          	sub	s2,s2,a5
   10774:	ec06                	sd	ra,24(sp)
   10776:	e426                	sd	s1,8(sp)
   10778:	40395913          	srai	s2,s2,0x3
   1077c:	00090b63          	beqz	s2,10792 <__libc_init_array+0x34>
   10780:	00440413          	addi	s0,s0,4
   10784:	4481                	li	s1,0
   10786:	601c                	ld	a5,0(s0)
   10788:	0485                	addi	s1,s1,1
   1078a:	0421                	addi	s0,s0,8
   1078c:	9782                	jalr	a5
   1078e:	fe991ce3          	bne	s2,s1,10786 <__libc_init_array+0x28>
   10792:	6445                	lui	s0,0x11
   10794:	6945                	lui	s2,0x11
   10796:	00840793          	addi	a5,s0,8 # 11008 <__init_array_start>
   1079a:	01890913          	addi	s2,s2,24 # 11018 <__init_array_end>
   1079e:	40f90933          	sub	s2,s2,a5
   107a2:	40395913          	srai	s2,s2,0x3
   107a6:	00090b63          	beqz	s2,107bc <__libc_init_array+0x5e>
   107aa:	00840413          	addi	s0,s0,8
   107ae:	4481                	li	s1,0
   107b0:	601c                	ld	a5,0(s0)
   107b2:	0485                	addi	s1,s1,1
   107b4:	0421                	addi	s0,s0,8
   107b6:	9782                	jalr	a5
   107b8:	fe991ce3          	bne	s2,s1,107b0 <__libc_init_array+0x52>
   107bc:	60e2                	ld	ra,24(sp)
   107be:	6442                	ld	s0,16(sp)
   107c0:	64a2                	ld	s1,8(sp)
   107c2:	6902                	ld	s2,0(sp)
   107c4:	6105                	addi	sp,sp,32
   107c6:	8082                	ret

00000000000107c8 <memset>:
   107c8:	433d                	li	t1,15
   107ca:	872a                	mv	a4,a0
   107cc:	02c37163          	bgeu	t1,a2,107ee <memset+0x26>
   107d0:	00f77793          	andi	a5,a4,15
   107d4:	e3c1                	bnez	a5,10854 <memset+0x8c>
   107d6:	e1bd                	bnez	a1,1083c <memset+0x74>
   107d8:	ff067693          	andi	a3,a2,-16
   107dc:	8a3d                	andi	a2,a2,15
   107de:	96ba                	add	a3,a3,a4
   107e0:	e30c                	sd	a1,0(a4)
   107e2:	e70c                	sd	a1,8(a4)
   107e4:	0741                	addi	a4,a4,16
   107e6:	fed76de3          	bltu	a4,a3,107e0 <memset+0x18>
   107ea:	e211                	bnez	a2,107ee <memset+0x26>
   107ec:	8082                	ret
   107ee:	40c306b3          	sub	a3,t1,a2
   107f2:	068a                	slli	a3,a3,0x2
   107f4:	00000297          	auipc	t0,0x0
   107f8:	9696                	add	a3,a3,t0
   107fa:	00a68067          	jr	10(a3)
   107fe:	00b70723          	sb	a1,14(a4)
   10802:	00b706a3          	sb	a1,13(a4)
   10806:	00b70623          	sb	a1,12(a4)
   1080a:	00b705a3          	sb	a1,11(a4)
   1080e:	00b70523          	sb	a1,10(a4)
   10812:	00b704a3          	sb	a1,9(a4)
   10816:	00b70423          	sb	a1,8(a4)
   1081a:	00b703a3          	sb	a1,7(a4)
   1081e:	00b70323          	sb	a1,6(a4)
   10822:	00b702a3          	sb	a1,5(a4)
   10826:	00b70223          	sb	a1,4(a4)
   1082a:	00b701a3          	sb	a1,3(a4)
   1082e:	00b70123          	sb	a1,2(a4)
   10832:	00b700a3          	sb	a1,1(a4)
   10836:	00b70023          	sb	a1,0(a4)
   1083a:	8082                	ret
   1083c:	0ff5f593          	andi	a1,a1,255
   10840:	00859693          	slli	a3,a1,0x8
   10844:	8dd5                	or	a1,a1,a3
   10846:	01059693          	slli	a3,a1,0x10
   1084a:	8dd5                	or	a1,a1,a3
   1084c:	02059693          	slli	a3,a1,0x20
   10850:	8dd5                	or	a1,a1,a3
   10852:	b759                	j	107d8 <memset+0x10>
   10854:	00279693          	slli	a3,a5,0x2
   10858:	00000297          	auipc	t0,0x0
   1085c:	9696                	add	a3,a3,t0
   1085e:	8286                	mv	t0,ra
   10860:	fa2680e7          	jalr	-94(a3)
   10864:	8096                	mv	ra,t0
   10866:	17c1                	addi	a5,a5,-16
   10868:	8f1d                	sub	a4,a4,a5
   1086a:	963e                	add	a2,a2,a5
   1086c:	f8c371e3          	bgeu	t1,a2,107ee <memset+0x26>
   10870:	b79d                	j	107d6 <memset+0xe>

0000000000010872 <__call_exitprocs>:
   10872:	715d                	addi	sp,sp,-80
   10874:	f052                	sd	s4,32(sp)
   10876:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   1087a:	f84a                	sd	s2,48(sp)
   1087c:	e486                	sd	ra,72(sp)
   1087e:	1f8a3903          	ld	s2,504(s4)
   10882:	e0a2                	sd	s0,64(sp)
   10884:	fc26                	sd	s1,56(sp)
   10886:	f44e                	sd	s3,40(sp)
   10888:	ec56                	sd	s5,24(sp)
   1088a:	e85a                	sd	s6,16(sp)
   1088c:	e45e                	sd	s7,8(sp)
   1088e:	e062                	sd	s8,0(sp)
   10890:	02090863          	beqz	s2,108c0 <__call_exitprocs+0x4e>
   10894:	8b2a                	mv	s6,a0
   10896:	8bae                	mv	s7,a1
   10898:	4a85                	li	s5,1
   1089a:	59fd                	li	s3,-1
   1089c:	00892483          	lw	s1,8(s2)
   108a0:	fff4841b          	addiw	s0,s1,-1
   108a4:	00044e63          	bltz	s0,108c0 <__call_exitprocs+0x4e>
   108a8:	048e                	slli	s1,s1,0x3
   108aa:	94ca                	add	s1,s1,s2
   108ac:	020b8663          	beqz	s7,108d8 <__call_exitprocs+0x66>
   108b0:	2084b783          	ld	a5,520(s1)
   108b4:	03778263          	beq	a5,s7,108d8 <__call_exitprocs+0x66>
   108b8:	347d                	addiw	s0,s0,-1
   108ba:	14e1                	addi	s1,s1,-8
   108bc:	ff3418e3          	bne	s0,s3,108ac <__call_exitprocs+0x3a>
   108c0:	60a6                	ld	ra,72(sp)
   108c2:	6406                	ld	s0,64(sp)
   108c4:	74e2                	ld	s1,56(sp)
   108c6:	7942                	ld	s2,48(sp)
   108c8:	79a2                	ld	s3,40(sp)
   108ca:	7a02                	ld	s4,32(sp)
   108cc:	6ae2                	ld	s5,24(sp)
   108ce:	6b42                	ld	s6,16(sp)
   108d0:	6ba2                	ld	s7,8(sp)
   108d2:	6c02                	ld	s8,0(sp)
   108d4:	6161                	addi	sp,sp,80
   108d6:	8082                	ret
   108d8:	00892783          	lw	a5,8(s2)
   108dc:	6498                	ld	a4,8(s1)
   108de:	37fd                	addiw	a5,a5,-1
   108e0:	04878463          	beq	a5,s0,10928 <__call_exitprocs+0xb6>
   108e4:	0004b423          	sd	zero,8(s1)
   108e8:	db61                	beqz	a4,108b8 <__call_exitprocs+0x46>
   108ea:	31092783          	lw	a5,784(s2)
   108ee:	008a96bb          	sllw	a3,s5,s0
   108f2:	00892c03          	lw	s8,8(s2)
   108f6:	8ff5                	and	a5,a5,a3
   108f8:	2781                	sext.w	a5,a5
   108fa:	ef89                	bnez	a5,10914 <__call_exitprocs+0xa2>
   108fc:	9702                	jalr	a4
   108fe:	00892703          	lw	a4,8(s2)
   10902:	1f8a3783          	ld	a5,504(s4)
   10906:	01871463          	bne	a4,s8,1090e <__call_exitprocs+0x9c>
   1090a:	faf907e3          	beq	s2,a5,108b8 <__call_exitprocs+0x46>
   1090e:	dbcd                	beqz	a5,108c0 <__call_exitprocs+0x4e>
   10910:	893e                	mv	s2,a5
   10912:	b769                	j	1089c <__call_exitprocs+0x2a>
   10914:	31492783          	lw	a5,788(s2)
   10918:	1084b583          	ld	a1,264(s1)
   1091c:	8ff5                	and	a5,a5,a3
   1091e:	2781                	sext.w	a5,a5
   10920:	e799                	bnez	a5,1092e <__call_exitprocs+0xbc>
   10922:	855a                	mv	a0,s6
   10924:	9702                	jalr	a4
   10926:	bfe1                	j	108fe <__call_exitprocs+0x8c>
   10928:	00892423          	sw	s0,8(s2)
   1092c:	bf75                	j	108e8 <__call_exitprocs+0x76>
   1092e:	852e                	mv	a0,a1
   10930:	9702                	jalr	a4
   10932:	b7f1                	j	108fe <__call_exitprocs+0x8c>

0000000000010934 <__libc_fini_array>:
   10934:	1101                	addi	sp,sp,-32
   10936:	e822                	sd	s0,16(sp)
   10938:	67c5                	lui	a5,0x11
   1093a:	6445                	lui	s0,0x11
   1093c:	01840413          	addi	s0,s0,24 # 11018 <__init_array_end>
   10940:	02078793          	addi	a5,a5,32 # 11020 <__fini_array_end>
   10944:	8f81                	sub	a5,a5,s0
   10946:	e426                	sd	s1,8(sp)
   10948:	ec06                	sd	ra,24(sp)
   1094a:	4037d493          	srai	s1,a5,0x3
   1094e:	c881                	beqz	s1,1095e <__libc_fini_array+0x2a>
   10950:	17e1                	addi	a5,a5,-8
   10952:	943e                	add	s0,s0,a5
   10954:	601c                	ld	a5,0(s0)
   10956:	14fd                	addi	s1,s1,-1
   10958:	1461                	addi	s0,s0,-8
   1095a:	9782                	jalr	a5
   1095c:	fce5                	bnez	s1,10954 <__libc_fini_array+0x20>
   1095e:	60e2                	ld	ra,24(sp)
   10960:	6442                	ld	s0,16(sp)
   10962:	64a2                	ld	s1,8(sp)
   10964:	6105                	addi	sp,sp,32
   10966:	8082                	ret

0000000000010968 <atexit>:
   10968:	85aa                	mv	a1,a0
   1096a:	4681                	li	a3,0
   1096c:	4601                	li	a2,0
   1096e:	4501                	li	a0,0
   10970:	a009                	j	10972 <__register_exitproc>

0000000000010972 <__register_exitproc>:
   10972:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   10976:	1f873783          	ld	a5,504(a4)
   1097a:	c3b1                	beqz	a5,109be <__register_exitproc+0x4c>
   1097c:	4798                	lw	a4,8(a5)
   1097e:	487d                	li	a6,31
   10980:	06e84263          	blt	a6,a4,109e4 <__register_exitproc+0x72>
   10984:	c505                	beqz	a0,109ac <__register_exitproc+0x3a>
   10986:	00371813          	slli	a6,a4,0x3
   1098a:	983e                	add	a6,a6,a5
   1098c:	10c83823          	sd	a2,272(a6)
   10990:	3107a883          	lw	a7,784(a5)
   10994:	4605                	li	a2,1
   10996:	00e6163b          	sllw	a2,a2,a4
   1099a:	00c8e8b3          	or	a7,a7,a2
   1099e:	3117a823          	sw	a7,784(a5)
   109a2:	20d83823          	sd	a3,528(a6)
   109a6:	4689                	li	a3,2
   109a8:	02d50063          	beq	a0,a3,109c8 <__register_exitproc+0x56>
   109ac:	00270693          	addi	a3,a4,2
   109b0:	068e                	slli	a3,a3,0x3
   109b2:	2705                	addiw	a4,a4,1
   109b4:	c798                	sw	a4,8(a5)
   109b6:	97b6                	add	a5,a5,a3
   109b8:	e38c                	sd	a1,0(a5)
   109ba:	4501                	li	a0,0
   109bc:	8082                	ret
   109be:	20070793          	addi	a5,a4,512
   109c2:	1ef73c23          	sd	a5,504(a4)
   109c6:	bf5d                	j	1097c <__register_exitproc+0xa>
   109c8:	3147a683          	lw	a3,788(a5)
   109cc:	4501                	li	a0,0
   109ce:	8e55                	or	a2,a2,a3
   109d0:	00270693          	addi	a3,a4,2
   109d4:	068e                	slli	a3,a3,0x3
   109d6:	2705                	addiw	a4,a4,1
   109d8:	30c7aa23          	sw	a2,788(a5)
   109dc:	c798                	sw	a4,8(a5)
   109de:	97b6                	add	a5,a5,a3
   109e0:	e38c                	sd	a1,0(a5)
   109e2:	8082                	ret
   109e4:	557d                	li	a0,-1
   109e6:	8082                	ret

00000000000109e8 <_exit>:
   109e8:	4581                	li	a1,0
   109ea:	4601                	li	a2,0
   109ec:	4681                	li	a3,0
   109ee:	4701                	li	a4,0
   109f0:	4781                	li	a5,0
   109f2:	05d00893          	li	a7,93
   109f6:	00000073          	ecall
   109fa:	00054363          	bltz	a0,10a00 <_exit+0x18>
   109fe:	a001                	j	109fe <_exit+0x16>
   10a00:	1141                	addi	sp,sp,-16
   10a02:	e022                	sd	s0,0(sp)
   10a04:	842a                	mv	s0,a0
   10a06:	e406                	sd	ra,8(sp)
   10a08:	4080043b          	negw	s0,s0
   10a0c:	008000ef          	jal	ra,10a14 <__errno>
   10a10:	c100                	sw	s0,0(a0)
   10a12:	a001                	j	10a12 <_exit+0x2a>

0000000000010a14 <__errno>:
   10a14:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10a18:	8082                	ret

Matrixmul.elf:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c791                	beqz	a5,100c4 <register_fini+0x14>
   100ba:	6545                	lui	a0,0x11
   100bc:	95850513          	addi	a0,a0,-1704 # 10958 <__libc_fini_array>
   100c0:	0cd0006f          	j	1098c <atexit>
   100c4:	8082                	ret

00000000000100c6 <_start>:
   100c6:	00001197          	auipc	gp,0x1
   100ca:	75a18193          	addi	gp,gp,1882 # 11820 <__global_pointer$>
   100ce:	f6018513          	addi	a0,gp,-160 # 11780 <_edata>
   100d2:	f9818613          	addi	a2,gp,-104 # 117b8 <__BSS_END__>
   100d6:	8e09                	sub	a2,a2,a0
   100d8:	4581                	li	a1,0
   100da:	712000ef          	jal	ra,107ec <memset>
   100de:	00001517          	auipc	a0,0x1
   100e2:	8ae50513          	addi	a0,a0,-1874 # 1098c <atexit>
   100e6:	c519                	beqz	a0,100f4 <_start+0x2e>
   100e8:	00001517          	auipc	a0,0x1
   100ec:	87050513          	addi	a0,a0,-1936 # 10958 <__libc_fini_array>
   100f0:	09d000ef          	jal	ra,1098c <atexit>
   100f4:	68e000ef          	jal	ra,10782 <__libc_init_array>
   100f8:	4502                	lw	a0,0(sp)
   100fa:	002c                	addi	a1,sp,8
   100fc:	4601                	li	a2,0
   100fe:	412000ef          	jal	ra,10510 <main>
   10102:	a58d                	j	10764 <exit>

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

0000000000010348 <matrixmul>:
   10348:	fb010113          	addi	sp,sp,-80
   1034c:	04813423          	sd	s0,72(sp)
   10350:	05010413          	addi	s0,sp,80
   10354:	fca43c23          	sd	a0,-40(s0)
   10358:	fcb43823          	sd	a1,-48(s0)
   1035c:	fcc43423          	sd	a2,-56(s0)
   10360:	00068613          	mv	a2,a3
   10364:	00070693          	mv	a3,a4
   10368:	00078713          	mv	a4,a5
   1036c:	00060793          	mv	a5,a2
   10370:	fcf42223          	sw	a5,-60(s0)
   10374:	00068793          	mv	a5,a3
   10378:	fcf42023          	sw	a5,-64(s0)
   1037c:	00070793          	mv	a5,a4
   10380:	faf42e23          	sw	a5,-68(s0)
   10384:	fe042623          	sw	zero,-20(s0)
   10388:	1600006f          	j	104e8 <matrixmul+0x1a0>
   1038c:	fe042423          	sw	zero,-24(s0)
   10390:	1380006f          	j	104c8 <matrixmul+0x180>
   10394:	fec42703          	lw	a4,-20(s0)
   10398:	00070793          	mv	a5,a4
   1039c:	00279793          	slli	a5,a5,0x2
   103a0:	00e787b3          	add	a5,a5,a4
   103a4:	00279793          	slli	a5,a5,0x2
   103a8:	00078713          	mv	a4,a5
   103ac:	fc843783          	ld	a5,-56(s0)
   103b0:	00e78733          	add	a4,a5,a4
   103b4:	fe842783          	lw	a5,-24(s0)
   103b8:	00279793          	slli	a5,a5,0x2
   103bc:	00f707b3          	add	a5,a4,a5
   103c0:	0007a023          	sw	zero,0(a5)
   103c4:	fe042223          	sw	zero,-28(s0)
   103c8:	0e00006f          	j	104a8 <matrixmul+0x160>
   103cc:	fec42703          	lw	a4,-20(s0)
   103d0:	00070793          	mv	a5,a4
   103d4:	00279793          	slli	a5,a5,0x2
   103d8:	00e787b3          	add	a5,a5,a4
   103dc:	00279793          	slli	a5,a5,0x2
   103e0:	00078713          	mv	a4,a5
   103e4:	fc843783          	ld	a5,-56(s0)
   103e8:	00e78733          	add	a4,a5,a4
   103ec:	fe842783          	lw	a5,-24(s0)
   103f0:	00279793          	slli	a5,a5,0x2
   103f4:	00f707b3          	add	a5,a4,a5
   103f8:	0007a583          	lw	a1,0(a5)
   103fc:	fec42703          	lw	a4,-20(s0)
   10400:	00070793          	mv	a5,a4
   10404:	00279793          	slli	a5,a5,0x2
   10408:	00e787b3          	add	a5,a5,a4
   1040c:	00279793          	slli	a5,a5,0x2
   10410:	00078713          	mv	a4,a5
   10414:	fd843783          	ld	a5,-40(s0)
   10418:	00e78733          	add	a4,a5,a4
   1041c:	fe442783          	lw	a5,-28(s0)
   10420:	00279793          	slli	a5,a5,0x2
   10424:	00f707b3          	add	a5,a4,a5
   10428:	0007a683          	lw	a3,0(a5)
   1042c:	fe442703          	lw	a4,-28(s0)
   10430:	00070793          	mv	a5,a4
   10434:	00279793          	slli	a5,a5,0x2
   10438:	00e787b3          	add	a5,a5,a4
   1043c:	00279793          	slli	a5,a5,0x2
   10440:	00078713          	mv	a4,a5
   10444:	fd043783          	ld	a5,-48(s0)
   10448:	00e78733          	add	a4,a5,a4
   1044c:	fe842783          	lw	a5,-24(s0)
   10450:	00279793          	slli	a5,a5,0x2
   10454:	00f707b3          	add	a5,a4,a5
   10458:	0007a783          	lw	a5,0(a5)
   1045c:	02f687bb          	mulw	a5,a3,a5
   10460:	0007861b          	sext.w	a2,a5
   10464:	fec42703          	lw	a4,-20(s0)
   10468:	00070793          	mv	a5,a4
   1046c:	00279793          	slli	a5,a5,0x2
   10470:	00e787b3          	add	a5,a5,a4
   10474:	00279793          	slli	a5,a5,0x2
   10478:	00078713          	mv	a4,a5
   1047c:	fc843783          	ld	a5,-56(s0)
   10480:	00e786b3          	add	a3,a5,a4
   10484:	00c587bb          	addw	a5,a1,a2
   10488:	0007871b          	sext.w	a4,a5
   1048c:	fe842783          	lw	a5,-24(s0)
   10490:	00279793          	slli	a5,a5,0x2
   10494:	00f687b3          	add	a5,a3,a5
   10498:	00e7a023          	sw	a4,0(a5)
   1049c:	fe442783          	lw	a5,-28(s0)
   104a0:	0017879b          	addiw	a5,a5,1
   104a4:	fef42223          	sw	a5,-28(s0)
   104a8:	fe442703          	lw	a4,-28(s0)
   104ac:	fc042783          	lw	a5,-64(s0)
   104b0:	0007071b          	sext.w	a4,a4
   104b4:	0007879b          	sext.w	a5,a5
   104b8:	f0f74ae3          	blt	a4,a5,103cc <matrixmul+0x84>
   104bc:	fe842783          	lw	a5,-24(s0)
   104c0:	0017879b          	addiw	a5,a5,1
   104c4:	fef42423          	sw	a5,-24(s0)
   104c8:	fe842703          	lw	a4,-24(s0)
   104cc:	fbc42783          	lw	a5,-68(s0)
   104d0:	0007071b          	sext.w	a4,a4
   104d4:	0007879b          	sext.w	a5,a5
   104d8:	eaf74ee3          	blt	a4,a5,10394 <matrixmul+0x4c>
   104dc:	fec42783          	lw	a5,-20(s0)
   104e0:	0017879b          	addiw	a5,a5,1
   104e4:	fef42623          	sw	a5,-20(s0)
   104e8:	fec42703          	lw	a4,-20(s0)
   104ec:	fc442783          	lw	a5,-60(s0)
   104f0:	0007071b          	sext.w	a4,a4
   104f4:	0007879b          	sext.w	a5,a5
   104f8:	e8f74ae3          	blt	a4,a5,1038c <matrixmul+0x44>
   104fc:	00000013          	nop
   10500:	00000013          	nop
   10504:	04813403          	ld	s0,72(sp)
   10508:	05010113          	addi	sp,sp,80
   1050c:	00008067          	ret

0000000000010510 <main>:
   10510:	e9010113          	addi	sp,sp,-368
   10514:	16113423          	sd	ra,360(sp)
   10518:	16813023          	sd	s0,352(sp)
   1051c:	17010413          	addi	s0,sp,368
   10520:	fe042623          	sw	zero,-20(s0)
   10524:	0ec0006f          	j	10610 <main+0x100>
   10528:	fe042423          	sw	zero,-24(s0)
   1052c:	0c80006f          	j	105f4 <main+0xe4>
   10530:	fec42703          	lw	a4,-20(s0)
   10534:	41f7579b          	sraiw	a5,a4,0x1f
   10538:	01f7d79b          	srliw	a5,a5,0x1f
   1053c:	00f7073b          	addw	a4,a4,a5
   10540:	00177713          	andi	a4,a4,1
   10544:	40f707bb          	subw	a5,a4,a5
   10548:	0007871b          	sext.w	a4,a5
   1054c:	fe842683          	lw	a3,-24(s0)
   10550:	00300793          	li	a5,3
   10554:	02f6e7bb          	remw	a5,a3,a5
   10558:	0007879b          	sext.w	a5,a5
   1055c:	00f707bb          	addw	a5,a4,a5
   10560:	0007869b          	sext.w	a3,a5
   10564:	fe842603          	lw	a2,-24(s0)
   10568:	fec42703          	lw	a4,-20(s0)
   1056c:	00070793          	mv	a5,a4
   10570:	00279793          	slli	a5,a5,0x2
   10574:	00e787b3          	add	a5,a5,a4
   10578:	00c787b3          	add	a5,a5,a2
   1057c:	00279793          	slli	a5,a5,0x2
   10580:	ff040713          	addi	a4,s0,-16
   10584:	00f707b3          	add	a5,a4,a5
   10588:	f8d7a423          	sw	a3,-120(a5)
   1058c:	fec42703          	lw	a4,-20(s0)
   10590:	00300793          	li	a5,3
   10594:	02f767bb          	remw	a5,a4,a5
   10598:	0007869b          	sext.w	a3,a5
   1059c:	fe842703          	lw	a4,-24(s0)
   105a0:	41f7579b          	sraiw	a5,a4,0x1f
   105a4:	01f7d79b          	srliw	a5,a5,0x1f
   105a8:	00f7073b          	addw	a4,a4,a5
   105ac:	00177713          	andi	a4,a4,1
   105b0:	40f707bb          	subw	a5,a4,a5
   105b4:	0007879b          	sext.w	a5,a5
   105b8:	00f687bb          	addw	a5,a3,a5
   105bc:	0007869b          	sext.w	a3,a5
   105c0:	fe842603          	lw	a2,-24(s0)
   105c4:	fec42703          	lw	a4,-20(s0)
   105c8:	00070793          	mv	a5,a4
   105cc:	00279793          	slli	a5,a5,0x2
   105d0:	00e787b3          	add	a5,a5,a4
   105d4:	00c787b3          	add	a5,a5,a2
   105d8:	00279793          	slli	a5,a5,0x2
   105dc:	ff040713          	addi	a4,s0,-16
   105e0:	00f707b3          	add	a5,a4,a5
   105e4:	f2d7a023          	sw	a3,-224(a5)
   105e8:	fe842783          	lw	a5,-24(s0)
   105ec:	0017879b          	addiw	a5,a5,1
   105f0:	fef42423          	sw	a5,-24(s0)
   105f4:	fe842783          	lw	a5,-24(s0)
   105f8:	0007871b          	sext.w	a4,a5
   105fc:	00400793          	li	a5,4
   10600:	f2e7d8e3          	bge	a5,a4,10530 <main+0x20>
   10604:	fec42783          	lw	a5,-20(s0)
   10608:	0017879b          	addiw	a5,a5,1
   1060c:	fef42623          	sw	a5,-20(s0)
   10610:	fec42783          	lw	a5,-20(s0)
   10614:	0007871b          	sext.w	a4,a5
   10618:	00400793          	li	a5,4
   1061c:	f0e7d6e3          	bge	a5,a4,10528 <main+0x18>
   10620:	ea840613          	addi	a2,s0,-344
   10624:	f1040593          	addi	a1,s0,-240
   10628:	f7840513          	addi	a0,s0,-136
   1062c:	00500793          	li	a5,5
   10630:	00500713          	li	a4,5
   10634:	00500693          	li	a3,5
   10638:	d11ff0ef          	jal	ra,10348 <matrixmul>
   1063c:	fe042223          	sw	zero,-28(s0)
   10640:	0d80006f          	j	10718 <main+0x208>
   10644:	fe042023          	sw	zero,-32(s0)
   10648:	0900006f          	j	106d8 <main+0x1c8>
   1064c:	fe042683          	lw	a3,-32(s0)
   10650:	fe442703          	lw	a4,-28(s0)
   10654:	00070793          	mv	a5,a4
   10658:	00279793          	slli	a5,a5,0x2
   1065c:	00e787b3          	add	a5,a5,a4
   10660:	00d787b3          	add	a5,a5,a3
   10664:	00279793          	slli	a5,a5,0x2
   10668:	ff040713          	addi	a4,s0,-16
   1066c:	00f707b3          	add	a5,a4,a5
   10670:	eb87a783          	lw	a5,-328(a5)
   10674:	e9040713          	addi	a4,s0,-368
   10678:	00070593          	mv	a1,a4
   1067c:	00078513          	mv	a0,a5
   10680:	ad9ff0ef          	jal	ra,10158 <Int2Str>
   10684:	00050793          	mv	a5,a0
   10688:	fcf42e23          	sw	a5,-36(s0)
   1068c:	e9040793          	addi	a5,s0,-368
   10690:	fdc42683          	lw	a3,-36(s0)
   10694:	00000713          	li	a4,0
   10698:	00078613          	mv	a2,a5
   1069c:	00100593          	li	a1,1
   106a0:	04000513          	li	a0,64
   106a4:	c59ff0ef          	jal	ra,102fc <my_syscall>
   106a8:	02000793          	li	a5,32
   106ac:	e8f40823          	sb	a5,-368(s0)
   106b0:	e9040793          	addi	a5,s0,-368
   106b4:	00000713          	li	a4,0
   106b8:	00100693          	li	a3,1
   106bc:	00078613          	mv	a2,a5
   106c0:	00100593          	li	a1,1
   106c4:	04000513          	li	a0,64
   106c8:	c35ff0ef          	jal	ra,102fc <my_syscall>
   106cc:	fe042783          	lw	a5,-32(s0)
   106d0:	0017879b          	addiw	a5,a5,1
   106d4:	fef42023          	sw	a5,-32(s0)
   106d8:	fe042783          	lw	a5,-32(s0)
   106dc:	0007871b          	sext.w	a4,a5
   106e0:	00400793          	li	a5,4
   106e4:	f6e7d4e3          	bge	a5,a4,1064c <main+0x13c>
   106e8:	00a00793          	li	a5,10
   106ec:	e8f40823          	sb	a5,-368(s0)
   106f0:	e9040793          	addi	a5,s0,-368
   106f4:	00000713          	li	a4,0
   106f8:	00100693          	li	a3,1
   106fc:	00078613          	mv	a2,a5
   10700:	00100593          	li	a1,1
   10704:	04000513          	li	a0,64
   10708:	bf5ff0ef          	jal	ra,102fc <my_syscall>
   1070c:	fe442783          	lw	a5,-28(s0)
   10710:	0017879b          	addiw	a5,a5,1
   10714:	fef42223          	sw	a5,-28(s0)
   10718:	fe442783          	lw	a5,-28(s0)
   1071c:	0007871b          	sext.w	a4,a5
   10720:	00400793          	li	a5,4
   10724:	f2e7d0e3          	bge	a5,a4,10644 <main+0x134>
   10728:	00a00793          	li	a5,10
   1072c:	e8f40823          	sb	a5,-368(s0)
   10730:	e9040793          	addi	a5,s0,-368
   10734:	00000713          	li	a4,0
   10738:	00100693          	li	a3,1
   1073c:	00078613          	mv	a2,a5
   10740:	00100593          	li	a1,1
   10744:	04000513          	li	a0,64
   10748:	bb5ff0ef          	jal	ra,102fc <my_syscall>
   1074c:	00000793          	li	a5,0
   10750:	00078513          	mv	a0,a5
   10754:	16813083          	ld	ra,360(sp)
   10758:	16013403          	ld	s0,352(sp)
   1075c:	17010113          	addi	sp,sp,368
   10760:	00008067          	ret

0000000000010764 <exit>:
   10764:	1141                	addi	sp,sp,-16
   10766:	4581                	li	a1,0
   10768:	e022                	sd	s0,0(sp)
   1076a:	e406                	sd	ra,8(sp)
   1076c:	842a                	mv	s0,a0
   1076e:	128000ef          	jal	ra,10896 <__call_exitprocs>
   10772:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10776:	6d3c                	ld	a5,88(a0)
   10778:	c391                	beqz	a5,1077c <exit+0x18>
   1077a:	9782                	jalr	a5
   1077c:	8522                	mv	a0,s0
   1077e:	28e000ef          	jal	ra,10a0c <_exit>

0000000000010782 <__libc_init_array>:
   10782:	1101                	addi	sp,sp,-32
   10784:	e822                	sd	s0,16(sp)
   10786:	e04a                	sd	s2,0(sp)
   10788:	6445                	lui	s0,0x11
   1078a:	6945                	lui	s2,0x11
   1078c:	00440793          	addi	a5,s0,4 # 11004 <__preinit_array_end>
   10790:	00490913          	addi	s2,s2,4 # 11004 <__preinit_array_end>
   10794:	40f90933          	sub	s2,s2,a5
   10798:	ec06                	sd	ra,24(sp)
   1079a:	e426                	sd	s1,8(sp)
   1079c:	40395913          	srai	s2,s2,0x3
   107a0:	00090b63          	beqz	s2,107b6 <__libc_init_array+0x34>
   107a4:	00440413          	addi	s0,s0,4
   107a8:	4481                	li	s1,0
   107aa:	601c                	ld	a5,0(s0)
   107ac:	0485                	addi	s1,s1,1
   107ae:	0421                	addi	s0,s0,8
   107b0:	9782                	jalr	a5
   107b2:	fe991ce3          	bne	s2,s1,107aa <__libc_init_array+0x28>
   107b6:	6445                	lui	s0,0x11
   107b8:	6945                	lui	s2,0x11
   107ba:	00840793          	addi	a5,s0,8 # 11008 <__init_array_start>
   107be:	01890913          	addi	s2,s2,24 # 11018 <__init_array_end>
   107c2:	40f90933          	sub	s2,s2,a5
   107c6:	40395913          	srai	s2,s2,0x3
   107ca:	00090b63          	beqz	s2,107e0 <__libc_init_array+0x5e>
   107ce:	00840413          	addi	s0,s0,8
   107d2:	4481                	li	s1,0
   107d4:	601c                	ld	a5,0(s0)
   107d6:	0485                	addi	s1,s1,1
   107d8:	0421                	addi	s0,s0,8
   107da:	9782                	jalr	a5
   107dc:	fe991ce3          	bne	s2,s1,107d4 <__libc_init_array+0x52>
   107e0:	60e2                	ld	ra,24(sp)
   107e2:	6442                	ld	s0,16(sp)
   107e4:	64a2                	ld	s1,8(sp)
   107e6:	6902                	ld	s2,0(sp)
   107e8:	6105                	addi	sp,sp,32
   107ea:	8082                	ret

00000000000107ec <memset>:
   107ec:	433d                	li	t1,15
   107ee:	872a                	mv	a4,a0
   107f0:	02c37163          	bgeu	t1,a2,10812 <memset+0x26>
   107f4:	00f77793          	andi	a5,a4,15
   107f8:	e3c1                	bnez	a5,10878 <memset+0x8c>
   107fa:	e1bd                	bnez	a1,10860 <memset+0x74>
   107fc:	ff067693          	andi	a3,a2,-16
   10800:	8a3d                	andi	a2,a2,15
   10802:	96ba                	add	a3,a3,a4
   10804:	e30c                	sd	a1,0(a4)
   10806:	e70c                	sd	a1,8(a4)
   10808:	0741                	addi	a4,a4,16
   1080a:	fed76de3          	bltu	a4,a3,10804 <memset+0x18>
   1080e:	e211                	bnez	a2,10812 <memset+0x26>
   10810:	8082                	ret
   10812:	40c306b3          	sub	a3,t1,a2
   10816:	068a                	slli	a3,a3,0x2
   10818:	00000297          	auipc	t0,0x0
   1081c:	9696                	add	a3,a3,t0
   1081e:	00a68067          	jr	10(a3)
   10822:	00b70723          	sb	a1,14(a4)
   10826:	00b706a3          	sb	a1,13(a4)
   1082a:	00b70623          	sb	a1,12(a4)
   1082e:	00b705a3          	sb	a1,11(a4)
   10832:	00b70523          	sb	a1,10(a4)
   10836:	00b704a3          	sb	a1,9(a4)
   1083a:	00b70423          	sb	a1,8(a4)
   1083e:	00b703a3          	sb	a1,7(a4)
   10842:	00b70323          	sb	a1,6(a4)
   10846:	00b702a3          	sb	a1,5(a4)
   1084a:	00b70223          	sb	a1,4(a4)
   1084e:	00b701a3          	sb	a1,3(a4)
   10852:	00b70123          	sb	a1,2(a4)
   10856:	00b700a3          	sb	a1,1(a4)
   1085a:	00b70023          	sb	a1,0(a4)
   1085e:	8082                	ret
   10860:	0ff5f593          	andi	a1,a1,255
   10864:	00859693          	slli	a3,a1,0x8
   10868:	8dd5                	or	a1,a1,a3
   1086a:	01059693          	slli	a3,a1,0x10
   1086e:	8dd5                	or	a1,a1,a3
   10870:	02059693          	slli	a3,a1,0x20
   10874:	8dd5                	or	a1,a1,a3
   10876:	b759                	j	107fc <memset+0x10>
   10878:	00279693          	slli	a3,a5,0x2
   1087c:	00000297          	auipc	t0,0x0
   10880:	9696                	add	a3,a3,t0
   10882:	8286                	mv	t0,ra
   10884:	fa2680e7          	jalr	-94(a3)
   10888:	8096                	mv	ra,t0
   1088a:	17c1                	addi	a5,a5,-16
   1088c:	8f1d                	sub	a4,a4,a5
   1088e:	963e                	add	a2,a2,a5
   10890:	f8c371e3          	bgeu	t1,a2,10812 <memset+0x26>
   10894:	b79d                	j	107fa <memset+0xe>

0000000000010896 <__call_exitprocs>:
   10896:	715d                	addi	sp,sp,-80
   10898:	f052                	sd	s4,32(sp)
   1089a:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   1089e:	f84a                	sd	s2,48(sp)
   108a0:	e486                	sd	ra,72(sp)
   108a2:	1f8a3903          	ld	s2,504(s4)
   108a6:	e0a2                	sd	s0,64(sp)
   108a8:	fc26                	sd	s1,56(sp)
   108aa:	f44e                	sd	s3,40(sp)
   108ac:	ec56                	sd	s5,24(sp)
   108ae:	e85a                	sd	s6,16(sp)
   108b0:	e45e                	sd	s7,8(sp)
   108b2:	e062                	sd	s8,0(sp)
   108b4:	02090863          	beqz	s2,108e4 <__call_exitprocs+0x4e>
   108b8:	8b2a                	mv	s6,a0
   108ba:	8bae                	mv	s7,a1
   108bc:	4a85                	li	s5,1
   108be:	59fd                	li	s3,-1
   108c0:	00892483          	lw	s1,8(s2)
   108c4:	fff4841b          	addiw	s0,s1,-1
   108c8:	00044e63          	bltz	s0,108e4 <__call_exitprocs+0x4e>
   108cc:	048e                	slli	s1,s1,0x3
   108ce:	94ca                	add	s1,s1,s2
   108d0:	020b8663          	beqz	s7,108fc <__call_exitprocs+0x66>
   108d4:	2084b783          	ld	a5,520(s1)
   108d8:	03778263          	beq	a5,s7,108fc <__call_exitprocs+0x66>
   108dc:	347d                	addiw	s0,s0,-1
   108de:	14e1                	addi	s1,s1,-8
   108e0:	ff3418e3          	bne	s0,s3,108d0 <__call_exitprocs+0x3a>
   108e4:	60a6                	ld	ra,72(sp)
   108e6:	6406                	ld	s0,64(sp)
   108e8:	74e2                	ld	s1,56(sp)
   108ea:	7942                	ld	s2,48(sp)
   108ec:	79a2                	ld	s3,40(sp)
   108ee:	7a02                	ld	s4,32(sp)
   108f0:	6ae2                	ld	s5,24(sp)
   108f2:	6b42                	ld	s6,16(sp)
   108f4:	6ba2                	ld	s7,8(sp)
   108f6:	6c02                	ld	s8,0(sp)
   108f8:	6161                	addi	sp,sp,80
   108fa:	8082                	ret
   108fc:	00892783          	lw	a5,8(s2)
   10900:	6498                	ld	a4,8(s1)
   10902:	37fd                	addiw	a5,a5,-1
   10904:	04878463          	beq	a5,s0,1094c <__call_exitprocs+0xb6>
   10908:	0004b423          	sd	zero,8(s1)
   1090c:	db61                	beqz	a4,108dc <__call_exitprocs+0x46>
   1090e:	31092783          	lw	a5,784(s2)
   10912:	008a96bb          	sllw	a3,s5,s0
   10916:	00892c03          	lw	s8,8(s2)
   1091a:	8ff5                	and	a5,a5,a3
   1091c:	2781                	sext.w	a5,a5
   1091e:	ef89                	bnez	a5,10938 <__call_exitprocs+0xa2>
   10920:	9702                	jalr	a4
   10922:	00892703          	lw	a4,8(s2)
   10926:	1f8a3783          	ld	a5,504(s4)
   1092a:	01871463          	bne	a4,s8,10932 <__call_exitprocs+0x9c>
   1092e:	faf907e3          	beq	s2,a5,108dc <__call_exitprocs+0x46>
   10932:	dbcd                	beqz	a5,108e4 <__call_exitprocs+0x4e>
   10934:	893e                	mv	s2,a5
   10936:	b769                	j	108c0 <__call_exitprocs+0x2a>
   10938:	31492783          	lw	a5,788(s2)
   1093c:	1084b583          	ld	a1,264(s1)
   10940:	8ff5                	and	a5,a5,a3
   10942:	2781                	sext.w	a5,a5
   10944:	e799                	bnez	a5,10952 <__call_exitprocs+0xbc>
   10946:	855a                	mv	a0,s6
   10948:	9702                	jalr	a4
   1094a:	bfe1                	j	10922 <__call_exitprocs+0x8c>
   1094c:	00892423          	sw	s0,8(s2)
   10950:	bf75                	j	1090c <__call_exitprocs+0x76>
   10952:	852e                	mv	a0,a1
   10954:	9702                	jalr	a4
   10956:	b7f1                	j	10922 <__call_exitprocs+0x8c>

0000000000010958 <__libc_fini_array>:
   10958:	1101                	addi	sp,sp,-32
   1095a:	e822                	sd	s0,16(sp)
   1095c:	67c5                	lui	a5,0x11
   1095e:	6445                	lui	s0,0x11
   10960:	01840413          	addi	s0,s0,24 # 11018 <__init_array_end>
   10964:	02078793          	addi	a5,a5,32 # 11020 <__fini_array_end>
   10968:	8f81                	sub	a5,a5,s0
   1096a:	e426                	sd	s1,8(sp)
   1096c:	ec06                	sd	ra,24(sp)
   1096e:	4037d493          	srai	s1,a5,0x3
   10972:	c881                	beqz	s1,10982 <__libc_fini_array+0x2a>
   10974:	17e1                	addi	a5,a5,-8
   10976:	943e                	add	s0,s0,a5
   10978:	601c                	ld	a5,0(s0)
   1097a:	14fd                	addi	s1,s1,-1
   1097c:	1461                	addi	s0,s0,-8
   1097e:	9782                	jalr	a5
   10980:	fce5                	bnez	s1,10978 <__libc_fini_array+0x20>
   10982:	60e2                	ld	ra,24(sp)
   10984:	6442                	ld	s0,16(sp)
   10986:	64a2                	ld	s1,8(sp)
   10988:	6105                	addi	sp,sp,32
   1098a:	8082                	ret

000000000001098c <atexit>:
   1098c:	85aa                	mv	a1,a0
   1098e:	4681                	li	a3,0
   10990:	4601                	li	a2,0
   10992:	4501                	li	a0,0
   10994:	a009                	j	10996 <__register_exitproc>

0000000000010996 <__register_exitproc>:
   10996:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   1099a:	1f873783          	ld	a5,504(a4)
   1099e:	c3b1                	beqz	a5,109e2 <__register_exitproc+0x4c>
   109a0:	4798                	lw	a4,8(a5)
   109a2:	487d                	li	a6,31
   109a4:	06e84263          	blt	a6,a4,10a08 <__register_exitproc+0x72>
   109a8:	c505                	beqz	a0,109d0 <__register_exitproc+0x3a>
   109aa:	00371813          	slli	a6,a4,0x3
   109ae:	983e                	add	a6,a6,a5
   109b0:	10c83823          	sd	a2,272(a6)
   109b4:	3107a883          	lw	a7,784(a5)
   109b8:	4605                	li	a2,1
   109ba:	00e6163b          	sllw	a2,a2,a4
   109be:	00c8e8b3          	or	a7,a7,a2
   109c2:	3117a823          	sw	a7,784(a5)
   109c6:	20d83823          	sd	a3,528(a6)
   109ca:	4689                	li	a3,2
   109cc:	02d50063          	beq	a0,a3,109ec <__register_exitproc+0x56>
   109d0:	00270693          	addi	a3,a4,2
   109d4:	068e                	slli	a3,a3,0x3
   109d6:	2705                	addiw	a4,a4,1
   109d8:	c798                	sw	a4,8(a5)
   109da:	97b6                	add	a5,a5,a3
   109dc:	e38c                	sd	a1,0(a5)
   109de:	4501                	li	a0,0
   109e0:	8082                	ret
   109e2:	20070793          	addi	a5,a4,512
   109e6:	1ef73c23          	sd	a5,504(a4)
   109ea:	bf5d                	j	109a0 <__register_exitproc+0xa>
   109ec:	3147a683          	lw	a3,788(a5)
   109f0:	4501                	li	a0,0
   109f2:	8e55                	or	a2,a2,a3
   109f4:	00270693          	addi	a3,a4,2
   109f8:	068e                	slli	a3,a3,0x3
   109fa:	2705                	addiw	a4,a4,1
   109fc:	30c7aa23          	sw	a2,788(a5)
   10a00:	c798                	sw	a4,8(a5)
   10a02:	97b6                	add	a5,a5,a3
   10a04:	e38c                	sd	a1,0(a5)
   10a06:	8082                	ret
   10a08:	557d                	li	a0,-1
   10a0a:	8082                	ret

0000000000010a0c <_exit>:
   10a0c:	4581                	li	a1,0
   10a0e:	4601                	li	a2,0
   10a10:	4681                	li	a3,0
   10a12:	4701                	li	a4,0
   10a14:	4781                	li	a5,0
   10a16:	05d00893          	li	a7,93
   10a1a:	00000073          	ecall
   10a1e:	00054363          	bltz	a0,10a24 <_exit+0x18>
   10a22:	a001                	j	10a22 <_exit+0x16>
   10a24:	1141                	addi	sp,sp,-16
   10a26:	e022                	sd	s0,0(sp)
   10a28:	842a                	mv	s0,a0
   10a2a:	e406                	sd	ra,8(sp)
   10a2c:	4080043b          	negw	s0,s0
   10a30:	008000ef          	jal	ra,10a38 <__errno>
   10a34:	c100                	sw	s0,0(a0)
   10a36:	a001                	j	10a36 <_exit+0x2a>

0000000000010a38 <__errno>:
   10a38:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10a3c:	8082                	ret

Matrixmul.elf:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c791                	beqz	a5,100c4 <register_fini+0x14>
   100ba:	6545                	lui	a0,0x11
   100bc:	9ac50513          	addi	a0,a0,-1620 # 109ac <__libc_fini_array>
   100c0:	1210006f          	j	109e0 <atexit>
   100c4:	8082                	ret

00000000000100c6 <_start>:
   100c6:	00001197          	auipc	gp,0x1
   100ca:	75a18193          	addi	gp,gp,1882 # 11820 <__global_pointer$>
   100ce:	f6018513          	addi	a0,gp,-160 # 11780 <_edata>
   100d2:	f9818613          	addi	a2,gp,-104 # 117b8 <__BSS_END__>
   100d6:	8e09                	sub	a2,a2,a0
   100d8:	4581                	li	a1,0
   100da:	766000ef          	jal	ra,10840 <memset>
   100de:	00001517          	auipc	a0,0x1
   100e2:	90250513          	addi	a0,a0,-1790 # 109e0 <atexit>
   100e6:	c519                	beqz	a0,100f4 <_start+0x2e>
   100e8:	00001517          	auipc	a0,0x1
   100ec:	8c450513          	addi	a0,a0,-1852 # 109ac <__libc_fini_array>
   100f0:	0f1000ef          	jal	ra,109e0 <atexit>
   100f4:	6e2000ef          	jal	ra,107d6 <__libc_init_array>
   100f8:	4502                	lw	a0,0(sp)
   100fa:	002c                	addi	a1,sp,8
   100fc:	4601                	li	a2,0
   100fe:	552000ef          	jal	ra,10650 <main>
   10102:	ad5d                	j	107b8 <exit>

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

0000000000010348 <matrixmul>:
   10348:	fb010113          	addi	sp,sp,-80
   1034c:	04813423          	sd	s0,72(sp)
   10350:	05010413          	addi	s0,sp,80
   10354:	fca43c23          	sd	a0,-40(s0)
   10358:	fcb43823          	sd	a1,-48(s0)
   1035c:	fcc43423          	sd	a2,-56(s0)
   10360:	00068613          	mv	a2,a3
   10364:	00070693          	mv	a3,a4
   10368:	00078713          	mv	a4,a5
   1036c:	00060793          	mv	a5,a2
   10370:	fcf42223          	sw	a5,-60(s0)
   10374:	00068793          	mv	a5,a3
   10378:	fcf42023          	sw	a5,-64(s0)
   1037c:	00070793          	mv	a5,a4
   10380:	faf42e23          	sw	a5,-68(s0)
   10384:	fe042623          	sw	zero,-20(s0)
   10388:	1600006f          	j	104e8 <matrixmul+0x1a0>
   1038c:	fe042423          	sw	zero,-24(s0)
   10390:	1380006f          	j	104c8 <matrixmul+0x180>
   10394:	fec42703          	lw	a4,-20(s0)
   10398:	00070793          	mv	a5,a4
   1039c:	00279793          	slli	a5,a5,0x2
   103a0:	00e787b3          	add	a5,a5,a4
   103a4:	00279793          	slli	a5,a5,0x2
   103a8:	00078713          	mv	a4,a5
   103ac:	fc843783          	ld	a5,-56(s0)
   103b0:	00e78733          	add	a4,a5,a4
   103b4:	fe842783          	lw	a5,-24(s0)
   103b8:	00279793          	slli	a5,a5,0x2
   103bc:	00f707b3          	add	a5,a4,a5
   103c0:	0007a023          	sw	zero,0(a5)
   103c4:	fe042223          	sw	zero,-28(s0)
   103c8:	0e00006f          	j	104a8 <matrixmul+0x160>
   103cc:	fec42703          	lw	a4,-20(s0)
   103d0:	00070793          	mv	a5,a4
   103d4:	00279793          	slli	a5,a5,0x2
   103d8:	00e787b3          	add	a5,a5,a4
   103dc:	00279793          	slli	a5,a5,0x2
   103e0:	00078713          	mv	a4,a5
   103e4:	fc843783          	ld	a5,-56(s0)
   103e8:	00e78733          	add	a4,a5,a4
   103ec:	fe842783          	lw	a5,-24(s0)
   103f0:	00279793          	slli	a5,a5,0x2
   103f4:	00f707b3          	add	a5,a4,a5
   103f8:	0007a583          	lw	a1,0(a5)
   103fc:	fec42703          	lw	a4,-20(s0)
   10400:	00070793          	mv	a5,a4
   10404:	00279793          	slli	a5,a5,0x2
   10408:	00e787b3          	add	a5,a5,a4
   1040c:	00279793          	slli	a5,a5,0x2
   10410:	00078713          	mv	a4,a5
   10414:	fd843783          	ld	a5,-40(s0)
   10418:	00e78733          	add	a4,a5,a4
   1041c:	fe442783          	lw	a5,-28(s0)
   10420:	00279793          	slli	a5,a5,0x2
   10424:	00f707b3          	add	a5,a4,a5
   10428:	0007a683          	lw	a3,0(a5)
   1042c:	fe442703          	lw	a4,-28(s0)
   10430:	00070793          	mv	a5,a4
   10434:	00279793          	slli	a5,a5,0x2
   10438:	00e787b3          	add	a5,a5,a4
   1043c:	00279793          	slli	a5,a5,0x2
   10440:	00078713          	mv	a4,a5
   10444:	fd043783          	ld	a5,-48(s0)
   10448:	00e78733          	add	a4,a5,a4
   1044c:	fe842783          	lw	a5,-24(s0)
   10450:	00279793          	slli	a5,a5,0x2
   10454:	00f707b3          	add	a5,a4,a5
   10458:	0007a783          	lw	a5,0(a5)
   1045c:	02f687bb          	mulw	a5,a3,a5
   10460:	0007861b          	sext.w	a2,a5
   10464:	fec42703          	lw	a4,-20(s0)
   10468:	00070793          	mv	a5,a4
   1046c:	00279793          	slli	a5,a5,0x2
   10470:	00e787b3          	add	a5,a5,a4
   10474:	00279793          	slli	a5,a5,0x2
   10478:	00078713          	mv	a4,a5
   1047c:	fc843783          	ld	a5,-56(s0)
   10480:	00e786b3          	add	a3,a5,a4
   10484:	00c587bb          	addw	a5,a1,a2
   10488:	0007871b          	sext.w	a4,a5
   1048c:	fe842783          	lw	a5,-24(s0)
   10490:	00279793          	slli	a5,a5,0x2
   10494:	00f687b3          	add	a5,a3,a5
   10498:	00e7a023          	sw	a4,0(a5)
   1049c:	fe442783          	lw	a5,-28(s0)
   104a0:	0017879b          	addiw	a5,a5,1
   104a4:	fef42223          	sw	a5,-28(s0)
   104a8:	fe442703          	lw	a4,-28(s0)
   104ac:	fc042783          	lw	a5,-64(s0)
   104b0:	0007071b          	sext.w	a4,a4
   104b4:	0007879b          	sext.w	a5,a5
   104b8:	f0f74ae3          	blt	a4,a5,103cc <matrixmul+0x84>
   104bc:	fe842783          	lw	a5,-24(s0)
   104c0:	0017879b          	addiw	a5,a5,1
   104c4:	fef42423          	sw	a5,-24(s0)
   104c8:	fe842703          	lw	a4,-24(s0)
   104cc:	fbc42783          	lw	a5,-68(s0)
   104d0:	0007071b          	sext.w	a4,a4
   104d4:	0007879b          	sext.w	a5,a5
   104d8:	eaf74ee3          	blt	a4,a5,10394 <matrixmul+0x4c>
   104dc:	fec42783          	lw	a5,-20(s0)
   104e0:	0017879b          	addiw	a5,a5,1
   104e4:	fef42623          	sw	a5,-20(s0)
   104e8:	fec42703          	lw	a4,-20(s0)
   104ec:	fc442783          	lw	a5,-60(s0)
   104f0:	0007071b          	sext.w	a4,a4
   104f4:	0007879b          	sext.w	a5,a5
   104f8:	e8f74ae3          	blt	a4,a5,1038c <matrixmul+0x44>
   104fc:	00000013          	nop
   10500:	00000013          	nop
   10504:	04813403          	ld	s0,72(sp)
   10508:	05010113          	addi	sp,sp,80
   1050c:	00008067          	ret

0000000000010510 <printmatrix>:
   10510:	fc010113          	addi	sp,sp,-64
   10514:	02113c23          	sd	ra,56(sp)
   10518:	02813823          	sd	s0,48(sp)
   1051c:	04010413          	addi	s0,sp,64
   10520:	fca43423          	sd	a0,-56(s0)
   10524:	fe042623          	sw	zero,-20(s0)
   10528:	0e00006f          	j	10608 <printmatrix+0xf8>
   1052c:	fe042423          	sw	zero,-24(s0)
   10530:	0980006f          	j	105c8 <printmatrix+0xb8>
   10534:	fec42703          	lw	a4,-20(s0)
   10538:	00070793          	mv	a5,a4
   1053c:	00279793          	slli	a5,a5,0x2
   10540:	00e787b3          	add	a5,a5,a4
   10544:	00279793          	slli	a5,a5,0x2
   10548:	00078713          	mv	a4,a5
   1054c:	fc843783          	ld	a5,-56(s0)
   10550:	00e78733          	add	a4,a5,a4
   10554:	fe842783          	lw	a5,-24(s0)
   10558:	00279793          	slli	a5,a5,0x2
   1055c:	00f707b3          	add	a5,a4,a5
   10560:	0007a783          	lw	a5,0(a5)
   10564:	fd040713          	addi	a4,s0,-48
   10568:	00070593          	mv	a1,a4
   1056c:	00078513          	mv	a0,a5
   10570:	be9ff0ef          	jal	ra,10158 <Int2Str>
   10574:	00050793          	mv	a5,a0
   10578:	fef42223          	sw	a5,-28(s0)
   1057c:	fd040793          	addi	a5,s0,-48
   10580:	fe442683          	lw	a3,-28(s0)
   10584:	00000713          	li	a4,0
   10588:	00078613          	mv	a2,a5
   1058c:	00100593          	li	a1,1
   10590:	04000513          	li	a0,64
   10594:	d69ff0ef          	jal	ra,102fc <my_syscall>
   10598:	02000793          	li	a5,32
   1059c:	fcf40823          	sb	a5,-48(s0)
   105a0:	fd040793          	addi	a5,s0,-48
   105a4:	00000713          	li	a4,0
   105a8:	00100693          	li	a3,1
   105ac:	00078613          	mv	a2,a5
   105b0:	00100593          	li	a1,1
   105b4:	04000513          	li	a0,64
   105b8:	d45ff0ef          	jal	ra,102fc <my_syscall>
   105bc:	fe842783          	lw	a5,-24(s0)
   105c0:	0017879b          	addiw	a5,a5,1
   105c4:	fef42423          	sw	a5,-24(s0)
   105c8:	fe842783          	lw	a5,-24(s0)
   105cc:	0007871b          	sext.w	a4,a5
   105d0:	00400793          	li	a5,4
   105d4:	f6e7d0e3          	bge	a5,a4,10534 <printmatrix+0x24>
   105d8:	00a00793          	li	a5,10
   105dc:	fcf40823          	sb	a5,-48(s0)
   105e0:	fd040793          	addi	a5,s0,-48
   105e4:	00000713          	li	a4,0
   105e8:	00100693          	li	a3,1
   105ec:	00078613          	mv	a2,a5
   105f0:	00100593          	li	a1,1
   105f4:	04000513          	li	a0,64
   105f8:	d05ff0ef          	jal	ra,102fc <my_syscall>
   105fc:	fec42783          	lw	a5,-20(s0)
   10600:	0017879b          	addiw	a5,a5,1
   10604:	fef42623          	sw	a5,-20(s0)
   10608:	fec42783          	lw	a5,-20(s0)
   1060c:	0007871b          	sext.w	a4,a5
   10610:	00400793          	li	a5,4
   10614:	f0e7dce3          	bge	a5,a4,1052c <printmatrix+0x1c>
   10618:	00a00793          	li	a5,10
   1061c:	fcf40823          	sb	a5,-48(s0)
   10620:	fd040793          	addi	a5,s0,-48
   10624:	00000713          	li	a4,0
   10628:	00100693          	li	a3,1
   1062c:	00078613          	mv	a2,a5
   10630:	00100593          	li	a1,1
   10634:	04000513          	li	a0,64
   10638:	cc5ff0ef          	jal	ra,102fc <my_syscall>
   1063c:	00000013          	nop
   10640:	03813083          	ld	ra,56(sp)
   10644:	03013403          	ld	s0,48(sp)
   10648:	04010113          	addi	sp,sp,64
   1064c:	00008067          	ret

0000000000010650 <main>:
   10650:	eb010113          	addi	sp,sp,-336
   10654:	14113423          	sd	ra,328(sp)
   10658:	14813023          	sd	s0,320(sp)
   1065c:	15010413          	addi	s0,sp,336
   10660:	fe042623          	sw	zero,-20(s0)
   10664:	0ec0006f          	j	10750 <main+0x100>
   10668:	fe042423          	sw	zero,-24(s0)
   1066c:	0c80006f          	j	10734 <main+0xe4>
   10670:	fec42703          	lw	a4,-20(s0)
   10674:	41f7579b          	sraiw	a5,a4,0x1f
   10678:	01f7d79b          	srliw	a5,a5,0x1f
   1067c:	00f7073b          	addw	a4,a4,a5
   10680:	00177713          	andi	a4,a4,1
   10684:	40f707bb          	subw	a5,a4,a5
   10688:	0007871b          	sext.w	a4,a5
   1068c:	fe842683          	lw	a3,-24(s0)
   10690:	00300793          	li	a5,3
   10694:	02f6e7bb          	remw	a5,a3,a5
   10698:	0007879b          	sext.w	a5,a5
   1069c:	00f707bb          	addw	a5,a4,a5
   106a0:	0007869b          	sext.w	a3,a5
   106a4:	fe842603          	lw	a2,-24(s0)
   106a8:	fec42703          	lw	a4,-20(s0)
   106ac:	00070793          	mv	a5,a4
   106b0:	00279793          	slli	a5,a5,0x2
   106b4:	00e787b3          	add	a5,a5,a4
   106b8:	00c787b3          	add	a5,a5,a2
   106bc:	00279793          	slli	a5,a5,0x2
   106c0:	ff040713          	addi	a4,s0,-16
   106c4:	00f707b3          	add	a5,a4,a5
   106c8:	f8d7a823          	sw	a3,-112(a5)
   106cc:	fec42703          	lw	a4,-20(s0)
   106d0:	00300793          	li	a5,3
   106d4:	02f767bb          	remw	a5,a4,a5
   106d8:	0007869b          	sext.w	a3,a5
   106dc:	fe842703          	lw	a4,-24(s0)
   106e0:	41f7579b          	sraiw	a5,a4,0x1f
   106e4:	01f7d79b          	srliw	a5,a5,0x1f
   106e8:	00f7073b          	addw	a4,a4,a5
   106ec:	00177713          	andi	a4,a4,1
   106f0:	40f707bb          	subw	a5,a4,a5
   106f4:	0007879b          	sext.w	a5,a5
   106f8:	00f687bb          	addw	a5,a3,a5
   106fc:	0007869b          	sext.w	a3,a5
   10700:	fe842603          	lw	a2,-24(s0)
   10704:	fec42703          	lw	a4,-20(s0)
   10708:	00070793          	mv	a5,a4
   1070c:	00279793          	slli	a5,a5,0x2
   10710:	00e787b3          	add	a5,a5,a4
   10714:	00c787b3          	add	a5,a5,a2
   10718:	00279793          	slli	a5,a5,0x2
   1071c:	ff040713          	addi	a4,s0,-16
   10720:	00f707b3          	add	a5,a4,a5
   10724:	f2d7a423          	sw	a3,-216(a5)
   10728:	fe842783          	lw	a5,-24(s0)
   1072c:	0017879b          	addiw	a5,a5,1
   10730:	fef42423          	sw	a5,-24(s0)
   10734:	fe842783          	lw	a5,-24(s0)
   10738:	0007871b          	sext.w	a4,a5
   1073c:	00400793          	li	a5,4
   10740:	f2e7d8e3          	bge	a5,a4,10670 <main+0x20>
   10744:	fec42783          	lw	a5,-20(s0)
   10748:	0017879b          	addiw	a5,a5,1
   1074c:	fef42623          	sw	a5,-20(s0)
   10750:	fec42783          	lw	a5,-20(s0)
   10754:	0007871b          	sext.w	a4,a5
   10758:	00400793          	li	a5,4
   1075c:	f0e7d6e3          	bge	a5,a4,10668 <main+0x18>
   10760:	eb040613          	addi	a2,s0,-336
   10764:	f1840593          	addi	a1,s0,-232
   10768:	f8040513          	addi	a0,s0,-128
   1076c:	00500793          	li	a5,5
   10770:	00500713          	li	a4,5
   10774:	00500693          	li	a3,5
   10778:	bd1ff0ef          	jal	ra,10348 <matrixmul>
   1077c:	f8040793          	addi	a5,s0,-128
   10780:	00078513          	mv	a0,a5
   10784:	d8dff0ef          	jal	ra,10510 <printmatrix>
   10788:	f1840793          	addi	a5,s0,-232
   1078c:	00078513          	mv	a0,a5
   10790:	d81ff0ef          	jal	ra,10510 <printmatrix>
   10794:	eb040793          	addi	a5,s0,-336
   10798:	00078513          	mv	a0,a5
   1079c:	d75ff0ef          	jal	ra,10510 <printmatrix>
   107a0:	00000793          	li	a5,0
   107a4:	00078513          	mv	a0,a5
   107a8:	14813083          	ld	ra,328(sp)
   107ac:	14013403          	ld	s0,320(sp)
   107b0:	15010113          	addi	sp,sp,336
   107b4:	00008067          	ret

00000000000107b8 <exit>:
   107b8:	1141                	addi	sp,sp,-16
   107ba:	4581                	li	a1,0
   107bc:	e022                	sd	s0,0(sp)
   107be:	e406                	sd	ra,8(sp)
   107c0:	842a                	mv	s0,a0
   107c2:	128000ef          	jal	ra,108ea <__call_exitprocs>
   107c6:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   107ca:	6d3c                	ld	a5,88(a0)
   107cc:	c391                	beqz	a5,107d0 <exit+0x18>
   107ce:	9782                	jalr	a5
   107d0:	8522                	mv	a0,s0
   107d2:	28e000ef          	jal	ra,10a60 <_exit>

00000000000107d6 <__libc_init_array>:
   107d6:	1101                	addi	sp,sp,-32
   107d8:	e822                	sd	s0,16(sp)
   107da:	e04a                	sd	s2,0(sp)
   107dc:	6445                	lui	s0,0x11
   107de:	6945                	lui	s2,0x11
   107e0:	00440793          	addi	a5,s0,4 # 11004 <__preinit_array_end>
   107e4:	00490913          	addi	s2,s2,4 # 11004 <__preinit_array_end>
   107e8:	40f90933          	sub	s2,s2,a5
   107ec:	ec06                	sd	ra,24(sp)
   107ee:	e426                	sd	s1,8(sp)
   107f0:	40395913          	srai	s2,s2,0x3
   107f4:	00090b63          	beqz	s2,1080a <__libc_init_array+0x34>
   107f8:	00440413          	addi	s0,s0,4
   107fc:	4481                	li	s1,0
   107fe:	601c                	ld	a5,0(s0)
   10800:	0485                	addi	s1,s1,1
   10802:	0421                	addi	s0,s0,8
   10804:	9782                	jalr	a5
   10806:	fe991ce3          	bne	s2,s1,107fe <__libc_init_array+0x28>
   1080a:	6445                	lui	s0,0x11
   1080c:	6945                	lui	s2,0x11
   1080e:	00840793          	addi	a5,s0,8 # 11008 <__init_array_start>
   10812:	01890913          	addi	s2,s2,24 # 11018 <__init_array_end>
   10816:	40f90933          	sub	s2,s2,a5
   1081a:	40395913          	srai	s2,s2,0x3
   1081e:	00090b63          	beqz	s2,10834 <__libc_init_array+0x5e>
   10822:	00840413          	addi	s0,s0,8
   10826:	4481                	li	s1,0
   10828:	601c                	ld	a5,0(s0)
   1082a:	0485                	addi	s1,s1,1
   1082c:	0421                	addi	s0,s0,8
   1082e:	9782                	jalr	a5
   10830:	fe991ce3          	bne	s2,s1,10828 <__libc_init_array+0x52>
   10834:	60e2                	ld	ra,24(sp)
   10836:	6442                	ld	s0,16(sp)
   10838:	64a2                	ld	s1,8(sp)
   1083a:	6902                	ld	s2,0(sp)
   1083c:	6105                	addi	sp,sp,32
   1083e:	8082                	ret

0000000000010840 <memset>:
   10840:	433d                	li	t1,15
   10842:	872a                	mv	a4,a0
   10844:	02c37163          	bgeu	t1,a2,10866 <memset+0x26>
   10848:	00f77793          	andi	a5,a4,15
   1084c:	e3c1                	bnez	a5,108cc <memset+0x8c>
   1084e:	e1bd                	bnez	a1,108b4 <memset+0x74>
   10850:	ff067693          	andi	a3,a2,-16
   10854:	8a3d                	andi	a2,a2,15
   10856:	96ba                	add	a3,a3,a4
   10858:	e30c                	sd	a1,0(a4)
   1085a:	e70c                	sd	a1,8(a4)
   1085c:	0741                	addi	a4,a4,16
   1085e:	fed76de3          	bltu	a4,a3,10858 <memset+0x18>
   10862:	e211                	bnez	a2,10866 <memset+0x26>
   10864:	8082                	ret
   10866:	40c306b3          	sub	a3,t1,a2
   1086a:	068a                	slli	a3,a3,0x2
   1086c:	00000297          	auipc	t0,0x0
   10870:	9696                	add	a3,a3,t0
   10872:	00a68067          	jr	10(a3)
   10876:	00b70723          	sb	a1,14(a4)
   1087a:	00b706a3          	sb	a1,13(a4)
   1087e:	00b70623          	sb	a1,12(a4)
   10882:	00b705a3          	sb	a1,11(a4)
   10886:	00b70523          	sb	a1,10(a4)
   1088a:	00b704a3          	sb	a1,9(a4)
   1088e:	00b70423          	sb	a1,8(a4)
   10892:	00b703a3          	sb	a1,7(a4)
   10896:	00b70323          	sb	a1,6(a4)
   1089a:	00b702a3          	sb	a1,5(a4)
   1089e:	00b70223          	sb	a1,4(a4)
   108a2:	00b701a3          	sb	a1,3(a4)
   108a6:	00b70123          	sb	a1,2(a4)
   108aa:	00b700a3          	sb	a1,1(a4)
   108ae:	00b70023          	sb	a1,0(a4)
   108b2:	8082                	ret
   108b4:	0ff5f593          	andi	a1,a1,255
   108b8:	00859693          	slli	a3,a1,0x8
   108bc:	8dd5                	or	a1,a1,a3
   108be:	01059693          	slli	a3,a1,0x10
   108c2:	8dd5                	or	a1,a1,a3
   108c4:	02059693          	slli	a3,a1,0x20
   108c8:	8dd5                	or	a1,a1,a3
   108ca:	b759                	j	10850 <memset+0x10>
   108cc:	00279693          	slli	a3,a5,0x2
   108d0:	00000297          	auipc	t0,0x0
   108d4:	9696                	add	a3,a3,t0
   108d6:	8286                	mv	t0,ra
   108d8:	fa2680e7          	jalr	-94(a3)
   108dc:	8096                	mv	ra,t0
   108de:	17c1                	addi	a5,a5,-16
   108e0:	8f1d                	sub	a4,a4,a5
   108e2:	963e                	add	a2,a2,a5
   108e4:	f8c371e3          	bgeu	t1,a2,10866 <memset+0x26>
   108e8:	b79d                	j	1084e <memset+0xe>

00000000000108ea <__call_exitprocs>:
   108ea:	715d                	addi	sp,sp,-80
   108ec:	f052                	sd	s4,32(sp)
   108ee:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   108f2:	f84a                	sd	s2,48(sp)
   108f4:	e486                	sd	ra,72(sp)
   108f6:	1f8a3903          	ld	s2,504(s4)
   108fa:	e0a2                	sd	s0,64(sp)
   108fc:	fc26                	sd	s1,56(sp)
   108fe:	f44e                	sd	s3,40(sp)
   10900:	ec56                	sd	s5,24(sp)
   10902:	e85a                	sd	s6,16(sp)
   10904:	e45e                	sd	s7,8(sp)
   10906:	e062                	sd	s8,0(sp)
   10908:	02090863          	beqz	s2,10938 <__call_exitprocs+0x4e>
   1090c:	8b2a                	mv	s6,a0
   1090e:	8bae                	mv	s7,a1
   10910:	4a85                	li	s5,1
   10912:	59fd                	li	s3,-1
   10914:	00892483          	lw	s1,8(s2)
   10918:	fff4841b          	addiw	s0,s1,-1
   1091c:	00044e63          	bltz	s0,10938 <__call_exitprocs+0x4e>
   10920:	048e                	slli	s1,s1,0x3
   10922:	94ca                	add	s1,s1,s2
   10924:	020b8663          	beqz	s7,10950 <__call_exitprocs+0x66>
   10928:	2084b783          	ld	a5,520(s1)
   1092c:	03778263          	beq	a5,s7,10950 <__call_exitprocs+0x66>
   10930:	347d                	addiw	s0,s0,-1
   10932:	14e1                	addi	s1,s1,-8
   10934:	ff3418e3          	bne	s0,s3,10924 <__call_exitprocs+0x3a>
   10938:	60a6                	ld	ra,72(sp)
   1093a:	6406                	ld	s0,64(sp)
   1093c:	74e2                	ld	s1,56(sp)
   1093e:	7942                	ld	s2,48(sp)
   10940:	79a2                	ld	s3,40(sp)
   10942:	7a02                	ld	s4,32(sp)
   10944:	6ae2                	ld	s5,24(sp)
   10946:	6b42                	ld	s6,16(sp)
   10948:	6ba2                	ld	s7,8(sp)
   1094a:	6c02                	ld	s8,0(sp)
   1094c:	6161                	addi	sp,sp,80
   1094e:	8082                	ret
   10950:	00892783          	lw	a5,8(s2)
   10954:	6498                	ld	a4,8(s1)
   10956:	37fd                	addiw	a5,a5,-1
   10958:	04878463          	beq	a5,s0,109a0 <__call_exitprocs+0xb6>
   1095c:	0004b423          	sd	zero,8(s1)
   10960:	db61                	beqz	a4,10930 <__call_exitprocs+0x46>
   10962:	31092783          	lw	a5,784(s2)
   10966:	008a96bb          	sllw	a3,s5,s0
   1096a:	00892c03          	lw	s8,8(s2)
   1096e:	8ff5                	and	a5,a5,a3
   10970:	2781                	sext.w	a5,a5
   10972:	ef89                	bnez	a5,1098c <__call_exitprocs+0xa2>
   10974:	9702                	jalr	a4
   10976:	00892703          	lw	a4,8(s2)
   1097a:	1f8a3783          	ld	a5,504(s4)
   1097e:	01871463          	bne	a4,s8,10986 <__call_exitprocs+0x9c>
   10982:	faf907e3          	beq	s2,a5,10930 <__call_exitprocs+0x46>
   10986:	dbcd                	beqz	a5,10938 <__call_exitprocs+0x4e>
   10988:	893e                	mv	s2,a5
   1098a:	b769                	j	10914 <__call_exitprocs+0x2a>
   1098c:	31492783          	lw	a5,788(s2)
   10990:	1084b583          	ld	a1,264(s1)
   10994:	8ff5                	and	a5,a5,a3
   10996:	2781                	sext.w	a5,a5
   10998:	e799                	bnez	a5,109a6 <__call_exitprocs+0xbc>
   1099a:	855a                	mv	a0,s6
   1099c:	9702                	jalr	a4
   1099e:	bfe1                	j	10976 <__call_exitprocs+0x8c>
   109a0:	00892423          	sw	s0,8(s2)
   109a4:	bf75                	j	10960 <__call_exitprocs+0x76>
   109a6:	852e                	mv	a0,a1
   109a8:	9702                	jalr	a4
   109aa:	b7f1                	j	10976 <__call_exitprocs+0x8c>

00000000000109ac <__libc_fini_array>:
   109ac:	1101                	addi	sp,sp,-32
   109ae:	e822                	sd	s0,16(sp)
   109b0:	67c5                	lui	a5,0x11
   109b2:	6445                	lui	s0,0x11
   109b4:	01840413          	addi	s0,s0,24 # 11018 <__init_array_end>
   109b8:	02078793          	addi	a5,a5,32 # 11020 <__fini_array_end>
   109bc:	8f81                	sub	a5,a5,s0
   109be:	e426                	sd	s1,8(sp)
   109c0:	ec06                	sd	ra,24(sp)
   109c2:	4037d493          	srai	s1,a5,0x3
   109c6:	c881                	beqz	s1,109d6 <__libc_fini_array+0x2a>
   109c8:	17e1                	addi	a5,a5,-8
   109ca:	943e                	add	s0,s0,a5
   109cc:	601c                	ld	a5,0(s0)
   109ce:	14fd                	addi	s1,s1,-1
   109d0:	1461                	addi	s0,s0,-8
   109d2:	9782                	jalr	a5
   109d4:	fce5                	bnez	s1,109cc <__libc_fini_array+0x20>
   109d6:	60e2                	ld	ra,24(sp)
   109d8:	6442                	ld	s0,16(sp)
   109da:	64a2                	ld	s1,8(sp)
   109dc:	6105                	addi	sp,sp,32
   109de:	8082                	ret

00000000000109e0 <atexit>:
   109e0:	85aa                	mv	a1,a0
   109e2:	4681                	li	a3,0
   109e4:	4601                	li	a2,0
   109e6:	4501                	li	a0,0
   109e8:	a009                	j	109ea <__register_exitproc>

00000000000109ea <__register_exitproc>:
   109ea:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   109ee:	1f873783          	ld	a5,504(a4)
   109f2:	c3b1                	beqz	a5,10a36 <__register_exitproc+0x4c>
   109f4:	4798                	lw	a4,8(a5)
   109f6:	487d                	li	a6,31
   109f8:	06e84263          	blt	a6,a4,10a5c <__register_exitproc+0x72>
   109fc:	c505                	beqz	a0,10a24 <__register_exitproc+0x3a>
   109fe:	00371813          	slli	a6,a4,0x3
   10a02:	983e                	add	a6,a6,a5
   10a04:	10c83823          	sd	a2,272(a6)
   10a08:	3107a883          	lw	a7,784(a5)
   10a0c:	4605                	li	a2,1
   10a0e:	00e6163b          	sllw	a2,a2,a4
   10a12:	00c8e8b3          	or	a7,a7,a2
   10a16:	3117a823          	sw	a7,784(a5)
   10a1a:	20d83823          	sd	a3,528(a6)
   10a1e:	4689                	li	a3,2
   10a20:	02d50063          	beq	a0,a3,10a40 <__register_exitproc+0x56>
   10a24:	00270693          	addi	a3,a4,2
   10a28:	068e                	slli	a3,a3,0x3
   10a2a:	2705                	addiw	a4,a4,1
   10a2c:	c798                	sw	a4,8(a5)
   10a2e:	97b6                	add	a5,a5,a3
   10a30:	e38c                	sd	a1,0(a5)
   10a32:	4501                	li	a0,0
   10a34:	8082                	ret
   10a36:	20070793          	addi	a5,a4,512
   10a3a:	1ef73c23          	sd	a5,504(a4)
   10a3e:	bf5d                	j	109f4 <__register_exitproc+0xa>
   10a40:	3147a683          	lw	a3,788(a5)
   10a44:	4501                	li	a0,0
   10a46:	8e55                	or	a2,a2,a3
   10a48:	00270693          	addi	a3,a4,2
   10a4c:	068e                	slli	a3,a3,0x3
   10a4e:	2705                	addiw	a4,a4,1
   10a50:	30c7aa23          	sw	a2,788(a5)
   10a54:	c798                	sw	a4,8(a5)
   10a56:	97b6                	add	a5,a5,a3
   10a58:	e38c                	sd	a1,0(a5)
   10a5a:	8082                	ret
   10a5c:	557d                	li	a0,-1
   10a5e:	8082                	ret

0000000000010a60 <_exit>:
   10a60:	4581                	li	a1,0
   10a62:	4601                	li	a2,0
   10a64:	4681                	li	a3,0
   10a66:	4701                	li	a4,0
   10a68:	4781                	li	a5,0
   10a6a:	05d00893          	li	a7,93
   10a6e:	00000073          	ecall
   10a72:	00054363          	bltz	a0,10a78 <_exit+0x18>
   10a76:	a001                	j	10a76 <_exit+0x16>
   10a78:	1141                	addi	sp,sp,-16
   10a7a:	e022                	sd	s0,0(sp)
   10a7c:	842a                	mv	s0,a0
   10a7e:	e406                	sd	ra,8(sp)
   10a80:	4080043b          	negw	s0,s0
   10a84:	008000ef          	jal	ra,10a8c <__errno>
   10a88:	c100                	sw	s0,0(a0)
   10a8a:	a001                	j	10a8a <_exit+0x2a>

0000000000010a8c <__errno>:
   10a8c:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10a90:	8082                	ret
