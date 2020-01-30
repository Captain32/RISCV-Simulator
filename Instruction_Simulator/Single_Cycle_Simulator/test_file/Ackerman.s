
Ackerman.elf:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c789                	beqz	a5,100c2 <register_fini+0x12>
   100ba:	6541                	lui	a0,0x10
   100bc:	69450513          	addi	a0,a0,1684 # 10694 <__libc_fini_array>
   100c0:	a521                	j	106c8 <atexit>
   100c2:	8082                	ret

00000000000100c4 <_start>:
   100c4:	00002197          	auipc	gp,0x2
   100c8:	ed418193          	addi	gp,gp,-300 # 11f98 <__global_pointer$>
   100cc:	f6018513          	addi	a0,gp,-160 # 11ef8 <_edata>
   100d0:	f9818613          	addi	a2,gp,-104 # 11f30 <__BSS_END__>
   100d4:	8e09                	sub	a2,a2,a0
   100d6:	4581                	li	a1,0
   100d8:	450000ef          	jal	ra,10528 <memset>
   100dc:	00000517          	auipc	a0,0x0
   100e0:	5ec50513          	addi	a0,a0,1516 # 106c8 <atexit>
   100e4:	c519                	beqz	a0,100f2 <_start+0x2e>
   100e6:	00000517          	auipc	a0,0x0
   100ea:	5ae50513          	addi	a0,a0,1454 # 10694 <__libc_fini_array>
   100ee:	5da000ef          	jal	ra,106c8 <atexit>
   100f2:	3cc000ef          	jal	ra,104be <__libc_init_array>
   100f6:	4502                	lw	a0,0(sp)
   100f8:	002c                	addi	a1,sp,8
   100fa:	4601                	li	a2,0
   100fc:	310000ef          	jal	ra,1040c <main>
   10100:	a645                	j	104a0 <exit>

0000000000010102 <__do_global_dtors_aux>:
   10102:	f601c703          	lbu	a4,-160(gp) # 11ef8 <_edata>
   10106:	eb05                	bnez	a4,10136 <__do_global_dtors_aux+0x34>
   10108:	1141                	addi	sp,sp,-16
   1010a:	e022                	sd	s0,0(sp)
   1010c:	843e                	mv	s0,a5
   1010e:	000007b7          	lui	a5,0x0
   10112:	e406                	sd	ra,8(sp)
   10114:	00078793          	mv	a5,a5
   10118:	cb81                	beqz	a5,10128 <__do_global_dtors_aux+0x26>
   1011a:	6545                	lui	a0,0x11
   1011c:	77c50513          	addi	a0,a0,1916 # 1177c <__FRAME_END__>
   10120:	00000097          	auipc	ra,0x0
   10124:	000000e7          	jalr	zero # 0 <register_fini-0x100b0>
   10128:	4785                	li	a5,1
   1012a:	60a2                	ld	ra,8(sp)
   1012c:	f6f18023          	sb	a5,-160(gp) # 11ef8 <_edata>
   10130:	6402                	ld	s0,0(sp)
   10132:	0141                	addi	sp,sp,16
   10134:	8082                	ret
   10136:	8082                	ret

0000000000010138 <frame_dummy>:
   10138:	000007b7          	lui	a5,0x0
   1013c:	00078793          	mv	a5,a5
   10140:	cb91                	beqz	a5,10154 <frame_dummy+0x1c>
   10142:	6545                	lui	a0,0x11
   10144:	f6818593          	addi	a1,gp,-152 # 11f00 <object.5532>
   10148:	77c50513          	addi	a0,a0,1916 # 1177c <__FRAME_END__>
   1014c:	00000317          	auipc	t1,0x0
   10150:	00000067          	jr	zero # 0 <register_fini-0x100b0>
   10154:	8082                	ret
	...

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

0000000000010348 <ack>:
   10348:	fd010113          	addi	sp,sp,-48
   1034c:	02113423          	sd	ra,40(sp)
   10350:	02813023          	sd	s0,32(sp)
   10354:	00913c23          	sd	s1,24(sp)
   10358:	03010413          	addi	s0,sp,48
   1035c:	00050793          	mv	a5,a0
   10360:	00058713          	mv	a4,a1
   10364:	fcf42e23          	sw	a5,-36(s0)
   10368:	00070793          	mv	a5,a4
   1036c:	fcf42c23          	sw	a5,-40(s0)
   10370:	fdc42783          	lw	a5,-36(s0)
   10374:	0007879b          	sext.w	a5,a5
   10378:	00079a63          	bnez	a5,1038c <ack+0x44>
   1037c:	fd842783          	lw	a5,-40(s0)
   10380:	0017879b          	addiw	a5,a5,1
   10384:	0007879b          	sext.w	a5,a5
   10388:	06c0006f          	j	103f4 <ack+0xac>
   1038c:	fd842783          	lw	a5,-40(s0)
   10390:	0007879b          	sext.w	a5,a5
   10394:	02079263          	bnez	a5,103b8 <ack+0x70>
   10398:	fdc42783          	lw	a5,-36(s0)
   1039c:	fff7879b          	addiw	a5,a5,-1
   103a0:	0007879b          	sext.w	a5,a5
   103a4:	00100593          	li	a1,1
   103a8:	00078513          	mv	a0,a5
   103ac:	f9dff0ef          	jal	ra,10348 <ack>
   103b0:	00050793          	mv	a5,a0
   103b4:	0400006f          	j	103f4 <ack+0xac>
   103b8:	fdc42783          	lw	a5,-36(s0)
   103bc:	fff7879b          	addiw	a5,a5,-1
   103c0:	0007849b          	sext.w	s1,a5
   103c4:	fd842783          	lw	a5,-40(s0)
   103c8:	fff7879b          	addiw	a5,a5,-1
   103cc:	0007871b          	sext.w	a4,a5
   103d0:	fdc42783          	lw	a5,-36(s0)
   103d4:	00070593          	mv	a1,a4
   103d8:	00078513          	mv	a0,a5
   103dc:	f6dff0ef          	jal	ra,10348 <ack>
   103e0:	00050793          	mv	a5,a0
   103e4:	00078593          	mv	a1,a5
   103e8:	00048513          	mv	a0,s1
   103ec:	f5dff0ef          	jal	ra,10348 <ack>
   103f0:	00050793          	mv	a5,a0
   103f4:	00078513          	mv	a0,a5
   103f8:	02813083          	ld	ra,40(sp)
   103fc:	02013403          	ld	s0,32(sp)
   10400:	01813483          	ld	s1,24(sp)
   10404:	03010113          	addi	sp,sp,48
   10408:	00008067          	ret

000000000001040c <main>:
   1040c:	fd010113          	addi	sp,sp,-48
   10410:	02113423          	sd	ra,40(sp)
   10414:	02813023          	sd	s0,32(sp)
   10418:	03010413          	addi	s0,sp,48
   1041c:	00a00593          	li	a1,10
   10420:	00300513          	li	a0,3
   10424:	f25ff0ef          	jal	ra,10348 <ack>
   10428:	00050793          	mv	a5,a0
   1042c:	00078713          	mv	a4,a5
   10430:	fd840793          	addi	a5,s0,-40
   10434:	00078593          	mv	a1,a5
   10438:	00070513          	mv	a0,a4
   1043c:	d1dff0ef          	jal	ra,10158 <Int2Str>
   10440:	00050793          	mv	a5,a0
   10444:	fef42623          	sw	a5,-20(s0)
   10448:	fd840793          	addi	a5,s0,-40
   1044c:	fec42683          	lw	a3,-20(s0)
   10450:	00000713          	li	a4,0
   10454:	00078613          	mv	a2,a5
   10458:	00100593          	li	a1,1
   1045c:	04000513          	li	a0,64
   10460:	e9dff0ef          	jal	ra,102fc <my_syscall>
   10464:	00a00793          	li	a5,10
   10468:	fcf40c23          	sb	a5,-40(s0)
   1046c:	fd840793          	addi	a5,s0,-40
   10470:	00000713          	li	a4,0
   10474:	00100693          	li	a3,1
   10478:	00078613          	mv	a2,a5
   1047c:	00100593          	li	a1,1
   10480:	04000513          	li	a0,64
   10484:	e79ff0ef          	jal	ra,102fc <my_syscall>
   10488:	00000793          	li	a5,0
   1048c:	00078513          	mv	a0,a5
   10490:	02813083          	ld	ra,40(sp)
   10494:	02013403          	ld	s0,32(sp)
   10498:	03010113          	addi	sp,sp,48
   1049c:	00008067          	ret

00000000000104a0 <exit>:
   104a0:	1141                	addi	sp,sp,-16
   104a2:	4581                	li	a1,0
   104a4:	e022                	sd	s0,0(sp)
   104a6:	e406                	sd	ra,8(sp)
   104a8:	842a                	mv	s0,a0
   104aa:	128000ef          	jal	ra,105d2 <__call_exitprocs>
   104ae:	f481b503          	ld	a0,-184(gp) # 11ee0 <_global_impure_ptr>
   104b2:	6d3c                	ld	a5,88(a0)
   104b4:	c391                	beqz	a5,104b8 <exit+0x18>
   104b6:	9782                	jalr	a5
   104b8:	8522                	mv	a0,s0
   104ba:	28e000ef          	jal	ra,10748 <_exit>

00000000000104be <__libc_init_array>:
   104be:	1101                	addi	sp,sp,-32
   104c0:	e822                	sd	s0,16(sp)
   104c2:	e04a                	sd	s2,0(sp)
   104c4:	6445                	lui	s0,0x11
   104c6:	6945                	lui	s2,0x11
   104c8:	78040793          	addi	a5,s0,1920 # 11780 <__init_array_start>
   104cc:	78090913          	addi	s2,s2,1920 # 11780 <__init_array_start>
   104d0:	40f90933          	sub	s2,s2,a5
   104d4:	ec06                	sd	ra,24(sp)
   104d6:	e426                	sd	s1,8(sp)
   104d8:	40395913          	srai	s2,s2,0x3
   104dc:	00090b63          	beqz	s2,104f2 <__libc_init_array+0x34>
   104e0:	78040413          	addi	s0,s0,1920
   104e4:	4481                	li	s1,0
   104e6:	601c                	ld	a5,0(s0)
   104e8:	0485                	addi	s1,s1,1
   104ea:	0421                	addi	s0,s0,8
   104ec:	9782                	jalr	a5
   104ee:	fe991ce3          	bne	s2,s1,104e6 <__libc_init_array+0x28>
   104f2:	6445                	lui	s0,0x11
   104f4:	6945                	lui	s2,0x11
   104f6:	78040793          	addi	a5,s0,1920 # 11780 <__init_array_start>
   104fa:	79090913          	addi	s2,s2,1936 # 11790 <__init_array_end>
   104fe:	40f90933          	sub	s2,s2,a5
   10502:	40395913          	srai	s2,s2,0x3
   10506:	00090b63          	beqz	s2,1051c <__libc_init_array+0x5e>
   1050a:	78040413          	addi	s0,s0,1920
   1050e:	4481                	li	s1,0
   10510:	601c                	ld	a5,0(s0)
   10512:	0485                	addi	s1,s1,1
   10514:	0421                	addi	s0,s0,8
   10516:	9782                	jalr	a5
   10518:	fe991ce3          	bne	s2,s1,10510 <__libc_init_array+0x52>
   1051c:	60e2                	ld	ra,24(sp)
   1051e:	6442                	ld	s0,16(sp)
   10520:	64a2                	ld	s1,8(sp)
   10522:	6902                	ld	s2,0(sp)
   10524:	6105                	addi	sp,sp,32
   10526:	8082                	ret

0000000000010528 <memset>:
   10528:	433d                	li	t1,15
   1052a:	872a                	mv	a4,a0
   1052c:	02c37163          	bgeu	t1,a2,1054e <memset+0x26>
   10530:	00f77793          	andi	a5,a4,15
   10534:	e3c1                	bnez	a5,105b4 <memset+0x8c>
   10536:	e1bd                	bnez	a1,1059c <memset+0x74>
   10538:	ff067693          	andi	a3,a2,-16
   1053c:	8a3d                	andi	a2,a2,15
   1053e:	96ba                	add	a3,a3,a4
   10540:	e30c                	sd	a1,0(a4)
   10542:	e70c                	sd	a1,8(a4)
   10544:	0741                	addi	a4,a4,16
   10546:	fed76de3          	bltu	a4,a3,10540 <memset+0x18>
   1054a:	e211                	bnez	a2,1054e <memset+0x26>
   1054c:	8082                	ret
   1054e:	40c306b3          	sub	a3,t1,a2
   10552:	068a                	slli	a3,a3,0x2
   10554:	00000297          	auipc	t0,0x0
   10558:	9696                	add	a3,a3,t0
   1055a:	00a68067          	jr	10(a3)
   1055e:	00b70723          	sb	a1,14(a4)
   10562:	00b706a3          	sb	a1,13(a4)
   10566:	00b70623          	sb	a1,12(a4)
   1056a:	00b705a3          	sb	a1,11(a4)
   1056e:	00b70523          	sb	a1,10(a4)
   10572:	00b704a3          	sb	a1,9(a4)
   10576:	00b70423          	sb	a1,8(a4)
   1057a:	00b703a3          	sb	a1,7(a4)
   1057e:	00b70323          	sb	a1,6(a4)
   10582:	00b702a3          	sb	a1,5(a4)
   10586:	00b70223          	sb	a1,4(a4)
   1058a:	00b701a3          	sb	a1,3(a4)
   1058e:	00b70123          	sb	a1,2(a4)
   10592:	00b700a3          	sb	a1,1(a4)
   10596:	00b70023          	sb	a1,0(a4)
   1059a:	8082                	ret
   1059c:	0ff5f593          	andi	a1,a1,255
   105a0:	00859693          	slli	a3,a1,0x8
   105a4:	8dd5                	or	a1,a1,a3
   105a6:	01059693          	slli	a3,a1,0x10
   105aa:	8dd5                	or	a1,a1,a3
   105ac:	02059693          	slli	a3,a1,0x20
   105b0:	8dd5                	or	a1,a1,a3
   105b2:	b759                	j	10538 <memset+0x10>
   105b4:	00279693          	slli	a3,a5,0x2
   105b8:	00000297          	auipc	t0,0x0
   105bc:	9696                	add	a3,a3,t0
   105be:	8286                	mv	t0,ra
   105c0:	fa2680e7          	jalr	-94(a3)
   105c4:	8096                	mv	ra,t0
   105c6:	17c1                	addi	a5,a5,-16
   105c8:	8f1d                	sub	a4,a4,a5
   105ca:	963e                	add	a2,a2,a5
   105cc:	f8c371e3          	bgeu	t1,a2,1054e <memset+0x26>
   105d0:	b79d                	j	10536 <memset+0xe>

00000000000105d2 <__call_exitprocs>:
   105d2:	715d                	addi	sp,sp,-80
   105d4:	f052                	sd	s4,32(sp)
   105d6:	f481ba03          	ld	s4,-184(gp) # 11ee0 <_global_impure_ptr>
   105da:	f84a                	sd	s2,48(sp)
   105dc:	e486                	sd	ra,72(sp)
   105de:	1f8a3903          	ld	s2,504(s4)
   105e2:	e0a2                	sd	s0,64(sp)
   105e4:	fc26                	sd	s1,56(sp)
   105e6:	f44e                	sd	s3,40(sp)
   105e8:	ec56                	sd	s5,24(sp)
   105ea:	e85a                	sd	s6,16(sp)
   105ec:	e45e                	sd	s7,8(sp)
   105ee:	e062                	sd	s8,0(sp)
   105f0:	02090863          	beqz	s2,10620 <__call_exitprocs+0x4e>
   105f4:	8b2a                	mv	s6,a0
   105f6:	8bae                	mv	s7,a1
   105f8:	4a85                	li	s5,1
   105fa:	59fd                	li	s3,-1
   105fc:	00892483          	lw	s1,8(s2)
   10600:	fff4841b          	addiw	s0,s1,-1
   10604:	00044e63          	bltz	s0,10620 <__call_exitprocs+0x4e>
   10608:	048e                	slli	s1,s1,0x3
   1060a:	94ca                	add	s1,s1,s2
   1060c:	020b8663          	beqz	s7,10638 <__call_exitprocs+0x66>
   10610:	2084b783          	ld	a5,520(s1)
   10614:	03778263          	beq	a5,s7,10638 <__call_exitprocs+0x66>
   10618:	347d                	addiw	s0,s0,-1
   1061a:	14e1                	addi	s1,s1,-8
   1061c:	ff3418e3          	bne	s0,s3,1060c <__call_exitprocs+0x3a>
   10620:	60a6                	ld	ra,72(sp)
   10622:	6406                	ld	s0,64(sp)
   10624:	74e2                	ld	s1,56(sp)
   10626:	7942                	ld	s2,48(sp)
   10628:	79a2                	ld	s3,40(sp)
   1062a:	7a02                	ld	s4,32(sp)
   1062c:	6ae2                	ld	s5,24(sp)
   1062e:	6b42                	ld	s6,16(sp)
   10630:	6ba2                	ld	s7,8(sp)
   10632:	6c02                	ld	s8,0(sp)
   10634:	6161                	addi	sp,sp,80
   10636:	8082                	ret
   10638:	00892783          	lw	a5,8(s2)
   1063c:	6498                	ld	a4,8(s1)
   1063e:	37fd                	addiw	a5,a5,-1
   10640:	04878463          	beq	a5,s0,10688 <__call_exitprocs+0xb6>
   10644:	0004b423          	sd	zero,8(s1)
   10648:	db61                	beqz	a4,10618 <__call_exitprocs+0x46>
   1064a:	31092783          	lw	a5,784(s2)
   1064e:	008a96bb          	sllw	a3,s5,s0
   10652:	00892c03          	lw	s8,8(s2)
   10656:	8ff5                	and	a5,a5,a3
   10658:	2781                	sext.w	a5,a5
   1065a:	ef89                	bnez	a5,10674 <__call_exitprocs+0xa2>
   1065c:	9702                	jalr	a4
   1065e:	00892703          	lw	a4,8(s2)
   10662:	1f8a3783          	ld	a5,504(s4)
   10666:	01871463          	bne	a4,s8,1066e <__call_exitprocs+0x9c>
   1066a:	faf907e3          	beq	s2,a5,10618 <__call_exitprocs+0x46>
   1066e:	dbcd                	beqz	a5,10620 <__call_exitprocs+0x4e>
   10670:	893e                	mv	s2,a5
   10672:	b769                	j	105fc <__call_exitprocs+0x2a>
   10674:	31492783          	lw	a5,788(s2)
   10678:	1084b583          	ld	a1,264(s1)
   1067c:	8ff5                	and	a5,a5,a3
   1067e:	2781                	sext.w	a5,a5
   10680:	e799                	bnez	a5,1068e <__call_exitprocs+0xbc>
   10682:	855a                	mv	a0,s6
   10684:	9702                	jalr	a4
   10686:	bfe1                	j	1065e <__call_exitprocs+0x8c>
   10688:	00892423          	sw	s0,8(s2)
   1068c:	bf75                	j	10648 <__call_exitprocs+0x76>
   1068e:	852e                	mv	a0,a1
   10690:	9702                	jalr	a4
   10692:	b7f1                	j	1065e <__call_exitprocs+0x8c>

0000000000010694 <__libc_fini_array>:
   10694:	1101                	addi	sp,sp,-32
   10696:	e822                	sd	s0,16(sp)
   10698:	67c5                	lui	a5,0x11
   1069a:	6445                	lui	s0,0x11
   1069c:	79040413          	addi	s0,s0,1936 # 11790 <__init_array_end>
   106a0:	79878793          	addi	a5,a5,1944 # 11798 <__fini_array_end>
   106a4:	8f81                	sub	a5,a5,s0
   106a6:	e426                	sd	s1,8(sp)
   106a8:	ec06                	sd	ra,24(sp)
   106aa:	4037d493          	srai	s1,a5,0x3
   106ae:	c881                	beqz	s1,106be <__libc_fini_array+0x2a>
   106b0:	17e1                	addi	a5,a5,-8
   106b2:	943e                	add	s0,s0,a5
   106b4:	601c                	ld	a5,0(s0)
   106b6:	14fd                	addi	s1,s1,-1
   106b8:	1461                	addi	s0,s0,-8
   106ba:	9782                	jalr	a5
   106bc:	fce5                	bnez	s1,106b4 <__libc_fini_array+0x20>
   106be:	60e2                	ld	ra,24(sp)
   106c0:	6442                	ld	s0,16(sp)
   106c2:	64a2                	ld	s1,8(sp)
   106c4:	6105                	addi	sp,sp,32
   106c6:	8082                	ret

00000000000106c8 <atexit>:
   106c8:	85aa                	mv	a1,a0
   106ca:	4681                	li	a3,0
   106cc:	4601                	li	a2,0
   106ce:	4501                	li	a0,0
   106d0:	a009                	j	106d2 <__register_exitproc>

00000000000106d2 <__register_exitproc>:
   106d2:	f481b703          	ld	a4,-184(gp) # 11ee0 <_global_impure_ptr>
   106d6:	1f873783          	ld	a5,504(a4)
   106da:	c3b1                	beqz	a5,1071e <__register_exitproc+0x4c>
   106dc:	4798                	lw	a4,8(a5)
   106de:	487d                	li	a6,31
   106e0:	06e84263          	blt	a6,a4,10744 <__register_exitproc+0x72>
   106e4:	c505                	beqz	a0,1070c <__register_exitproc+0x3a>
   106e6:	00371813          	slli	a6,a4,0x3
   106ea:	983e                	add	a6,a6,a5
   106ec:	10c83823          	sd	a2,272(a6)
   106f0:	3107a883          	lw	a7,784(a5)
   106f4:	4605                	li	a2,1
   106f6:	00e6163b          	sllw	a2,a2,a4
   106fa:	00c8e8b3          	or	a7,a7,a2
   106fe:	3117a823          	sw	a7,784(a5)
   10702:	20d83823          	sd	a3,528(a6)
   10706:	4689                	li	a3,2
   10708:	02d50063          	beq	a0,a3,10728 <__register_exitproc+0x56>
   1070c:	00270693          	addi	a3,a4,2
   10710:	068e                	slli	a3,a3,0x3
   10712:	2705                	addiw	a4,a4,1
   10714:	c798                	sw	a4,8(a5)
   10716:	97b6                	add	a5,a5,a3
   10718:	e38c                	sd	a1,0(a5)
   1071a:	4501                	li	a0,0
   1071c:	8082                	ret
   1071e:	20070793          	addi	a5,a4,512
   10722:	1ef73c23          	sd	a5,504(a4)
   10726:	bf5d                	j	106dc <__register_exitproc+0xa>
   10728:	3147a683          	lw	a3,788(a5)
   1072c:	4501                	li	a0,0
   1072e:	8e55                	or	a2,a2,a3
   10730:	00270693          	addi	a3,a4,2
   10734:	068e                	slli	a3,a3,0x3
   10736:	2705                	addiw	a4,a4,1
   10738:	30c7aa23          	sw	a2,788(a5)
   1073c:	c798                	sw	a4,8(a5)
   1073e:	97b6                	add	a5,a5,a3
   10740:	e38c                	sd	a1,0(a5)
   10742:	8082                	ret
   10744:	557d                	li	a0,-1
   10746:	8082                	ret

0000000000010748 <_exit>:
   10748:	4581                	li	a1,0
   1074a:	4601                	li	a2,0
   1074c:	4681                	li	a3,0
   1074e:	4701                	li	a4,0
   10750:	4781                	li	a5,0
   10752:	05d00893          	li	a7,93
   10756:	00000073          	ecall
   1075a:	00054363          	bltz	a0,10760 <_exit+0x18>
   1075e:	a001                	j	1075e <_exit+0x16>
   10760:	1141                	addi	sp,sp,-16
   10762:	e022                	sd	s0,0(sp)
   10764:	842a                	mv	s0,a0
   10766:	e406                	sd	ra,8(sp)
   10768:	4080043b          	negw	s0,s0
   1076c:	008000ef          	jal	ra,10774 <__errno>
   10770:	c100                	sw	s0,0(a0)
   10772:	a001                	j	10772 <_exit+0x2a>

0000000000010774 <__errno>:
   10774:	f581b503          	ld	a0,-168(gp) # 11ef0 <_impure_ptr>
   10778:	8082                	ret

Ackerman.elf:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c789                	beqz	a5,100c2 <register_fini+0x12>
   100ba:	6541                	lui	a0,0x10
   100bc:	69450513          	addi	a0,a0,1684 # 10694 <__libc_fini_array>
   100c0:	a521                	j	106c8 <atexit>
   100c2:	8082                	ret

00000000000100c4 <_start>:
   100c4:	00002197          	auipc	gp,0x2
   100c8:	ed418193          	addi	gp,gp,-300 # 11f98 <__global_pointer$>
   100cc:	f6018513          	addi	a0,gp,-160 # 11ef8 <_edata>
   100d0:	f9818613          	addi	a2,gp,-104 # 11f30 <__BSS_END__>
   100d4:	8e09                	sub	a2,a2,a0
   100d6:	4581                	li	a1,0
   100d8:	450000ef          	jal	ra,10528 <memset>
   100dc:	00000517          	auipc	a0,0x0
   100e0:	5ec50513          	addi	a0,a0,1516 # 106c8 <atexit>
   100e4:	c519                	beqz	a0,100f2 <_start+0x2e>
   100e6:	00000517          	auipc	a0,0x0
   100ea:	5ae50513          	addi	a0,a0,1454 # 10694 <__libc_fini_array>
   100ee:	5da000ef          	jal	ra,106c8 <atexit>
   100f2:	3cc000ef          	jal	ra,104be <__libc_init_array>
   100f6:	4502                	lw	a0,0(sp)
   100f8:	002c                	addi	a1,sp,8
   100fa:	4601                	li	a2,0
   100fc:	310000ef          	jal	ra,1040c <main>
   10100:	a645                	j	104a0 <exit>

0000000000010102 <__do_global_dtors_aux>:
   10102:	f601c703          	lbu	a4,-160(gp) # 11ef8 <_edata>
   10106:	eb05                	bnez	a4,10136 <__do_global_dtors_aux+0x34>
   10108:	1141                	addi	sp,sp,-16
   1010a:	e022                	sd	s0,0(sp)
   1010c:	843e                	mv	s0,a5
   1010e:	000007b7          	lui	a5,0x0
   10112:	e406                	sd	ra,8(sp)
   10114:	00078793          	mv	a5,a5
   10118:	cb81                	beqz	a5,10128 <__do_global_dtors_aux+0x26>
   1011a:	6545                	lui	a0,0x11
   1011c:	77c50513          	addi	a0,a0,1916 # 1177c <__FRAME_END__>
   10120:	00000097          	auipc	ra,0x0
   10124:	000000e7          	jalr	zero # 0 <register_fini-0x100b0>
   10128:	4785                	li	a5,1
   1012a:	60a2                	ld	ra,8(sp)
   1012c:	f6f18023          	sb	a5,-160(gp) # 11ef8 <_edata>
   10130:	6402                	ld	s0,0(sp)
   10132:	0141                	addi	sp,sp,16
   10134:	8082                	ret
   10136:	8082                	ret

0000000000010138 <frame_dummy>:
   10138:	000007b7          	lui	a5,0x0
   1013c:	00078793          	mv	a5,a5
   10140:	cb91                	beqz	a5,10154 <frame_dummy+0x1c>
   10142:	6545                	lui	a0,0x11
   10144:	f6818593          	addi	a1,gp,-152 # 11f00 <object.5532>
   10148:	77c50513          	addi	a0,a0,1916 # 1177c <__FRAME_END__>
   1014c:	00000317          	auipc	t1,0x0
   10150:	00000067          	jr	zero # 0 <register_fini-0x100b0>
   10154:	8082                	ret
	...

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

0000000000010348 <ack>:
   10348:	fd010113          	addi	sp,sp,-48
   1034c:	02113423          	sd	ra,40(sp)
   10350:	02813023          	sd	s0,32(sp)
   10354:	00913c23          	sd	s1,24(sp)
   10358:	03010413          	addi	s0,sp,48
   1035c:	00050793          	mv	a5,a0
   10360:	00058713          	mv	a4,a1
   10364:	fcf42e23          	sw	a5,-36(s0)
   10368:	00070793          	mv	a5,a4
   1036c:	fcf42c23          	sw	a5,-40(s0)
   10370:	fdc42783          	lw	a5,-36(s0)
   10374:	0007879b          	sext.w	a5,a5
   10378:	00079a63          	bnez	a5,1038c <ack+0x44>
   1037c:	fd842783          	lw	a5,-40(s0)
   10380:	0017879b          	addiw	a5,a5,1
   10384:	0007879b          	sext.w	a5,a5
   10388:	06c0006f          	j	103f4 <ack+0xac>
   1038c:	fd842783          	lw	a5,-40(s0)
   10390:	0007879b          	sext.w	a5,a5
   10394:	02079263          	bnez	a5,103b8 <ack+0x70>
   10398:	fdc42783          	lw	a5,-36(s0)
   1039c:	fff7879b          	addiw	a5,a5,-1
   103a0:	0007879b          	sext.w	a5,a5
   103a4:	00100593          	li	a1,1
   103a8:	00078513          	mv	a0,a5
   103ac:	f9dff0ef          	jal	ra,10348 <ack>
   103b0:	00050793          	mv	a5,a0
   103b4:	0400006f          	j	103f4 <ack+0xac>
   103b8:	fdc42783          	lw	a5,-36(s0)
   103bc:	fff7879b          	addiw	a5,a5,-1
   103c0:	0007849b          	sext.w	s1,a5
   103c4:	fd842783          	lw	a5,-40(s0)
   103c8:	fff7879b          	addiw	a5,a5,-1
   103cc:	0007871b          	sext.w	a4,a5
   103d0:	fdc42783          	lw	a5,-36(s0)
   103d4:	00070593          	mv	a1,a4
   103d8:	00078513          	mv	a0,a5
   103dc:	f6dff0ef          	jal	ra,10348 <ack>
   103e0:	00050793          	mv	a5,a0
   103e4:	00078593          	mv	a1,a5
   103e8:	00048513          	mv	a0,s1
   103ec:	f5dff0ef          	jal	ra,10348 <ack>
   103f0:	00050793          	mv	a5,a0
   103f4:	00078513          	mv	a0,a5
   103f8:	02813083          	ld	ra,40(sp)
   103fc:	02013403          	ld	s0,32(sp)
   10400:	01813483          	ld	s1,24(sp)
   10404:	03010113          	addi	sp,sp,48
   10408:	00008067          	ret

000000000001040c <main>:
   1040c:	fd010113          	addi	sp,sp,-48
   10410:	02113423          	sd	ra,40(sp)
   10414:	02813023          	sd	s0,32(sp)
   10418:	03010413          	addi	s0,sp,48
   1041c:	00200593          	li	a1,2
   10420:	00200513          	li	a0,2
   10424:	f25ff0ef          	jal	ra,10348 <ack>
   10428:	00050793          	mv	a5,a0
   1042c:	00078713          	mv	a4,a5
   10430:	fd840793          	addi	a5,s0,-40
   10434:	00078593          	mv	a1,a5
   10438:	00070513          	mv	a0,a4
   1043c:	d1dff0ef          	jal	ra,10158 <Int2Str>
   10440:	00050793          	mv	a5,a0
   10444:	fef42623          	sw	a5,-20(s0)
   10448:	fd840793          	addi	a5,s0,-40
   1044c:	fec42683          	lw	a3,-20(s0)
   10450:	00000713          	li	a4,0
   10454:	00078613          	mv	a2,a5
   10458:	00100593          	li	a1,1
   1045c:	04000513          	li	a0,64
   10460:	e9dff0ef          	jal	ra,102fc <my_syscall>
   10464:	00a00793          	li	a5,10
   10468:	fcf40c23          	sb	a5,-40(s0)
   1046c:	fd840793          	addi	a5,s0,-40
   10470:	00000713          	li	a4,0
   10474:	00100693          	li	a3,1
   10478:	00078613          	mv	a2,a5
   1047c:	00100593          	li	a1,1
   10480:	04000513          	li	a0,64
   10484:	e79ff0ef          	jal	ra,102fc <my_syscall>
   10488:	00000793          	li	a5,0
   1048c:	00078513          	mv	a0,a5
   10490:	02813083          	ld	ra,40(sp)
   10494:	02013403          	ld	s0,32(sp)
   10498:	03010113          	addi	sp,sp,48
   1049c:	00008067          	ret

00000000000104a0 <exit>:
   104a0:	1141                	addi	sp,sp,-16
   104a2:	4581                	li	a1,0
   104a4:	e022                	sd	s0,0(sp)
   104a6:	e406                	sd	ra,8(sp)
   104a8:	842a                	mv	s0,a0
   104aa:	128000ef          	jal	ra,105d2 <__call_exitprocs>
   104ae:	f481b503          	ld	a0,-184(gp) # 11ee0 <_global_impure_ptr>
   104b2:	6d3c                	ld	a5,88(a0)
   104b4:	c391                	beqz	a5,104b8 <exit+0x18>
   104b6:	9782                	jalr	a5
   104b8:	8522                	mv	a0,s0
   104ba:	28e000ef          	jal	ra,10748 <_exit>

00000000000104be <__libc_init_array>:
   104be:	1101                	addi	sp,sp,-32
   104c0:	e822                	sd	s0,16(sp)
   104c2:	e04a                	sd	s2,0(sp)
   104c4:	6445                	lui	s0,0x11
   104c6:	6945                	lui	s2,0x11
   104c8:	78040793          	addi	a5,s0,1920 # 11780 <__init_array_start>
   104cc:	78090913          	addi	s2,s2,1920 # 11780 <__init_array_start>
   104d0:	40f90933          	sub	s2,s2,a5
   104d4:	ec06                	sd	ra,24(sp)
   104d6:	e426                	sd	s1,8(sp)
   104d8:	40395913          	srai	s2,s2,0x3
   104dc:	00090b63          	beqz	s2,104f2 <__libc_init_array+0x34>
   104e0:	78040413          	addi	s0,s0,1920
   104e4:	4481                	li	s1,0
   104e6:	601c                	ld	a5,0(s0)
   104e8:	0485                	addi	s1,s1,1
   104ea:	0421                	addi	s0,s0,8
   104ec:	9782                	jalr	a5
   104ee:	fe991ce3          	bne	s2,s1,104e6 <__libc_init_array+0x28>
   104f2:	6445                	lui	s0,0x11
   104f4:	6945                	lui	s2,0x11
   104f6:	78040793          	addi	a5,s0,1920 # 11780 <__init_array_start>
   104fa:	79090913          	addi	s2,s2,1936 # 11790 <__init_array_end>
   104fe:	40f90933          	sub	s2,s2,a5
   10502:	40395913          	srai	s2,s2,0x3
   10506:	00090b63          	beqz	s2,1051c <__libc_init_array+0x5e>
   1050a:	78040413          	addi	s0,s0,1920
   1050e:	4481                	li	s1,0
   10510:	601c                	ld	a5,0(s0)
   10512:	0485                	addi	s1,s1,1
   10514:	0421                	addi	s0,s0,8
   10516:	9782                	jalr	a5
   10518:	fe991ce3          	bne	s2,s1,10510 <__libc_init_array+0x52>
   1051c:	60e2                	ld	ra,24(sp)
   1051e:	6442                	ld	s0,16(sp)
   10520:	64a2                	ld	s1,8(sp)
   10522:	6902                	ld	s2,0(sp)
   10524:	6105                	addi	sp,sp,32
   10526:	8082                	ret

0000000000010528 <memset>:
   10528:	433d                	li	t1,15
   1052a:	872a                	mv	a4,a0
   1052c:	02c37163          	bgeu	t1,a2,1054e <memset+0x26>
   10530:	00f77793          	andi	a5,a4,15
   10534:	e3c1                	bnez	a5,105b4 <memset+0x8c>
   10536:	e1bd                	bnez	a1,1059c <memset+0x74>
   10538:	ff067693          	andi	a3,a2,-16
   1053c:	8a3d                	andi	a2,a2,15
   1053e:	96ba                	add	a3,a3,a4
   10540:	e30c                	sd	a1,0(a4)
   10542:	e70c                	sd	a1,8(a4)
   10544:	0741                	addi	a4,a4,16
   10546:	fed76de3          	bltu	a4,a3,10540 <memset+0x18>
   1054a:	e211                	bnez	a2,1054e <memset+0x26>
   1054c:	8082                	ret
   1054e:	40c306b3          	sub	a3,t1,a2
   10552:	068a                	slli	a3,a3,0x2
   10554:	00000297          	auipc	t0,0x0
   10558:	9696                	add	a3,a3,t0
   1055a:	00a68067          	jr	10(a3)
   1055e:	00b70723          	sb	a1,14(a4)
   10562:	00b706a3          	sb	a1,13(a4)
   10566:	00b70623          	sb	a1,12(a4)
   1056a:	00b705a3          	sb	a1,11(a4)
   1056e:	00b70523          	sb	a1,10(a4)
   10572:	00b704a3          	sb	a1,9(a4)
   10576:	00b70423          	sb	a1,8(a4)
   1057a:	00b703a3          	sb	a1,7(a4)
   1057e:	00b70323          	sb	a1,6(a4)
   10582:	00b702a3          	sb	a1,5(a4)
   10586:	00b70223          	sb	a1,4(a4)
   1058a:	00b701a3          	sb	a1,3(a4)
   1058e:	00b70123          	sb	a1,2(a4)
   10592:	00b700a3          	sb	a1,1(a4)
   10596:	00b70023          	sb	a1,0(a4)
   1059a:	8082                	ret
   1059c:	0ff5f593          	andi	a1,a1,255
   105a0:	00859693          	slli	a3,a1,0x8
   105a4:	8dd5                	or	a1,a1,a3
   105a6:	01059693          	slli	a3,a1,0x10
   105aa:	8dd5                	or	a1,a1,a3
   105ac:	02059693          	slli	a3,a1,0x20
   105b0:	8dd5                	or	a1,a1,a3
   105b2:	b759                	j	10538 <memset+0x10>
   105b4:	00279693          	slli	a3,a5,0x2
   105b8:	00000297          	auipc	t0,0x0
   105bc:	9696                	add	a3,a3,t0
   105be:	8286                	mv	t0,ra
   105c0:	fa2680e7          	jalr	-94(a3)
   105c4:	8096                	mv	ra,t0
   105c6:	17c1                	addi	a5,a5,-16
   105c8:	8f1d                	sub	a4,a4,a5
   105ca:	963e                	add	a2,a2,a5
   105cc:	f8c371e3          	bgeu	t1,a2,1054e <memset+0x26>
   105d0:	b79d                	j	10536 <memset+0xe>

00000000000105d2 <__call_exitprocs>:
   105d2:	715d                	addi	sp,sp,-80
   105d4:	f052                	sd	s4,32(sp)
   105d6:	f481ba03          	ld	s4,-184(gp) # 11ee0 <_global_impure_ptr>
   105da:	f84a                	sd	s2,48(sp)
   105dc:	e486                	sd	ra,72(sp)
   105de:	1f8a3903          	ld	s2,504(s4)
   105e2:	e0a2                	sd	s0,64(sp)
   105e4:	fc26                	sd	s1,56(sp)
   105e6:	f44e                	sd	s3,40(sp)
   105e8:	ec56                	sd	s5,24(sp)
   105ea:	e85a                	sd	s6,16(sp)
   105ec:	e45e                	sd	s7,8(sp)
   105ee:	e062                	sd	s8,0(sp)
   105f0:	02090863          	beqz	s2,10620 <__call_exitprocs+0x4e>
   105f4:	8b2a                	mv	s6,a0
   105f6:	8bae                	mv	s7,a1
   105f8:	4a85                	li	s5,1
   105fa:	59fd                	li	s3,-1
   105fc:	00892483          	lw	s1,8(s2)
   10600:	fff4841b          	addiw	s0,s1,-1
   10604:	00044e63          	bltz	s0,10620 <__call_exitprocs+0x4e>
   10608:	048e                	slli	s1,s1,0x3
   1060a:	94ca                	add	s1,s1,s2
   1060c:	020b8663          	beqz	s7,10638 <__call_exitprocs+0x66>
   10610:	2084b783          	ld	a5,520(s1)
   10614:	03778263          	beq	a5,s7,10638 <__call_exitprocs+0x66>
   10618:	347d                	addiw	s0,s0,-1
   1061a:	14e1                	addi	s1,s1,-8
   1061c:	ff3418e3          	bne	s0,s3,1060c <__call_exitprocs+0x3a>
   10620:	60a6                	ld	ra,72(sp)
   10622:	6406                	ld	s0,64(sp)
   10624:	74e2                	ld	s1,56(sp)
   10626:	7942                	ld	s2,48(sp)
   10628:	79a2                	ld	s3,40(sp)
   1062a:	7a02                	ld	s4,32(sp)
   1062c:	6ae2                	ld	s5,24(sp)
   1062e:	6b42                	ld	s6,16(sp)
   10630:	6ba2                	ld	s7,8(sp)
   10632:	6c02                	ld	s8,0(sp)
   10634:	6161                	addi	sp,sp,80
   10636:	8082                	ret
   10638:	00892783          	lw	a5,8(s2)
   1063c:	6498                	ld	a4,8(s1)
   1063e:	37fd                	addiw	a5,a5,-1
   10640:	04878463          	beq	a5,s0,10688 <__call_exitprocs+0xb6>
   10644:	0004b423          	sd	zero,8(s1)
   10648:	db61                	beqz	a4,10618 <__call_exitprocs+0x46>
   1064a:	31092783          	lw	a5,784(s2)
   1064e:	008a96bb          	sllw	a3,s5,s0
   10652:	00892c03          	lw	s8,8(s2)
   10656:	8ff5                	and	a5,a5,a3
   10658:	2781                	sext.w	a5,a5
   1065a:	ef89                	bnez	a5,10674 <__call_exitprocs+0xa2>
   1065c:	9702                	jalr	a4
   1065e:	00892703          	lw	a4,8(s2)
   10662:	1f8a3783          	ld	a5,504(s4)
   10666:	01871463          	bne	a4,s8,1066e <__call_exitprocs+0x9c>
   1066a:	faf907e3          	beq	s2,a5,10618 <__call_exitprocs+0x46>
   1066e:	dbcd                	beqz	a5,10620 <__call_exitprocs+0x4e>
   10670:	893e                	mv	s2,a5
   10672:	b769                	j	105fc <__call_exitprocs+0x2a>
   10674:	31492783          	lw	a5,788(s2)
   10678:	1084b583          	ld	a1,264(s1)
   1067c:	8ff5                	and	a5,a5,a3
   1067e:	2781                	sext.w	a5,a5
   10680:	e799                	bnez	a5,1068e <__call_exitprocs+0xbc>
   10682:	855a                	mv	a0,s6
   10684:	9702                	jalr	a4
   10686:	bfe1                	j	1065e <__call_exitprocs+0x8c>
   10688:	00892423          	sw	s0,8(s2)
   1068c:	bf75                	j	10648 <__call_exitprocs+0x76>
   1068e:	852e                	mv	a0,a1
   10690:	9702                	jalr	a4
   10692:	b7f1                	j	1065e <__call_exitprocs+0x8c>

0000000000010694 <__libc_fini_array>:
   10694:	1101                	addi	sp,sp,-32
   10696:	e822                	sd	s0,16(sp)
   10698:	67c5                	lui	a5,0x11
   1069a:	6445                	lui	s0,0x11
   1069c:	79040413          	addi	s0,s0,1936 # 11790 <__init_array_end>
   106a0:	79878793          	addi	a5,a5,1944 # 11798 <__fini_array_end>
   106a4:	8f81                	sub	a5,a5,s0
   106a6:	e426                	sd	s1,8(sp)
   106a8:	ec06                	sd	ra,24(sp)
   106aa:	4037d493          	srai	s1,a5,0x3
   106ae:	c881                	beqz	s1,106be <__libc_fini_array+0x2a>
   106b0:	17e1                	addi	a5,a5,-8
   106b2:	943e                	add	s0,s0,a5
   106b4:	601c                	ld	a5,0(s0)
   106b6:	14fd                	addi	s1,s1,-1
   106b8:	1461                	addi	s0,s0,-8
   106ba:	9782                	jalr	a5
   106bc:	fce5                	bnez	s1,106b4 <__libc_fini_array+0x20>
   106be:	60e2                	ld	ra,24(sp)
   106c0:	6442                	ld	s0,16(sp)
   106c2:	64a2                	ld	s1,8(sp)
   106c4:	6105                	addi	sp,sp,32
   106c6:	8082                	ret

00000000000106c8 <atexit>:
   106c8:	85aa                	mv	a1,a0
   106ca:	4681                	li	a3,0
   106cc:	4601                	li	a2,0
   106ce:	4501                	li	a0,0
   106d0:	a009                	j	106d2 <__register_exitproc>

00000000000106d2 <__register_exitproc>:
   106d2:	f481b703          	ld	a4,-184(gp) # 11ee0 <_global_impure_ptr>
   106d6:	1f873783          	ld	a5,504(a4)
   106da:	c3b1                	beqz	a5,1071e <__register_exitproc+0x4c>
   106dc:	4798                	lw	a4,8(a5)
   106de:	487d                	li	a6,31
   106e0:	06e84263          	blt	a6,a4,10744 <__register_exitproc+0x72>
   106e4:	c505                	beqz	a0,1070c <__register_exitproc+0x3a>
   106e6:	00371813          	slli	a6,a4,0x3
   106ea:	983e                	add	a6,a6,a5
   106ec:	10c83823          	sd	a2,272(a6)
   106f0:	3107a883          	lw	a7,784(a5)
   106f4:	4605                	li	a2,1
   106f6:	00e6163b          	sllw	a2,a2,a4
   106fa:	00c8e8b3          	or	a7,a7,a2
   106fe:	3117a823          	sw	a7,784(a5)
   10702:	20d83823          	sd	a3,528(a6)
   10706:	4689                	li	a3,2
   10708:	02d50063          	beq	a0,a3,10728 <__register_exitproc+0x56>
   1070c:	00270693          	addi	a3,a4,2
   10710:	068e                	slli	a3,a3,0x3
   10712:	2705                	addiw	a4,a4,1
   10714:	c798                	sw	a4,8(a5)
   10716:	97b6                	add	a5,a5,a3
   10718:	e38c                	sd	a1,0(a5)
   1071a:	4501                	li	a0,0
   1071c:	8082                	ret
   1071e:	20070793          	addi	a5,a4,512
   10722:	1ef73c23          	sd	a5,504(a4)
   10726:	bf5d                	j	106dc <__register_exitproc+0xa>
   10728:	3147a683          	lw	a3,788(a5)
   1072c:	4501                	li	a0,0
   1072e:	8e55                	or	a2,a2,a3
   10730:	00270693          	addi	a3,a4,2
   10734:	068e                	slli	a3,a3,0x3
   10736:	2705                	addiw	a4,a4,1
   10738:	30c7aa23          	sw	a2,788(a5)
   1073c:	c798                	sw	a4,8(a5)
   1073e:	97b6                	add	a5,a5,a3
   10740:	e38c                	sd	a1,0(a5)
   10742:	8082                	ret
   10744:	557d                	li	a0,-1
   10746:	8082                	ret

0000000000010748 <_exit>:
   10748:	4581                	li	a1,0
   1074a:	4601                	li	a2,0
   1074c:	4681                	li	a3,0
   1074e:	4701                	li	a4,0
   10750:	4781                	li	a5,0
   10752:	05d00893          	li	a7,93
   10756:	00000073          	ecall
   1075a:	00054363          	bltz	a0,10760 <_exit+0x18>
   1075e:	a001                	j	1075e <_exit+0x16>
   10760:	1141                	addi	sp,sp,-16
   10762:	e022                	sd	s0,0(sp)
   10764:	842a                	mv	s0,a0
   10766:	e406                	sd	ra,8(sp)
   10768:	4080043b          	negw	s0,s0
   1076c:	008000ef          	jal	ra,10774 <__errno>
   10770:	c100                	sw	s0,0(a0)
   10772:	a001                	j	10772 <_exit+0x2a>

0000000000010774 <__errno>:
   10774:	f581b503          	ld	a0,-168(gp) # 11ef0 <_impure_ptr>
   10778:	8082                	ret

Ackerman.elf:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c789                	beqz	a5,100c2 <register_fini+0x12>
   100ba:	6541                	lui	a0,0x10
   100bc:	69c50513          	addi	a0,a0,1692 # 1069c <__libc_fini_array>
   100c0:	ad01                	j	106d0 <atexit>
   100c2:	8082                	ret

00000000000100c4 <_start>:
   100c4:	00002197          	auipc	gp,0x2
   100c8:	edc18193          	addi	gp,gp,-292 # 11fa0 <__global_pointer$>
   100cc:	f6018513          	addi	a0,gp,-160 # 11f00 <_edata>
   100d0:	f9818613          	addi	a2,gp,-104 # 11f38 <__BSS_END__>
   100d4:	8e09                	sub	a2,a2,a0
   100d6:	4581                	li	a1,0
   100d8:	458000ef          	jal	ra,10530 <memset>
   100dc:	00000517          	auipc	a0,0x0
   100e0:	5f450513          	addi	a0,a0,1524 # 106d0 <atexit>
   100e4:	c519                	beqz	a0,100f2 <_start+0x2e>
   100e6:	00000517          	auipc	a0,0x0
   100ea:	5b650513          	addi	a0,a0,1462 # 1069c <__libc_fini_array>
   100ee:	5e2000ef          	jal	ra,106d0 <atexit>
   100f2:	3d4000ef          	jal	ra,104c6 <__libc_init_array>
   100f6:	4502                	lw	a0,0(sp)
   100f8:	002c                	addi	a1,sp,8
   100fa:	4601                	li	a2,0
   100fc:	310000ef          	jal	ra,1040c <main>
   10100:	a665                	j	104a8 <exit>

0000000000010102 <__do_global_dtors_aux>:
   10102:	f601c703          	lbu	a4,-160(gp) # 11f00 <_edata>
   10106:	eb05                	bnez	a4,10136 <__do_global_dtors_aux+0x34>
   10108:	1141                	addi	sp,sp,-16
   1010a:	e022                	sd	s0,0(sp)
   1010c:	843e                	mv	s0,a5
   1010e:	000007b7          	lui	a5,0x0
   10112:	e406                	sd	ra,8(sp)
   10114:	00078793          	mv	a5,a5
   10118:	cb81                	beqz	a5,10128 <__do_global_dtors_aux+0x26>
   1011a:	6545                	lui	a0,0x11
   1011c:	78450513          	addi	a0,a0,1924 # 11784 <__FRAME_END__>
   10120:	00000097          	auipc	ra,0x0
   10124:	000000e7          	jalr	zero # 0 <register_fini-0x100b0>
   10128:	4785                	li	a5,1
   1012a:	60a2                	ld	ra,8(sp)
   1012c:	f6f18023          	sb	a5,-160(gp) # 11f00 <_edata>
   10130:	6402                	ld	s0,0(sp)
   10132:	0141                	addi	sp,sp,16
   10134:	8082                	ret
   10136:	8082                	ret

0000000000010138 <frame_dummy>:
   10138:	000007b7          	lui	a5,0x0
   1013c:	00078793          	mv	a5,a5
   10140:	cb91                	beqz	a5,10154 <frame_dummy+0x1c>
   10142:	6545                	lui	a0,0x11
   10144:	f6818593          	addi	a1,gp,-152 # 11f08 <object.5532>
   10148:	78450513          	addi	a0,a0,1924 # 11784 <__FRAME_END__>
   1014c:	00000317          	auipc	t1,0x0
   10150:	00000067          	jr	zero # 0 <register_fini-0x100b0>
   10154:	8082                	ret
	...

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

0000000000010348 <ack>:
   10348:	fd010113          	addi	sp,sp,-48
   1034c:	02113423          	sd	ra,40(sp)
   10350:	02813023          	sd	s0,32(sp)
   10354:	00913c23          	sd	s1,24(sp)
   10358:	03010413          	addi	s0,sp,48
   1035c:	00050793          	mv	a5,a0
   10360:	00058713          	mv	a4,a1
   10364:	fcf42e23          	sw	a5,-36(s0)
   10368:	00070793          	mv	a5,a4
   1036c:	fcf42c23          	sw	a5,-40(s0)
   10370:	fdc42783          	lw	a5,-36(s0)
   10374:	0007879b          	sext.w	a5,a5
   10378:	00079a63          	bnez	a5,1038c <ack+0x44>
   1037c:	fd842783          	lw	a5,-40(s0)
   10380:	0017879b          	addiw	a5,a5,1
   10384:	0007879b          	sext.w	a5,a5
   10388:	06c0006f          	j	103f4 <ack+0xac>
   1038c:	fd842783          	lw	a5,-40(s0)
   10390:	0007879b          	sext.w	a5,a5
   10394:	02079263          	bnez	a5,103b8 <ack+0x70>
   10398:	fdc42783          	lw	a5,-36(s0)
   1039c:	fff7879b          	addiw	a5,a5,-1
   103a0:	0007879b          	sext.w	a5,a5
   103a4:	00100593          	li	a1,1
   103a8:	00078513          	mv	a0,a5
   103ac:	f9dff0ef          	jal	ra,10348 <ack>
   103b0:	00050793          	mv	a5,a0
   103b4:	0400006f          	j	103f4 <ack+0xac>
   103b8:	fdc42783          	lw	a5,-36(s0)
   103bc:	fff7879b          	addiw	a5,a5,-1
   103c0:	0007849b          	sext.w	s1,a5
   103c4:	fd842783          	lw	a5,-40(s0)
   103c8:	fff7879b          	addiw	a5,a5,-1
   103cc:	0007871b          	sext.w	a4,a5
   103d0:	fdc42783          	lw	a5,-36(s0)
   103d4:	00070593          	mv	a1,a4
   103d8:	00078513          	mv	a0,a5
   103dc:	f6dff0ef          	jal	ra,10348 <ack>
   103e0:	00050793          	mv	a5,a0
   103e4:	00078593          	mv	a1,a5
   103e8:	00048513          	mv	a0,s1
   103ec:	f5dff0ef          	jal	ra,10348 <ack>
   103f0:	00050793          	mv	a5,a0
   103f4:	00078513          	mv	a0,a5
   103f8:	02813083          	ld	ra,40(sp)
   103fc:	02013403          	ld	s0,32(sp)
   10400:	01813483          	ld	s1,24(sp)
   10404:	03010113          	addi	sp,sp,48
   10408:	00008067          	ret

000000000001040c <main>:
   1040c:	fd010113          	addi	sp,sp,-48
   10410:	02113423          	sd	ra,40(sp)
   10414:	02813023          	sd	s0,32(sp)
   10418:	03010413          	addi	s0,sp,48
   1041c:	00200593          	li	a1,2
   10420:	00200513          	li	a0,2
   10424:	f25ff0ef          	jal	ra,10348 <ack>
   10428:	00050793          	mv	a5,a0
   1042c:	00078713          	mv	a4,a5
   10430:	fd840793          	addi	a5,s0,-40
   10434:	00078593          	mv	a1,a5
   10438:	00070513          	mv	a0,a4
   1043c:	d1dff0ef          	jal	ra,10158 <Int2Str>
   10440:	00050793          	mv	a5,a0
   10444:	fef42623          	sw	a5,-20(s0)
   10448:	fd840793          	addi	a5,s0,-40
   1044c:	fec42683          	lw	a3,-20(s0)
   10450:	00000713          	li	a4,0
   10454:	00078613          	mv	a2,a5
   10458:	00100593          	li	a1,1
   1045c:	04000513          	li	a0,64
   10460:	e9dff0ef          	jal	ra,102fc <my_syscall>
   10464:	00a00793          	li	a5,10
   10468:	fcf40c23          	sb	a5,-40(s0)
   1046c:	00a00793          	li	a5,10
   10470:	fcf40ca3          	sb	a5,-39(s0)
   10474:	fd840793          	addi	a5,s0,-40
   10478:	00000713          	li	a4,0
   1047c:	00200693          	li	a3,2
   10480:	00078613          	mv	a2,a5
   10484:	00100593          	li	a1,1
   10488:	04000513          	li	a0,64
   1048c:	e71ff0ef          	jal	ra,102fc <my_syscall>
   10490:	00000793          	li	a5,0
   10494:	00078513          	mv	a0,a5
   10498:	02813083          	ld	ra,40(sp)
   1049c:	02013403          	ld	s0,32(sp)
   104a0:	03010113          	addi	sp,sp,48
   104a4:	00008067          	ret

00000000000104a8 <exit>:
   104a8:	1141                	addi	sp,sp,-16
   104aa:	4581                	li	a1,0
   104ac:	e022                	sd	s0,0(sp)
   104ae:	e406                	sd	ra,8(sp)
   104b0:	842a                	mv	s0,a0
   104b2:	128000ef          	jal	ra,105da <__call_exitprocs>
   104b6:	f481b503          	ld	a0,-184(gp) # 11ee8 <_global_impure_ptr>
   104ba:	6d3c                	ld	a5,88(a0)
   104bc:	c391                	beqz	a5,104c0 <exit+0x18>
   104be:	9782                	jalr	a5
   104c0:	8522                	mv	a0,s0
   104c2:	28e000ef          	jal	ra,10750 <_exit>

00000000000104c6 <__libc_init_array>:
   104c6:	1101                	addi	sp,sp,-32
   104c8:	e822                	sd	s0,16(sp)
   104ca:	e04a                	sd	s2,0(sp)
   104cc:	6445                	lui	s0,0x11
   104ce:	6945                	lui	s2,0x11
   104d0:	78840793          	addi	a5,s0,1928 # 11788 <__init_array_start>
   104d4:	78890913          	addi	s2,s2,1928 # 11788 <__init_array_start>
   104d8:	40f90933          	sub	s2,s2,a5
   104dc:	ec06                	sd	ra,24(sp)
   104de:	e426                	sd	s1,8(sp)
   104e0:	40395913          	srai	s2,s2,0x3
   104e4:	00090b63          	beqz	s2,104fa <__libc_init_array+0x34>
   104e8:	78840413          	addi	s0,s0,1928
   104ec:	4481                	li	s1,0
   104ee:	601c                	ld	a5,0(s0)
   104f0:	0485                	addi	s1,s1,1
   104f2:	0421                	addi	s0,s0,8
   104f4:	9782                	jalr	a5
   104f6:	fe991ce3          	bne	s2,s1,104ee <__libc_init_array+0x28>
   104fa:	6445                	lui	s0,0x11
   104fc:	6945                	lui	s2,0x11
   104fe:	78840793          	addi	a5,s0,1928 # 11788 <__init_array_start>
   10502:	79890913          	addi	s2,s2,1944 # 11798 <__init_array_end>
   10506:	40f90933          	sub	s2,s2,a5
   1050a:	40395913          	srai	s2,s2,0x3
   1050e:	00090b63          	beqz	s2,10524 <__libc_init_array+0x5e>
   10512:	78840413          	addi	s0,s0,1928
   10516:	4481                	li	s1,0
   10518:	601c                	ld	a5,0(s0)
   1051a:	0485                	addi	s1,s1,1
   1051c:	0421                	addi	s0,s0,8
   1051e:	9782                	jalr	a5
   10520:	fe991ce3          	bne	s2,s1,10518 <__libc_init_array+0x52>
   10524:	60e2                	ld	ra,24(sp)
   10526:	6442                	ld	s0,16(sp)
   10528:	64a2                	ld	s1,8(sp)
   1052a:	6902                	ld	s2,0(sp)
   1052c:	6105                	addi	sp,sp,32
   1052e:	8082                	ret

0000000000010530 <memset>:
   10530:	433d                	li	t1,15
   10532:	872a                	mv	a4,a0
   10534:	02c37163          	bgeu	t1,a2,10556 <memset+0x26>
   10538:	00f77793          	andi	a5,a4,15
   1053c:	e3c1                	bnez	a5,105bc <memset+0x8c>
   1053e:	e1bd                	bnez	a1,105a4 <memset+0x74>
   10540:	ff067693          	andi	a3,a2,-16
   10544:	8a3d                	andi	a2,a2,15
   10546:	96ba                	add	a3,a3,a4
   10548:	e30c                	sd	a1,0(a4)
   1054a:	e70c                	sd	a1,8(a4)
   1054c:	0741                	addi	a4,a4,16
   1054e:	fed76de3          	bltu	a4,a3,10548 <memset+0x18>
   10552:	e211                	bnez	a2,10556 <memset+0x26>
   10554:	8082                	ret
   10556:	40c306b3          	sub	a3,t1,a2
   1055a:	068a                	slli	a3,a3,0x2
   1055c:	00000297          	auipc	t0,0x0
   10560:	9696                	add	a3,a3,t0
   10562:	00a68067          	jr	10(a3)
   10566:	00b70723          	sb	a1,14(a4)
   1056a:	00b706a3          	sb	a1,13(a4)
   1056e:	00b70623          	sb	a1,12(a4)
   10572:	00b705a3          	sb	a1,11(a4)
   10576:	00b70523          	sb	a1,10(a4)
   1057a:	00b704a3          	sb	a1,9(a4)
   1057e:	00b70423          	sb	a1,8(a4)
   10582:	00b703a3          	sb	a1,7(a4)
   10586:	00b70323          	sb	a1,6(a4)
   1058a:	00b702a3          	sb	a1,5(a4)
   1058e:	00b70223          	sb	a1,4(a4)
   10592:	00b701a3          	sb	a1,3(a4)
   10596:	00b70123          	sb	a1,2(a4)
   1059a:	00b700a3          	sb	a1,1(a4)
   1059e:	00b70023          	sb	a1,0(a4)
   105a2:	8082                	ret
   105a4:	0ff5f593          	andi	a1,a1,255
   105a8:	00859693          	slli	a3,a1,0x8
   105ac:	8dd5                	or	a1,a1,a3
   105ae:	01059693          	slli	a3,a1,0x10
   105b2:	8dd5                	or	a1,a1,a3
   105b4:	02059693          	slli	a3,a1,0x20
   105b8:	8dd5                	or	a1,a1,a3
   105ba:	b759                	j	10540 <memset+0x10>
   105bc:	00279693          	slli	a3,a5,0x2
   105c0:	00000297          	auipc	t0,0x0
   105c4:	9696                	add	a3,a3,t0
   105c6:	8286                	mv	t0,ra
   105c8:	fa2680e7          	jalr	-94(a3)
   105cc:	8096                	mv	ra,t0
   105ce:	17c1                	addi	a5,a5,-16
   105d0:	8f1d                	sub	a4,a4,a5
   105d2:	963e                	add	a2,a2,a5
   105d4:	f8c371e3          	bgeu	t1,a2,10556 <memset+0x26>
   105d8:	b79d                	j	1053e <memset+0xe>

00000000000105da <__call_exitprocs>:
   105da:	715d                	addi	sp,sp,-80
   105dc:	f052                	sd	s4,32(sp)
   105de:	f481ba03          	ld	s4,-184(gp) # 11ee8 <_global_impure_ptr>
   105e2:	f84a                	sd	s2,48(sp)
   105e4:	e486                	sd	ra,72(sp)
   105e6:	1f8a3903          	ld	s2,504(s4)
   105ea:	e0a2                	sd	s0,64(sp)
   105ec:	fc26                	sd	s1,56(sp)
   105ee:	f44e                	sd	s3,40(sp)
   105f0:	ec56                	sd	s5,24(sp)
   105f2:	e85a                	sd	s6,16(sp)
   105f4:	e45e                	sd	s7,8(sp)
   105f6:	e062                	sd	s8,0(sp)
   105f8:	02090863          	beqz	s2,10628 <__call_exitprocs+0x4e>
   105fc:	8b2a                	mv	s6,a0
   105fe:	8bae                	mv	s7,a1
   10600:	4a85                	li	s5,1
   10602:	59fd                	li	s3,-1
   10604:	00892483          	lw	s1,8(s2)
   10608:	fff4841b          	addiw	s0,s1,-1
   1060c:	00044e63          	bltz	s0,10628 <__call_exitprocs+0x4e>
   10610:	048e                	slli	s1,s1,0x3
   10612:	94ca                	add	s1,s1,s2
   10614:	020b8663          	beqz	s7,10640 <__call_exitprocs+0x66>
   10618:	2084b783          	ld	a5,520(s1)
   1061c:	03778263          	beq	a5,s7,10640 <__call_exitprocs+0x66>
   10620:	347d                	addiw	s0,s0,-1
   10622:	14e1                	addi	s1,s1,-8
   10624:	ff3418e3          	bne	s0,s3,10614 <__call_exitprocs+0x3a>
   10628:	60a6                	ld	ra,72(sp)
   1062a:	6406                	ld	s0,64(sp)
   1062c:	74e2                	ld	s1,56(sp)
   1062e:	7942                	ld	s2,48(sp)
   10630:	79a2                	ld	s3,40(sp)
   10632:	7a02                	ld	s4,32(sp)
   10634:	6ae2                	ld	s5,24(sp)
   10636:	6b42                	ld	s6,16(sp)
   10638:	6ba2                	ld	s7,8(sp)
   1063a:	6c02                	ld	s8,0(sp)
   1063c:	6161                	addi	sp,sp,80
   1063e:	8082                	ret
   10640:	00892783          	lw	a5,8(s2)
   10644:	6498                	ld	a4,8(s1)
   10646:	37fd                	addiw	a5,a5,-1
   10648:	04878463          	beq	a5,s0,10690 <__call_exitprocs+0xb6>
   1064c:	0004b423          	sd	zero,8(s1)
   10650:	db61                	beqz	a4,10620 <__call_exitprocs+0x46>
   10652:	31092783          	lw	a5,784(s2)
   10656:	008a96bb          	sllw	a3,s5,s0
   1065a:	00892c03          	lw	s8,8(s2)
   1065e:	8ff5                	and	a5,a5,a3
   10660:	2781                	sext.w	a5,a5
   10662:	ef89                	bnez	a5,1067c <__call_exitprocs+0xa2>
   10664:	9702                	jalr	a4
   10666:	00892703          	lw	a4,8(s2)
   1066a:	1f8a3783          	ld	a5,504(s4)
   1066e:	01871463          	bne	a4,s8,10676 <__call_exitprocs+0x9c>
   10672:	faf907e3          	beq	s2,a5,10620 <__call_exitprocs+0x46>
   10676:	dbcd                	beqz	a5,10628 <__call_exitprocs+0x4e>
   10678:	893e                	mv	s2,a5
   1067a:	b769                	j	10604 <__call_exitprocs+0x2a>
   1067c:	31492783          	lw	a5,788(s2)
   10680:	1084b583          	ld	a1,264(s1)
   10684:	8ff5                	and	a5,a5,a3
   10686:	2781                	sext.w	a5,a5
   10688:	e799                	bnez	a5,10696 <__call_exitprocs+0xbc>
   1068a:	855a                	mv	a0,s6
   1068c:	9702                	jalr	a4
   1068e:	bfe1                	j	10666 <__call_exitprocs+0x8c>
   10690:	00892423          	sw	s0,8(s2)
   10694:	bf75                	j	10650 <__call_exitprocs+0x76>
   10696:	852e                	mv	a0,a1
   10698:	9702                	jalr	a4
   1069a:	b7f1                	j	10666 <__call_exitprocs+0x8c>

000000000001069c <__libc_fini_array>:
   1069c:	1101                	addi	sp,sp,-32
   1069e:	e822                	sd	s0,16(sp)
   106a0:	67c5                	lui	a5,0x11
   106a2:	6445                	lui	s0,0x11
   106a4:	79840413          	addi	s0,s0,1944 # 11798 <__init_array_end>
   106a8:	7a078793          	addi	a5,a5,1952 # 117a0 <__fini_array_end>
   106ac:	8f81                	sub	a5,a5,s0
   106ae:	e426                	sd	s1,8(sp)
   106b0:	ec06                	sd	ra,24(sp)
   106b2:	4037d493          	srai	s1,a5,0x3
   106b6:	c881                	beqz	s1,106c6 <__libc_fini_array+0x2a>
   106b8:	17e1                	addi	a5,a5,-8
   106ba:	943e                	add	s0,s0,a5
   106bc:	601c                	ld	a5,0(s0)
   106be:	14fd                	addi	s1,s1,-1
   106c0:	1461                	addi	s0,s0,-8
   106c2:	9782                	jalr	a5
   106c4:	fce5                	bnez	s1,106bc <__libc_fini_array+0x20>
   106c6:	60e2                	ld	ra,24(sp)
   106c8:	6442                	ld	s0,16(sp)
   106ca:	64a2                	ld	s1,8(sp)
   106cc:	6105                	addi	sp,sp,32
   106ce:	8082                	ret

00000000000106d0 <atexit>:
   106d0:	85aa                	mv	a1,a0
   106d2:	4681                	li	a3,0
   106d4:	4601                	li	a2,0
   106d6:	4501                	li	a0,0
   106d8:	a009                	j	106da <__register_exitproc>

00000000000106da <__register_exitproc>:
   106da:	f481b703          	ld	a4,-184(gp) # 11ee8 <_global_impure_ptr>
   106de:	1f873783          	ld	a5,504(a4)
   106e2:	c3b1                	beqz	a5,10726 <__register_exitproc+0x4c>
   106e4:	4798                	lw	a4,8(a5)
   106e6:	487d                	li	a6,31
   106e8:	06e84263          	blt	a6,a4,1074c <__register_exitproc+0x72>
   106ec:	c505                	beqz	a0,10714 <__register_exitproc+0x3a>
   106ee:	00371813          	slli	a6,a4,0x3
   106f2:	983e                	add	a6,a6,a5
   106f4:	10c83823          	sd	a2,272(a6)
   106f8:	3107a883          	lw	a7,784(a5)
   106fc:	4605                	li	a2,1
   106fe:	00e6163b          	sllw	a2,a2,a4
   10702:	00c8e8b3          	or	a7,a7,a2
   10706:	3117a823          	sw	a7,784(a5)
   1070a:	20d83823          	sd	a3,528(a6)
   1070e:	4689                	li	a3,2
   10710:	02d50063          	beq	a0,a3,10730 <__register_exitproc+0x56>
   10714:	00270693          	addi	a3,a4,2
   10718:	068e                	slli	a3,a3,0x3
   1071a:	2705                	addiw	a4,a4,1
   1071c:	c798                	sw	a4,8(a5)
   1071e:	97b6                	add	a5,a5,a3
   10720:	e38c                	sd	a1,0(a5)
   10722:	4501                	li	a0,0
   10724:	8082                	ret
   10726:	20070793          	addi	a5,a4,512
   1072a:	1ef73c23          	sd	a5,504(a4)
   1072e:	bf5d                	j	106e4 <__register_exitproc+0xa>
   10730:	3147a683          	lw	a3,788(a5)
   10734:	4501                	li	a0,0
   10736:	8e55                	or	a2,a2,a3
   10738:	00270693          	addi	a3,a4,2
   1073c:	068e                	slli	a3,a3,0x3
   1073e:	2705                	addiw	a4,a4,1
   10740:	30c7aa23          	sw	a2,788(a5)
   10744:	c798                	sw	a4,8(a5)
   10746:	97b6                	add	a5,a5,a3
   10748:	e38c                	sd	a1,0(a5)
   1074a:	8082                	ret
   1074c:	557d                	li	a0,-1
   1074e:	8082                	ret

0000000000010750 <_exit>:
   10750:	4581                	li	a1,0
   10752:	4601                	li	a2,0
   10754:	4681                	li	a3,0
   10756:	4701                	li	a4,0
   10758:	4781                	li	a5,0
   1075a:	05d00893          	li	a7,93
   1075e:	00000073          	ecall
   10762:	00054363          	bltz	a0,10768 <_exit+0x18>
   10766:	a001                	j	10766 <_exit+0x16>
   10768:	1141                	addi	sp,sp,-16
   1076a:	e022                	sd	s0,0(sp)
   1076c:	842a                	mv	s0,a0
   1076e:	e406                	sd	ra,8(sp)
   10770:	4080043b          	negw	s0,s0
   10774:	008000ef          	jal	ra,1077c <__errno>
   10778:	c100                	sw	s0,0(a0)
   1077a:	a001                	j	1077a <_exit+0x2a>

000000000001077c <__errno>:
   1077c:	f581b503          	ld	a0,-168(gp) # 11ef8 <_impure_ptr>
   10780:	8082                	ret

Ackerman.elf:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c789                	beqz	a5,100c2 <register_fini+0x12>
   100ba:	6541                	lui	a0,0x10
   100bc:	70850513          	addi	a0,a0,1800 # 10708 <__libc_fini_array>
   100c0:	adb5                	j	1073c <atexit>
   100c2:	8082                	ret

00000000000100c4 <_start>:
   100c4:	00002197          	auipc	gp,0x2
   100c8:	f4c18193          	addi	gp,gp,-180 # 12010 <__global_pointer$>
   100cc:	f6018513          	addi	a0,gp,-160 # 11f70 <_edata>
   100d0:	f9818613          	addi	a2,gp,-104 # 11fa8 <__BSS_END__>
   100d4:	8e09                	sub	a2,a2,a0
   100d6:	4581                	li	a1,0
   100d8:	4c4000ef          	jal	ra,1059c <memset>
   100dc:	00000517          	auipc	a0,0x0
   100e0:	66050513          	addi	a0,a0,1632 # 1073c <atexit>
   100e4:	c519                	beqz	a0,100f2 <_start+0x2e>
   100e6:	00000517          	auipc	a0,0x0
   100ea:	62250513          	addi	a0,a0,1570 # 10708 <__libc_fini_array>
   100ee:	64e000ef          	jal	ra,1073c <atexit>
   100f2:	440000ef          	jal	ra,10532 <__libc_init_array>
   100f6:	4502                	lw	a0,0(sp)
   100f8:	002c                	addi	a1,sp,8
   100fa:	4601                	li	a2,0
   100fc:	310000ef          	jal	ra,1040c <main>
   10100:	a911                	j	10514 <exit>

0000000000010102 <__do_global_dtors_aux>:
   10102:	f601c703          	lbu	a4,-160(gp) # 11f70 <_edata>
   10106:	eb05                	bnez	a4,10136 <__do_global_dtors_aux+0x34>
   10108:	1141                	addi	sp,sp,-16
   1010a:	e022                	sd	s0,0(sp)
   1010c:	843e                	mv	s0,a5
   1010e:	000007b7          	lui	a5,0x0
   10112:	e406                	sd	ra,8(sp)
   10114:	00078793          	mv	a5,a5
   10118:	cb81                	beqz	a5,10128 <__do_global_dtors_aux+0x26>
   1011a:	6545                	lui	a0,0x11
   1011c:	7f050513          	addi	a0,a0,2032 # 117f0 <__FRAME_END__>
   10120:	00000097          	auipc	ra,0x0
   10124:	000000e7          	jalr	zero # 0 <register_fini-0x100b0>
   10128:	4785                	li	a5,1
   1012a:	60a2                	ld	ra,8(sp)
   1012c:	f6f18023          	sb	a5,-160(gp) # 11f70 <_edata>
   10130:	6402                	ld	s0,0(sp)
   10132:	0141                	addi	sp,sp,16
   10134:	8082                	ret
   10136:	8082                	ret

0000000000010138 <frame_dummy>:
   10138:	000007b7          	lui	a5,0x0
   1013c:	00078793          	mv	a5,a5
   10140:	cb91                	beqz	a5,10154 <frame_dummy+0x1c>
   10142:	6545                	lui	a0,0x11
   10144:	f6818593          	addi	a1,gp,-152 # 11f78 <object.5532>
   10148:	7f050513          	addi	a0,a0,2032 # 117f0 <__FRAME_END__>
   1014c:	00000317          	auipc	t1,0x0
   10150:	00000067          	jr	zero # 0 <register_fini-0x100b0>
   10154:	8082                	ret
	...

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

0000000000010348 <ack>:
   10348:	fd010113          	addi	sp,sp,-48
   1034c:	02113423          	sd	ra,40(sp)
   10350:	02813023          	sd	s0,32(sp)
   10354:	00913c23          	sd	s1,24(sp)
   10358:	03010413          	addi	s0,sp,48
   1035c:	00050793          	mv	a5,a0
   10360:	00058713          	mv	a4,a1
   10364:	fcf42e23          	sw	a5,-36(s0)
   10368:	00070793          	mv	a5,a4
   1036c:	fcf42c23          	sw	a5,-40(s0)
   10370:	fdc42783          	lw	a5,-36(s0)
   10374:	0007879b          	sext.w	a5,a5
   10378:	00079a63          	bnez	a5,1038c <ack+0x44>
   1037c:	fd842783          	lw	a5,-40(s0)
   10380:	0017879b          	addiw	a5,a5,1
   10384:	0007879b          	sext.w	a5,a5
   10388:	06c0006f          	j	103f4 <ack+0xac>
   1038c:	fd842783          	lw	a5,-40(s0)
   10390:	0007879b          	sext.w	a5,a5
   10394:	02079263          	bnez	a5,103b8 <ack+0x70>
   10398:	fdc42783          	lw	a5,-36(s0)
   1039c:	fff7879b          	addiw	a5,a5,-1
   103a0:	0007879b          	sext.w	a5,a5
   103a4:	00100593          	li	a1,1
   103a8:	00078513          	mv	a0,a5
   103ac:	f9dff0ef          	jal	ra,10348 <ack>
   103b0:	00050793          	mv	a5,a0
   103b4:	0400006f          	j	103f4 <ack+0xac>
   103b8:	fdc42783          	lw	a5,-36(s0)
   103bc:	fff7879b          	addiw	a5,a5,-1
   103c0:	0007849b          	sext.w	s1,a5
   103c4:	fd842783          	lw	a5,-40(s0)
   103c8:	fff7879b          	addiw	a5,a5,-1
   103cc:	0007871b          	sext.w	a4,a5
   103d0:	fdc42783          	lw	a5,-36(s0)
   103d4:	00070593          	mv	a1,a4
   103d8:	00078513          	mv	a0,a5
   103dc:	f6dff0ef          	jal	ra,10348 <ack>
   103e0:	00050793          	mv	a5,a0
   103e4:	00078593          	mv	a1,a5
   103e8:	00048513          	mv	a0,s1
   103ec:	f5dff0ef          	jal	ra,10348 <ack>
   103f0:	00050793          	mv	a5,a0
   103f4:	00078513          	mv	a0,a5
   103f8:	02813083          	ld	ra,40(sp)
   103fc:	02013403          	ld	s0,32(sp)
   10400:	01813483          	ld	s1,24(sp)
   10404:	03010113          	addi	sp,sp,48
   10408:	00008067          	ret

000000000001040c <main>:
   1040c:	fd010113          	addi	sp,sp,-48
   10410:	02113423          	sd	ra,40(sp)
   10414:	02813023          	sd	s0,32(sp)
   10418:	03010413          	addi	s0,sp,48
   1041c:	fe042623          	sw	zero,-20(s0)
   10420:	0a80006f          	j	104c8 <main+0xbc>
   10424:	fe042423          	sw	zero,-24(s0)
   10428:	0840006f          	j	104ac <main+0xa0>
   1042c:	fe842703          	lw	a4,-24(s0)
   10430:	fec42783          	lw	a5,-20(s0)
   10434:	00070593          	mv	a1,a4
   10438:	00078513          	mv	a0,a5
   1043c:	f0dff0ef          	jal	ra,10348 <ack>
   10440:	00050793          	mv	a5,a0
   10444:	00078713          	mv	a4,a5
   10448:	fd040793          	addi	a5,s0,-48
   1044c:	00078593          	mv	a1,a5
   10450:	00070513          	mv	a0,a4
   10454:	d05ff0ef          	jal	ra,10158 <Int2Str>
   10458:	00050793          	mv	a5,a0
   1045c:	fef42223          	sw	a5,-28(s0)
   10460:	fd040793          	addi	a5,s0,-48
   10464:	fe442683          	lw	a3,-28(s0)
   10468:	00000713          	li	a4,0
   1046c:	00078613          	mv	a2,a5
   10470:	00100593          	li	a1,1
   10474:	04000513          	li	a0,64
   10478:	e85ff0ef          	jal	ra,102fc <my_syscall>
   1047c:	00a00793          	li	a5,10
   10480:	fcf40823          	sb	a5,-48(s0)
   10484:	fd040793          	addi	a5,s0,-48
   10488:	00000713          	li	a4,0
   1048c:	00100693          	li	a3,1
   10490:	00078613          	mv	a2,a5
   10494:	00100593          	li	a1,1
   10498:	04000513          	li	a0,64
   1049c:	e61ff0ef          	jal	ra,102fc <my_syscall>
   104a0:	fe842783          	lw	a5,-24(s0)
   104a4:	0017879b          	addiw	a5,a5,1
   104a8:	fef42423          	sw	a5,-24(s0)
   104ac:	fe842783          	lw	a5,-24(s0)
   104b0:	0007871b          	sext.w	a4,a5
   104b4:	00200793          	li	a5,2
   104b8:	f6e7dae3          	bge	a5,a4,1042c <main+0x20>
   104bc:	fec42783          	lw	a5,-20(s0)
   104c0:	0017879b          	addiw	a5,a5,1
   104c4:	fef42623          	sw	a5,-20(s0)
   104c8:	fec42783          	lw	a5,-20(s0)
   104cc:	0007871b          	sext.w	a4,a5
   104d0:	00200793          	li	a5,2
   104d4:	f4e7d8e3          	bge	a5,a4,10424 <main+0x18>
   104d8:	00a00793          	li	a5,10
   104dc:	fcf40823          	sb	a5,-48(s0)
   104e0:	fd040793          	addi	a5,s0,-48
   104e4:	00000713          	li	a4,0
   104e8:	00100693          	li	a3,1
   104ec:	00078613          	mv	a2,a5
   104f0:	00100593          	li	a1,1
   104f4:	04000513          	li	a0,64
   104f8:	e05ff0ef          	jal	ra,102fc <my_syscall>
   104fc:	00000793          	li	a5,0
   10500:	00078513          	mv	a0,a5
   10504:	02813083          	ld	ra,40(sp)
   10508:	02013403          	ld	s0,32(sp)
   1050c:	03010113          	addi	sp,sp,48
   10510:	00008067          	ret

0000000000010514 <exit>:
   10514:	1141                	addi	sp,sp,-16
   10516:	4581                	li	a1,0
   10518:	e022                	sd	s0,0(sp)
   1051a:	e406                	sd	ra,8(sp)
   1051c:	842a                	mv	s0,a0
   1051e:	128000ef          	jal	ra,10646 <__call_exitprocs>
   10522:	f481b503          	ld	a0,-184(gp) # 11f58 <_global_impure_ptr>
   10526:	6d3c                	ld	a5,88(a0)
   10528:	c391                	beqz	a5,1052c <exit+0x18>
   1052a:	9782                	jalr	a5
   1052c:	8522                	mv	a0,s0
   1052e:	28e000ef          	jal	ra,107bc <_exit>

0000000000010532 <__libc_init_array>:
   10532:	1101                	addi	sp,sp,-32
   10534:	e822                	sd	s0,16(sp)
   10536:	e04a                	sd	s2,0(sp)
   10538:	6445                	lui	s0,0x11
   1053a:	6945                	lui	s2,0x11
   1053c:	7f440793          	addi	a5,s0,2036 # 117f4 <__preinit_array_end>
   10540:	7f490913          	addi	s2,s2,2036 # 117f4 <__preinit_array_end>
   10544:	40f90933          	sub	s2,s2,a5
   10548:	ec06                	sd	ra,24(sp)
   1054a:	e426                	sd	s1,8(sp)
   1054c:	40395913          	srai	s2,s2,0x3
   10550:	00090b63          	beqz	s2,10566 <__libc_init_array+0x34>
   10554:	7f440413          	addi	s0,s0,2036
   10558:	4481                	li	s1,0
   1055a:	601c                	ld	a5,0(s0)
   1055c:	0485                	addi	s1,s1,1
   1055e:	0421                	addi	s0,s0,8
   10560:	9782                	jalr	a5
   10562:	fe991ce3          	bne	s2,s1,1055a <__libc_init_array+0x28>
   10566:	6445                	lui	s0,0x11
   10568:	6949                	lui	s2,0x12
   1056a:	7f840793          	addi	a5,s0,2040 # 117f8 <__init_array_start>
   1056e:	80890913          	addi	s2,s2,-2040 # 11808 <__init_array_end>
   10572:	40f90933          	sub	s2,s2,a5
   10576:	40395913          	srai	s2,s2,0x3
   1057a:	00090b63          	beqz	s2,10590 <__libc_init_array+0x5e>
   1057e:	7f840413          	addi	s0,s0,2040
   10582:	4481                	li	s1,0
   10584:	601c                	ld	a5,0(s0)
   10586:	0485                	addi	s1,s1,1
   10588:	0421                	addi	s0,s0,8
   1058a:	9782                	jalr	a5
   1058c:	fe991ce3          	bne	s2,s1,10584 <__libc_init_array+0x52>
   10590:	60e2                	ld	ra,24(sp)
   10592:	6442                	ld	s0,16(sp)
   10594:	64a2                	ld	s1,8(sp)
   10596:	6902                	ld	s2,0(sp)
   10598:	6105                	addi	sp,sp,32
   1059a:	8082                	ret

000000000001059c <memset>:
   1059c:	433d                	li	t1,15
   1059e:	872a                	mv	a4,a0
   105a0:	02c37163          	bgeu	t1,a2,105c2 <memset+0x26>
   105a4:	00f77793          	andi	a5,a4,15
   105a8:	e3c1                	bnez	a5,10628 <memset+0x8c>
   105aa:	e1bd                	bnez	a1,10610 <memset+0x74>
   105ac:	ff067693          	andi	a3,a2,-16
   105b0:	8a3d                	andi	a2,a2,15
   105b2:	96ba                	add	a3,a3,a4
   105b4:	e30c                	sd	a1,0(a4)
   105b6:	e70c                	sd	a1,8(a4)
   105b8:	0741                	addi	a4,a4,16
   105ba:	fed76de3          	bltu	a4,a3,105b4 <memset+0x18>
   105be:	e211                	bnez	a2,105c2 <memset+0x26>
   105c0:	8082                	ret
   105c2:	40c306b3          	sub	a3,t1,a2
   105c6:	068a                	slli	a3,a3,0x2
   105c8:	00000297          	auipc	t0,0x0
   105cc:	9696                	add	a3,a3,t0
   105ce:	00a68067          	jr	10(a3)
   105d2:	00b70723          	sb	a1,14(a4)
   105d6:	00b706a3          	sb	a1,13(a4)
   105da:	00b70623          	sb	a1,12(a4)
   105de:	00b705a3          	sb	a1,11(a4)
   105e2:	00b70523          	sb	a1,10(a4)
   105e6:	00b704a3          	sb	a1,9(a4)
   105ea:	00b70423          	sb	a1,8(a4)
   105ee:	00b703a3          	sb	a1,7(a4)
   105f2:	00b70323          	sb	a1,6(a4)
   105f6:	00b702a3          	sb	a1,5(a4)
   105fa:	00b70223          	sb	a1,4(a4)
   105fe:	00b701a3          	sb	a1,3(a4)
   10602:	00b70123          	sb	a1,2(a4)
   10606:	00b700a3          	sb	a1,1(a4)
   1060a:	00b70023          	sb	a1,0(a4)
   1060e:	8082                	ret
   10610:	0ff5f593          	andi	a1,a1,255
   10614:	00859693          	slli	a3,a1,0x8
   10618:	8dd5                	or	a1,a1,a3
   1061a:	01059693          	slli	a3,a1,0x10
   1061e:	8dd5                	or	a1,a1,a3
   10620:	02059693          	slli	a3,a1,0x20
   10624:	8dd5                	or	a1,a1,a3
   10626:	b759                	j	105ac <memset+0x10>
   10628:	00279693          	slli	a3,a5,0x2
   1062c:	00000297          	auipc	t0,0x0
   10630:	9696                	add	a3,a3,t0
   10632:	8286                	mv	t0,ra
   10634:	fa2680e7          	jalr	-94(a3)
   10638:	8096                	mv	ra,t0
   1063a:	17c1                	addi	a5,a5,-16
   1063c:	8f1d                	sub	a4,a4,a5
   1063e:	963e                	add	a2,a2,a5
   10640:	f8c371e3          	bgeu	t1,a2,105c2 <memset+0x26>
   10644:	b79d                	j	105aa <memset+0xe>

0000000000010646 <__call_exitprocs>:
   10646:	715d                	addi	sp,sp,-80
   10648:	f052                	sd	s4,32(sp)
   1064a:	f481ba03          	ld	s4,-184(gp) # 11f58 <_global_impure_ptr>
   1064e:	f84a                	sd	s2,48(sp)
   10650:	e486                	sd	ra,72(sp)
   10652:	1f8a3903          	ld	s2,504(s4)
   10656:	e0a2                	sd	s0,64(sp)
   10658:	fc26                	sd	s1,56(sp)
   1065a:	f44e                	sd	s3,40(sp)
   1065c:	ec56                	sd	s5,24(sp)
   1065e:	e85a                	sd	s6,16(sp)
   10660:	e45e                	sd	s7,8(sp)
   10662:	e062                	sd	s8,0(sp)
   10664:	02090863          	beqz	s2,10694 <__call_exitprocs+0x4e>
   10668:	8b2a                	mv	s6,a0
   1066a:	8bae                	mv	s7,a1
   1066c:	4a85                	li	s5,1
   1066e:	59fd                	li	s3,-1
   10670:	00892483          	lw	s1,8(s2)
   10674:	fff4841b          	addiw	s0,s1,-1
   10678:	00044e63          	bltz	s0,10694 <__call_exitprocs+0x4e>
   1067c:	048e                	slli	s1,s1,0x3
   1067e:	94ca                	add	s1,s1,s2
   10680:	020b8663          	beqz	s7,106ac <__call_exitprocs+0x66>
   10684:	2084b783          	ld	a5,520(s1)
   10688:	03778263          	beq	a5,s7,106ac <__call_exitprocs+0x66>
   1068c:	347d                	addiw	s0,s0,-1
   1068e:	14e1                	addi	s1,s1,-8
   10690:	ff3418e3          	bne	s0,s3,10680 <__call_exitprocs+0x3a>
   10694:	60a6                	ld	ra,72(sp)
   10696:	6406                	ld	s0,64(sp)
   10698:	74e2                	ld	s1,56(sp)
   1069a:	7942                	ld	s2,48(sp)
   1069c:	79a2                	ld	s3,40(sp)
   1069e:	7a02                	ld	s4,32(sp)
   106a0:	6ae2                	ld	s5,24(sp)
   106a2:	6b42                	ld	s6,16(sp)
   106a4:	6ba2                	ld	s7,8(sp)
   106a6:	6c02                	ld	s8,0(sp)
   106a8:	6161                	addi	sp,sp,80
   106aa:	8082                	ret
   106ac:	00892783          	lw	a5,8(s2)
   106b0:	6498                	ld	a4,8(s1)
   106b2:	37fd                	addiw	a5,a5,-1
   106b4:	04878463          	beq	a5,s0,106fc <__call_exitprocs+0xb6>
   106b8:	0004b423          	sd	zero,8(s1)
   106bc:	db61                	beqz	a4,1068c <__call_exitprocs+0x46>
   106be:	31092783          	lw	a5,784(s2)
   106c2:	008a96bb          	sllw	a3,s5,s0
   106c6:	00892c03          	lw	s8,8(s2)
   106ca:	8ff5                	and	a5,a5,a3
   106cc:	2781                	sext.w	a5,a5
   106ce:	ef89                	bnez	a5,106e8 <__call_exitprocs+0xa2>
   106d0:	9702                	jalr	a4
   106d2:	00892703          	lw	a4,8(s2)
   106d6:	1f8a3783          	ld	a5,504(s4)
   106da:	01871463          	bne	a4,s8,106e2 <__call_exitprocs+0x9c>
   106de:	faf907e3          	beq	s2,a5,1068c <__call_exitprocs+0x46>
   106e2:	dbcd                	beqz	a5,10694 <__call_exitprocs+0x4e>
   106e4:	893e                	mv	s2,a5
   106e6:	b769                	j	10670 <__call_exitprocs+0x2a>
   106e8:	31492783          	lw	a5,788(s2)
   106ec:	1084b583          	ld	a1,264(s1)
   106f0:	8ff5                	and	a5,a5,a3
   106f2:	2781                	sext.w	a5,a5
   106f4:	e799                	bnez	a5,10702 <__call_exitprocs+0xbc>
   106f6:	855a                	mv	a0,s6
   106f8:	9702                	jalr	a4
   106fa:	bfe1                	j	106d2 <__call_exitprocs+0x8c>
   106fc:	00892423          	sw	s0,8(s2)
   10700:	bf75                	j	106bc <__call_exitprocs+0x76>
   10702:	852e                	mv	a0,a1
   10704:	9702                	jalr	a4
   10706:	b7f1                	j	106d2 <__call_exitprocs+0x8c>

0000000000010708 <__libc_fini_array>:
   10708:	1101                	addi	sp,sp,-32
   1070a:	e822                	sd	s0,16(sp)
   1070c:	67c9                	lui	a5,0x12
   1070e:	6449                	lui	s0,0x12
   10710:	80840413          	addi	s0,s0,-2040 # 11808 <__init_array_end>
   10714:	81078793          	addi	a5,a5,-2032 # 11810 <__fini_array_end>
   10718:	8f81                	sub	a5,a5,s0
   1071a:	e426                	sd	s1,8(sp)
   1071c:	ec06                	sd	ra,24(sp)
   1071e:	4037d493          	srai	s1,a5,0x3
   10722:	c881                	beqz	s1,10732 <__libc_fini_array+0x2a>
   10724:	17e1                	addi	a5,a5,-8
   10726:	943e                	add	s0,s0,a5
   10728:	601c                	ld	a5,0(s0)
   1072a:	14fd                	addi	s1,s1,-1
   1072c:	1461                	addi	s0,s0,-8
   1072e:	9782                	jalr	a5
   10730:	fce5                	bnez	s1,10728 <__libc_fini_array+0x20>
   10732:	60e2                	ld	ra,24(sp)
   10734:	6442                	ld	s0,16(sp)
   10736:	64a2                	ld	s1,8(sp)
   10738:	6105                	addi	sp,sp,32
   1073a:	8082                	ret

000000000001073c <atexit>:
   1073c:	85aa                	mv	a1,a0
   1073e:	4681                	li	a3,0
   10740:	4601                	li	a2,0
   10742:	4501                	li	a0,0
   10744:	a009                	j	10746 <__register_exitproc>

0000000000010746 <__register_exitproc>:
   10746:	f481b703          	ld	a4,-184(gp) # 11f58 <_global_impure_ptr>
   1074a:	1f873783          	ld	a5,504(a4)
   1074e:	c3b1                	beqz	a5,10792 <__register_exitproc+0x4c>
   10750:	4798                	lw	a4,8(a5)
   10752:	487d                	li	a6,31
   10754:	06e84263          	blt	a6,a4,107b8 <__register_exitproc+0x72>
   10758:	c505                	beqz	a0,10780 <__register_exitproc+0x3a>
   1075a:	00371813          	slli	a6,a4,0x3
   1075e:	983e                	add	a6,a6,a5
   10760:	10c83823          	sd	a2,272(a6)
   10764:	3107a883          	lw	a7,784(a5)
   10768:	4605                	li	a2,1
   1076a:	00e6163b          	sllw	a2,a2,a4
   1076e:	00c8e8b3          	or	a7,a7,a2
   10772:	3117a823          	sw	a7,784(a5)
   10776:	20d83823          	sd	a3,528(a6)
   1077a:	4689                	li	a3,2
   1077c:	02d50063          	beq	a0,a3,1079c <__register_exitproc+0x56>
   10780:	00270693          	addi	a3,a4,2
   10784:	068e                	slli	a3,a3,0x3
   10786:	2705                	addiw	a4,a4,1
   10788:	c798                	sw	a4,8(a5)
   1078a:	97b6                	add	a5,a5,a3
   1078c:	e38c                	sd	a1,0(a5)
   1078e:	4501                	li	a0,0
   10790:	8082                	ret
   10792:	20070793          	addi	a5,a4,512
   10796:	1ef73c23          	sd	a5,504(a4)
   1079a:	bf5d                	j	10750 <__register_exitproc+0xa>
   1079c:	3147a683          	lw	a3,788(a5)
   107a0:	4501                	li	a0,0
   107a2:	8e55                	or	a2,a2,a3
   107a4:	00270693          	addi	a3,a4,2
   107a8:	068e                	slli	a3,a3,0x3
   107aa:	2705                	addiw	a4,a4,1
   107ac:	30c7aa23          	sw	a2,788(a5)
   107b0:	c798                	sw	a4,8(a5)
   107b2:	97b6                	add	a5,a5,a3
   107b4:	e38c                	sd	a1,0(a5)
   107b6:	8082                	ret
   107b8:	557d                	li	a0,-1
   107ba:	8082                	ret

00000000000107bc <_exit>:
   107bc:	4581                	li	a1,0
   107be:	4601                	li	a2,0
   107c0:	4681                	li	a3,0
   107c2:	4701                	li	a4,0
   107c4:	4781                	li	a5,0
   107c6:	05d00893          	li	a7,93
   107ca:	00000073          	ecall
   107ce:	00054363          	bltz	a0,107d4 <_exit+0x18>
   107d2:	a001                	j	107d2 <_exit+0x16>
   107d4:	1141                	addi	sp,sp,-16
   107d6:	e022                	sd	s0,0(sp)
   107d8:	842a                	mv	s0,a0
   107da:	e406                	sd	ra,8(sp)
   107dc:	4080043b          	negw	s0,s0
   107e0:	008000ef          	jal	ra,107e8 <__errno>
   107e4:	c100                	sw	s0,0(a0)
   107e6:	a001                	j	107e6 <_exit+0x2a>

00000000000107e8 <__errno>:
   107e8:	f581b503          	ld	a0,-168(gp) # 11f68 <_impure_ptr>
   107ec:	8082                	ret

Ackerman.elf:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c789                	beqz	a5,100c2 <register_fini+0x12>
   100ba:	6541                	lui	a0,0x10
   100bc:	70850513          	addi	a0,a0,1800 # 10708 <__libc_fini_array>
   100c0:	adb5                	j	1073c <atexit>
   100c2:	8082                	ret

00000000000100c4 <_start>:
   100c4:	00002197          	auipc	gp,0x2
   100c8:	f4c18193          	addi	gp,gp,-180 # 12010 <__global_pointer$>
   100cc:	f6018513          	addi	a0,gp,-160 # 11f70 <_edata>
   100d0:	f9818613          	addi	a2,gp,-104 # 11fa8 <__BSS_END__>
   100d4:	8e09                	sub	a2,a2,a0
   100d6:	4581                	li	a1,0
   100d8:	4c4000ef          	jal	ra,1059c <memset>
   100dc:	00000517          	auipc	a0,0x0
   100e0:	66050513          	addi	a0,a0,1632 # 1073c <atexit>
   100e4:	c519                	beqz	a0,100f2 <_start+0x2e>
   100e6:	00000517          	auipc	a0,0x0
   100ea:	62250513          	addi	a0,a0,1570 # 10708 <__libc_fini_array>
   100ee:	64e000ef          	jal	ra,1073c <atexit>
   100f2:	440000ef          	jal	ra,10532 <__libc_init_array>
   100f6:	4502                	lw	a0,0(sp)
   100f8:	002c                	addi	a1,sp,8
   100fa:	4601                	li	a2,0
   100fc:	310000ef          	jal	ra,1040c <main>
   10100:	a911                	j	10514 <exit>

0000000000010102 <__do_global_dtors_aux>:
   10102:	f601c703          	lbu	a4,-160(gp) # 11f70 <_edata>
   10106:	eb05                	bnez	a4,10136 <__do_global_dtors_aux+0x34>
   10108:	1141                	addi	sp,sp,-16
   1010a:	e022                	sd	s0,0(sp)
   1010c:	843e                	mv	s0,a5
   1010e:	000007b7          	lui	a5,0x0
   10112:	e406                	sd	ra,8(sp)
   10114:	00078793          	mv	a5,a5
   10118:	cb81                	beqz	a5,10128 <__do_global_dtors_aux+0x26>
   1011a:	6545                	lui	a0,0x11
   1011c:	7f050513          	addi	a0,a0,2032 # 117f0 <__FRAME_END__>
   10120:	00000097          	auipc	ra,0x0
   10124:	000000e7          	jalr	zero # 0 <register_fini-0x100b0>
   10128:	4785                	li	a5,1
   1012a:	60a2                	ld	ra,8(sp)
   1012c:	f6f18023          	sb	a5,-160(gp) # 11f70 <_edata>
   10130:	6402                	ld	s0,0(sp)
   10132:	0141                	addi	sp,sp,16
   10134:	8082                	ret
   10136:	8082                	ret

0000000000010138 <frame_dummy>:
   10138:	000007b7          	lui	a5,0x0
   1013c:	00078793          	mv	a5,a5
   10140:	cb91                	beqz	a5,10154 <frame_dummy+0x1c>
   10142:	6545                	lui	a0,0x11
   10144:	f6818593          	addi	a1,gp,-152 # 11f78 <object.5532>
   10148:	7f050513          	addi	a0,a0,2032 # 117f0 <__FRAME_END__>
   1014c:	00000317          	auipc	t1,0x0
   10150:	00000067          	jr	zero # 0 <register_fini-0x100b0>
   10154:	8082                	ret
	...

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

0000000000010348 <ack>:
   10348:	fd010113          	addi	sp,sp,-48
   1034c:	02113423          	sd	ra,40(sp)
   10350:	02813023          	sd	s0,32(sp)
   10354:	00913c23          	sd	s1,24(sp)
   10358:	03010413          	addi	s0,sp,48
   1035c:	00050793          	mv	a5,a0
   10360:	00058713          	mv	a4,a1
   10364:	fcf42e23          	sw	a5,-36(s0)
   10368:	00070793          	mv	a5,a4
   1036c:	fcf42c23          	sw	a5,-40(s0)
   10370:	fdc42783          	lw	a5,-36(s0)
   10374:	0007879b          	sext.w	a5,a5
   10378:	00079a63          	bnez	a5,1038c <ack+0x44>
   1037c:	fd842783          	lw	a5,-40(s0)
   10380:	0017879b          	addiw	a5,a5,1
   10384:	0007879b          	sext.w	a5,a5
   10388:	06c0006f          	j	103f4 <ack+0xac>
   1038c:	fd842783          	lw	a5,-40(s0)
   10390:	0007879b          	sext.w	a5,a5
   10394:	02079263          	bnez	a5,103b8 <ack+0x70>
   10398:	fdc42783          	lw	a5,-36(s0)
   1039c:	fff7879b          	addiw	a5,a5,-1
   103a0:	0007879b          	sext.w	a5,a5
   103a4:	00100593          	li	a1,1
   103a8:	00078513          	mv	a0,a5
   103ac:	f9dff0ef          	jal	ra,10348 <ack>
   103b0:	00050793          	mv	a5,a0
   103b4:	0400006f          	j	103f4 <ack+0xac>
   103b8:	fdc42783          	lw	a5,-36(s0)
   103bc:	fff7879b          	addiw	a5,a5,-1
   103c0:	0007849b          	sext.w	s1,a5
   103c4:	fd842783          	lw	a5,-40(s0)
   103c8:	fff7879b          	addiw	a5,a5,-1
   103cc:	0007871b          	sext.w	a4,a5
   103d0:	fdc42783          	lw	a5,-36(s0)
   103d4:	00070593          	mv	a1,a4
   103d8:	00078513          	mv	a0,a5
   103dc:	f6dff0ef          	jal	ra,10348 <ack>
   103e0:	00050793          	mv	a5,a0
   103e4:	00078593          	mv	a1,a5
   103e8:	00048513          	mv	a0,s1
   103ec:	f5dff0ef          	jal	ra,10348 <ack>
   103f0:	00050793          	mv	a5,a0
   103f4:	00078513          	mv	a0,a5
   103f8:	02813083          	ld	ra,40(sp)
   103fc:	02013403          	ld	s0,32(sp)
   10400:	01813483          	ld	s1,24(sp)
   10404:	03010113          	addi	sp,sp,48
   10408:	00008067          	ret

000000000001040c <main>:
   1040c:	fd010113          	addi	sp,sp,-48
   10410:	02113423          	sd	ra,40(sp)
   10414:	02813023          	sd	s0,32(sp)
   10418:	03010413          	addi	s0,sp,48
   1041c:	fe042623          	sw	zero,-20(s0)
   10420:	0a80006f          	j	104c8 <main+0xbc>
   10424:	fe042423          	sw	zero,-24(s0)
   10428:	0840006f          	j	104ac <main+0xa0>
   1042c:	fe842703          	lw	a4,-24(s0)
   10430:	fec42783          	lw	a5,-20(s0)
   10434:	00070593          	mv	a1,a4
   10438:	00078513          	mv	a0,a5
   1043c:	f0dff0ef          	jal	ra,10348 <ack>
   10440:	00050793          	mv	a5,a0
   10444:	00078713          	mv	a4,a5
   10448:	fd040793          	addi	a5,s0,-48
   1044c:	00078593          	mv	a1,a5
   10450:	00070513          	mv	a0,a4
   10454:	d05ff0ef          	jal	ra,10158 <Int2Str>
   10458:	00050793          	mv	a5,a0
   1045c:	fef42223          	sw	a5,-28(s0)
   10460:	fd040793          	addi	a5,s0,-48
   10464:	fe442683          	lw	a3,-28(s0)
   10468:	00000713          	li	a4,0
   1046c:	00078613          	mv	a2,a5
   10470:	00100593          	li	a1,1
   10474:	04000513          	li	a0,64
   10478:	e85ff0ef          	jal	ra,102fc <my_syscall>
   1047c:	00a00793          	li	a5,10
   10480:	fcf40823          	sb	a5,-48(s0)
   10484:	fd040793          	addi	a5,s0,-48
   10488:	00000713          	li	a4,0
   1048c:	00100693          	li	a3,1
   10490:	00078613          	mv	a2,a5
   10494:	00100593          	li	a1,1
   10498:	04000513          	li	a0,64
   1049c:	e61ff0ef          	jal	ra,102fc <my_syscall>
   104a0:	fe842783          	lw	a5,-24(s0)
   104a4:	0017879b          	addiw	a5,a5,1
   104a8:	fef42423          	sw	a5,-24(s0)
   104ac:	fe842783          	lw	a5,-24(s0)
   104b0:	0007871b          	sext.w	a4,a5
   104b4:	00300793          	li	a5,3
   104b8:	f6e7dae3          	bge	a5,a4,1042c <main+0x20>
   104bc:	fec42783          	lw	a5,-20(s0)
   104c0:	0017879b          	addiw	a5,a5,1
   104c4:	fef42623          	sw	a5,-20(s0)
   104c8:	fec42783          	lw	a5,-20(s0)
   104cc:	0007871b          	sext.w	a4,a5
   104d0:	00300793          	li	a5,3
   104d4:	f4e7d8e3          	bge	a5,a4,10424 <main+0x18>
   104d8:	00a00793          	li	a5,10
   104dc:	fcf40823          	sb	a5,-48(s0)
   104e0:	fd040793          	addi	a5,s0,-48
   104e4:	00000713          	li	a4,0
   104e8:	00100693          	li	a3,1
   104ec:	00078613          	mv	a2,a5
   104f0:	00100593          	li	a1,1
   104f4:	04000513          	li	a0,64
   104f8:	e05ff0ef          	jal	ra,102fc <my_syscall>
   104fc:	00000793          	li	a5,0
   10500:	00078513          	mv	a0,a5
   10504:	02813083          	ld	ra,40(sp)
   10508:	02013403          	ld	s0,32(sp)
   1050c:	03010113          	addi	sp,sp,48
   10510:	00008067          	ret

0000000000010514 <exit>:
   10514:	1141                	addi	sp,sp,-16
   10516:	4581                	li	a1,0
   10518:	e022                	sd	s0,0(sp)
   1051a:	e406                	sd	ra,8(sp)
   1051c:	842a                	mv	s0,a0
   1051e:	128000ef          	jal	ra,10646 <__call_exitprocs>
   10522:	f481b503          	ld	a0,-184(gp) # 11f58 <_global_impure_ptr>
   10526:	6d3c                	ld	a5,88(a0)
   10528:	c391                	beqz	a5,1052c <exit+0x18>
   1052a:	9782                	jalr	a5
   1052c:	8522                	mv	a0,s0
   1052e:	28e000ef          	jal	ra,107bc <_exit>

0000000000010532 <__libc_init_array>:
   10532:	1101                	addi	sp,sp,-32
   10534:	e822                	sd	s0,16(sp)
   10536:	e04a                	sd	s2,0(sp)
   10538:	6445                	lui	s0,0x11
   1053a:	6945                	lui	s2,0x11
   1053c:	7f440793          	addi	a5,s0,2036 # 117f4 <__preinit_array_end>
   10540:	7f490913          	addi	s2,s2,2036 # 117f4 <__preinit_array_end>
   10544:	40f90933          	sub	s2,s2,a5
   10548:	ec06                	sd	ra,24(sp)
   1054a:	e426                	sd	s1,8(sp)
   1054c:	40395913          	srai	s2,s2,0x3
   10550:	00090b63          	beqz	s2,10566 <__libc_init_array+0x34>
   10554:	7f440413          	addi	s0,s0,2036
   10558:	4481                	li	s1,0
   1055a:	601c                	ld	a5,0(s0)
   1055c:	0485                	addi	s1,s1,1
   1055e:	0421                	addi	s0,s0,8
   10560:	9782                	jalr	a5
   10562:	fe991ce3          	bne	s2,s1,1055a <__libc_init_array+0x28>
   10566:	6445                	lui	s0,0x11
   10568:	6949                	lui	s2,0x12
   1056a:	7f840793          	addi	a5,s0,2040 # 117f8 <__init_array_start>
   1056e:	80890913          	addi	s2,s2,-2040 # 11808 <__init_array_end>
   10572:	40f90933          	sub	s2,s2,a5
   10576:	40395913          	srai	s2,s2,0x3
   1057a:	00090b63          	beqz	s2,10590 <__libc_init_array+0x5e>
   1057e:	7f840413          	addi	s0,s0,2040
   10582:	4481                	li	s1,0
   10584:	601c                	ld	a5,0(s0)
   10586:	0485                	addi	s1,s1,1
   10588:	0421                	addi	s0,s0,8
   1058a:	9782                	jalr	a5
   1058c:	fe991ce3          	bne	s2,s1,10584 <__libc_init_array+0x52>
   10590:	60e2                	ld	ra,24(sp)
   10592:	6442                	ld	s0,16(sp)
   10594:	64a2                	ld	s1,8(sp)
   10596:	6902                	ld	s2,0(sp)
   10598:	6105                	addi	sp,sp,32
   1059a:	8082                	ret

000000000001059c <memset>:
   1059c:	433d                	li	t1,15
   1059e:	872a                	mv	a4,a0
   105a0:	02c37163          	bgeu	t1,a2,105c2 <memset+0x26>
   105a4:	00f77793          	andi	a5,a4,15
   105a8:	e3c1                	bnez	a5,10628 <memset+0x8c>
   105aa:	e1bd                	bnez	a1,10610 <memset+0x74>
   105ac:	ff067693          	andi	a3,a2,-16
   105b0:	8a3d                	andi	a2,a2,15
   105b2:	96ba                	add	a3,a3,a4
   105b4:	e30c                	sd	a1,0(a4)
   105b6:	e70c                	sd	a1,8(a4)
   105b8:	0741                	addi	a4,a4,16
   105ba:	fed76de3          	bltu	a4,a3,105b4 <memset+0x18>
   105be:	e211                	bnez	a2,105c2 <memset+0x26>
   105c0:	8082                	ret
   105c2:	40c306b3          	sub	a3,t1,a2
   105c6:	068a                	slli	a3,a3,0x2
   105c8:	00000297          	auipc	t0,0x0
   105cc:	9696                	add	a3,a3,t0
   105ce:	00a68067          	jr	10(a3)
   105d2:	00b70723          	sb	a1,14(a4)
   105d6:	00b706a3          	sb	a1,13(a4)
   105da:	00b70623          	sb	a1,12(a4)
   105de:	00b705a3          	sb	a1,11(a4)
   105e2:	00b70523          	sb	a1,10(a4)
   105e6:	00b704a3          	sb	a1,9(a4)
   105ea:	00b70423          	sb	a1,8(a4)
   105ee:	00b703a3          	sb	a1,7(a4)
   105f2:	00b70323          	sb	a1,6(a4)
   105f6:	00b702a3          	sb	a1,5(a4)
   105fa:	00b70223          	sb	a1,4(a4)
   105fe:	00b701a3          	sb	a1,3(a4)
   10602:	00b70123          	sb	a1,2(a4)
   10606:	00b700a3          	sb	a1,1(a4)
   1060a:	00b70023          	sb	a1,0(a4)
   1060e:	8082                	ret
   10610:	0ff5f593          	andi	a1,a1,255
   10614:	00859693          	slli	a3,a1,0x8
   10618:	8dd5                	or	a1,a1,a3
   1061a:	01059693          	slli	a3,a1,0x10
   1061e:	8dd5                	or	a1,a1,a3
   10620:	02059693          	slli	a3,a1,0x20
   10624:	8dd5                	or	a1,a1,a3
   10626:	b759                	j	105ac <memset+0x10>
   10628:	00279693          	slli	a3,a5,0x2
   1062c:	00000297          	auipc	t0,0x0
   10630:	9696                	add	a3,a3,t0
   10632:	8286                	mv	t0,ra
   10634:	fa2680e7          	jalr	-94(a3)
   10638:	8096                	mv	ra,t0
   1063a:	17c1                	addi	a5,a5,-16
   1063c:	8f1d                	sub	a4,a4,a5
   1063e:	963e                	add	a2,a2,a5
   10640:	f8c371e3          	bgeu	t1,a2,105c2 <memset+0x26>
   10644:	b79d                	j	105aa <memset+0xe>

0000000000010646 <__call_exitprocs>:
   10646:	715d                	addi	sp,sp,-80
   10648:	f052                	sd	s4,32(sp)
   1064a:	f481ba03          	ld	s4,-184(gp) # 11f58 <_global_impure_ptr>
   1064e:	f84a                	sd	s2,48(sp)
   10650:	e486                	sd	ra,72(sp)
   10652:	1f8a3903          	ld	s2,504(s4)
   10656:	e0a2                	sd	s0,64(sp)
   10658:	fc26                	sd	s1,56(sp)
   1065a:	f44e                	sd	s3,40(sp)
   1065c:	ec56                	sd	s5,24(sp)
   1065e:	e85a                	sd	s6,16(sp)
   10660:	e45e                	sd	s7,8(sp)
   10662:	e062                	sd	s8,0(sp)
   10664:	02090863          	beqz	s2,10694 <__call_exitprocs+0x4e>
   10668:	8b2a                	mv	s6,a0
   1066a:	8bae                	mv	s7,a1
   1066c:	4a85                	li	s5,1
   1066e:	59fd                	li	s3,-1
   10670:	00892483          	lw	s1,8(s2)
   10674:	fff4841b          	addiw	s0,s1,-1
   10678:	00044e63          	bltz	s0,10694 <__call_exitprocs+0x4e>
   1067c:	048e                	slli	s1,s1,0x3
   1067e:	94ca                	add	s1,s1,s2
   10680:	020b8663          	beqz	s7,106ac <__call_exitprocs+0x66>
   10684:	2084b783          	ld	a5,520(s1)
   10688:	03778263          	beq	a5,s7,106ac <__call_exitprocs+0x66>
   1068c:	347d                	addiw	s0,s0,-1
   1068e:	14e1                	addi	s1,s1,-8
   10690:	ff3418e3          	bne	s0,s3,10680 <__call_exitprocs+0x3a>
   10694:	60a6                	ld	ra,72(sp)
   10696:	6406                	ld	s0,64(sp)
   10698:	74e2                	ld	s1,56(sp)
   1069a:	7942                	ld	s2,48(sp)
   1069c:	79a2                	ld	s3,40(sp)
   1069e:	7a02                	ld	s4,32(sp)
   106a0:	6ae2                	ld	s5,24(sp)
   106a2:	6b42                	ld	s6,16(sp)
   106a4:	6ba2                	ld	s7,8(sp)
   106a6:	6c02                	ld	s8,0(sp)
   106a8:	6161                	addi	sp,sp,80
   106aa:	8082                	ret
   106ac:	00892783          	lw	a5,8(s2)
   106b0:	6498                	ld	a4,8(s1)
   106b2:	37fd                	addiw	a5,a5,-1
   106b4:	04878463          	beq	a5,s0,106fc <__call_exitprocs+0xb6>
   106b8:	0004b423          	sd	zero,8(s1)
   106bc:	db61                	beqz	a4,1068c <__call_exitprocs+0x46>
   106be:	31092783          	lw	a5,784(s2)
   106c2:	008a96bb          	sllw	a3,s5,s0
   106c6:	00892c03          	lw	s8,8(s2)
   106ca:	8ff5                	and	a5,a5,a3
   106cc:	2781                	sext.w	a5,a5
   106ce:	ef89                	bnez	a5,106e8 <__call_exitprocs+0xa2>
   106d0:	9702                	jalr	a4
   106d2:	00892703          	lw	a4,8(s2)
   106d6:	1f8a3783          	ld	a5,504(s4)
   106da:	01871463          	bne	a4,s8,106e2 <__call_exitprocs+0x9c>
   106de:	faf907e3          	beq	s2,a5,1068c <__call_exitprocs+0x46>
   106e2:	dbcd                	beqz	a5,10694 <__call_exitprocs+0x4e>
   106e4:	893e                	mv	s2,a5
   106e6:	b769                	j	10670 <__call_exitprocs+0x2a>
   106e8:	31492783          	lw	a5,788(s2)
   106ec:	1084b583          	ld	a1,264(s1)
   106f0:	8ff5                	and	a5,a5,a3
   106f2:	2781                	sext.w	a5,a5
   106f4:	e799                	bnez	a5,10702 <__call_exitprocs+0xbc>
   106f6:	855a                	mv	a0,s6
   106f8:	9702                	jalr	a4
   106fa:	bfe1                	j	106d2 <__call_exitprocs+0x8c>
   106fc:	00892423          	sw	s0,8(s2)
   10700:	bf75                	j	106bc <__call_exitprocs+0x76>
   10702:	852e                	mv	a0,a1
   10704:	9702                	jalr	a4
   10706:	b7f1                	j	106d2 <__call_exitprocs+0x8c>

0000000000010708 <__libc_fini_array>:
   10708:	1101                	addi	sp,sp,-32
   1070a:	e822                	sd	s0,16(sp)
   1070c:	67c9                	lui	a5,0x12
   1070e:	6449                	lui	s0,0x12
   10710:	80840413          	addi	s0,s0,-2040 # 11808 <__init_array_end>
   10714:	81078793          	addi	a5,a5,-2032 # 11810 <__fini_array_end>
   10718:	8f81                	sub	a5,a5,s0
   1071a:	e426                	sd	s1,8(sp)
   1071c:	ec06                	sd	ra,24(sp)
   1071e:	4037d493          	srai	s1,a5,0x3
   10722:	c881                	beqz	s1,10732 <__libc_fini_array+0x2a>
   10724:	17e1                	addi	a5,a5,-8
   10726:	943e                	add	s0,s0,a5
   10728:	601c                	ld	a5,0(s0)
   1072a:	14fd                	addi	s1,s1,-1
   1072c:	1461                	addi	s0,s0,-8
   1072e:	9782                	jalr	a5
   10730:	fce5                	bnez	s1,10728 <__libc_fini_array+0x20>
   10732:	60e2                	ld	ra,24(sp)
   10734:	6442                	ld	s0,16(sp)
   10736:	64a2                	ld	s1,8(sp)
   10738:	6105                	addi	sp,sp,32
   1073a:	8082                	ret

000000000001073c <atexit>:
   1073c:	85aa                	mv	a1,a0
   1073e:	4681                	li	a3,0
   10740:	4601                	li	a2,0
   10742:	4501                	li	a0,0
   10744:	a009                	j	10746 <__register_exitproc>

0000000000010746 <__register_exitproc>:
   10746:	f481b703          	ld	a4,-184(gp) # 11f58 <_global_impure_ptr>
   1074a:	1f873783          	ld	a5,504(a4)
   1074e:	c3b1                	beqz	a5,10792 <__register_exitproc+0x4c>
   10750:	4798                	lw	a4,8(a5)
   10752:	487d                	li	a6,31
   10754:	06e84263          	blt	a6,a4,107b8 <__register_exitproc+0x72>
   10758:	c505                	beqz	a0,10780 <__register_exitproc+0x3a>
   1075a:	00371813          	slli	a6,a4,0x3
   1075e:	983e                	add	a6,a6,a5
   10760:	10c83823          	sd	a2,272(a6)
   10764:	3107a883          	lw	a7,784(a5)
   10768:	4605                	li	a2,1
   1076a:	00e6163b          	sllw	a2,a2,a4
   1076e:	00c8e8b3          	or	a7,a7,a2
   10772:	3117a823          	sw	a7,784(a5)
   10776:	20d83823          	sd	a3,528(a6)
   1077a:	4689                	li	a3,2
   1077c:	02d50063          	beq	a0,a3,1079c <__register_exitproc+0x56>
   10780:	00270693          	addi	a3,a4,2
   10784:	068e                	slli	a3,a3,0x3
   10786:	2705                	addiw	a4,a4,1
   10788:	c798                	sw	a4,8(a5)
   1078a:	97b6                	add	a5,a5,a3
   1078c:	e38c                	sd	a1,0(a5)
   1078e:	4501                	li	a0,0
   10790:	8082                	ret
   10792:	20070793          	addi	a5,a4,512
   10796:	1ef73c23          	sd	a5,504(a4)
   1079a:	bf5d                	j	10750 <__register_exitproc+0xa>
   1079c:	3147a683          	lw	a3,788(a5)
   107a0:	4501                	li	a0,0
   107a2:	8e55                	or	a2,a2,a3
   107a4:	00270693          	addi	a3,a4,2
   107a8:	068e                	slli	a3,a3,0x3
   107aa:	2705                	addiw	a4,a4,1
   107ac:	30c7aa23          	sw	a2,788(a5)
   107b0:	c798                	sw	a4,8(a5)
   107b2:	97b6                	add	a5,a5,a3
   107b4:	e38c                	sd	a1,0(a5)
   107b6:	8082                	ret
   107b8:	557d                	li	a0,-1
   107ba:	8082                	ret

00000000000107bc <_exit>:
   107bc:	4581                	li	a1,0
   107be:	4601                	li	a2,0
   107c0:	4681                	li	a3,0
   107c2:	4701                	li	a4,0
   107c4:	4781                	li	a5,0
   107c6:	05d00893          	li	a7,93
   107ca:	00000073          	ecall
   107ce:	00054363          	bltz	a0,107d4 <_exit+0x18>
   107d2:	a001                	j	107d2 <_exit+0x16>
   107d4:	1141                	addi	sp,sp,-16
   107d6:	e022                	sd	s0,0(sp)
   107d8:	842a                	mv	s0,a0
   107da:	e406                	sd	ra,8(sp)
   107dc:	4080043b          	negw	s0,s0
   107e0:	008000ef          	jal	ra,107e8 <__errno>
   107e4:	c100                	sw	s0,0(a0)
   107e6:	a001                	j	107e6 <_exit+0x2a>

00000000000107e8 <__errno>:
   107e8:	f581b503          	ld	a0,-168(gp) # 11f68 <_impure_ptr>
   107ec:	8082                	ret

Ackerman.elf:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c791                	beqz	a5,100c4 <register_fini+0x14>
   100ba:	6545                	lui	a0,0x11
   100bc:	82450513          	addi	a0,a0,-2012 # 10824 <__libc_fini_array>
   100c0:	7980006f          	j	10858 <atexit>
   100c4:	8082                	ret

00000000000100c6 <_start>:
   100c6:	00001197          	auipc	gp,0x1
   100ca:	75a18193          	addi	gp,gp,1882 # 11820 <__global_pointer$>
   100ce:	f6018513          	addi	a0,gp,-160 # 11780 <_edata>
   100d2:	f9818613          	addi	a2,gp,-104 # 117b8 <__BSS_END__>
   100d6:	8e09                	sub	a2,a2,a0
   100d8:	4581                	li	a1,0
   100da:	5de000ef          	jal	ra,106b8 <memset>
   100de:	00000517          	auipc	a0,0x0
   100e2:	77a50513          	addi	a0,a0,1914 # 10858 <atexit>
   100e6:	c519                	beqz	a0,100f4 <_start+0x2e>
   100e8:	00000517          	auipc	a0,0x0
   100ec:	73c50513          	addi	a0,a0,1852 # 10824 <__libc_fini_array>
   100f0:	768000ef          	jal	ra,10858 <atexit>
   100f4:	55a000ef          	jal	ra,1064e <__libc_init_array>
   100f8:	4502                	lw	a0,0(sp)
   100fa:	002c                	addi	a1,sp,8
   100fc:	4601                	li	a2,0
   100fe:	42a000ef          	jal	ra,10528 <main>
   10102:	a33d                	j	10630 <exit>

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

0000000000010348 <ack>:
   10348:	fd010113          	addi	sp,sp,-48
   1034c:	02113423          	sd	ra,40(sp)
   10350:	02813023          	sd	s0,32(sp)
   10354:	00913c23          	sd	s1,24(sp)
   10358:	03010413          	addi	s0,sp,48
   1035c:	00050793          	mv	a5,a0
   10360:	00058713          	mv	a4,a1
   10364:	fcf42e23          	sw	a5,-36(s0)
   10368:	00070793          	mv	a5,a4
   1036c:	fcf42c23          	sw	a5,-40(s0)
   10370:	fdc42783          	lw	a5,-36(s0)
   10374:	0007879b          	sext.w	a5,a5
   10378:	00079a63          	bnez	a5,1038c <ack+0x44>
   1037c:	fd842783          	lw	a5,-40(s0)
   10380:	0017879b          	addiw	a5,a5,1
   10384:	0007879b          	sext.w	a5,a5
   10388:	06c0006f          	j	103f4 <ack+0xac>
   1038c:	fd842783          	lw	a5,-40(s0)
   10390:	0007879b          	sext.w	a5,a5
   10394:	02079263          	bnez	a5,103b8 <ack+0x70>
   10398:	fdc42783          	lw	a5,-36(s0)
   1039c:	fff7879b          	addiw	a5,a5,-1
   103a0:	0007879b          	sext.w	a5,a5
   103a4:	00100593          	li	a1,1
   103a8:	00078513          	mv	a0,a5
   103ac:	f9dff0ef          	jal	ra,10348 <ack>
   103b0:	00050793          	mv	a5,a0
   103b4:	0400006f          	j	103f4 <ack+0xac>
   103b8:	fdc42783          	lw	a5,-36(s0)
   103bc:	fff7879b          	addiw	a5,a5,-1
   103c0:	0007849b          	sext.w	s1,a5
   103c4:	fd842783          	lw	a5,-40(s0)
   103c8:	fff7879b          	addiw	a5,a5,-1
   103cc:	0007871b          	sext.w	a4,a5
   103d0:	fdc42783          	lw	a5,-36(s0)
   103d4:	00070593          	mv	a1,a4
   103d8:	00078513          	mv	a0,a5
   103dc:	f6dff0ef          	jal	ra,10348 <ack>
   103e0:	00050793          	mv	a5,a0
   103e4:	00078593          	mv	a1,a5
   103e8:	00048513          	mv	a0,s1
   103ec:	f5dff0ef          	jal	ra,10348 <ack>
   103f0:	00050793          	mv	a5,a0
   103f4:	00078513          	mv	a0,a5
   103f8:	02813083          	ld	ra,40(sp)
   103fc:	02013403          	ld	s0,32(sp)
   10400:	01813483          	ld	s1,24(sp)
   10404:	03010113          	addi	sp,sp,48
   10408:	00008067          	ret

000000000001040c <printleft>:
   1040c:	fc010113          	addi	sp,sp,-64
   10410:	02113c23          	sd	ra,56(sp)
   10414:	02813823          	sd	s0,48(sp)
   10418:	04010413          	addi	s0,sp,64
   1041c:	00050793          	mv	a5,a0
   10420:	00058713          	mv	a4,a1
   10424:	fcf42623          	sw	a5,-52(s0)
   10428:	00070793          	mv	a5,a4
   1042c:	fcf42423          	sw	a5,-56(s0)
   10430:	02800793          	li	a5,40
   10434:	fcf40c23          	sb	a5,-40(s0)
   10438:	fd840793          	addi	a5,s0,-40
   1043c:	00000713          	li	a4,0
   10440:	00100693          	li	a3,1
   10444:	00078613          	mv	a2,a5
   10448:	00100593          	li	a1,1
   1044c:	04000513          	li	a0,64
   10450:	eadff0ef          	jal	ra,102fc <my_syscall>
   10454:	fd840713          	addi	a4,s0,-40
   10458:	fcc42783          	lw	a5,-52(s0)
   1045c:	00070593          	mv	a1,a4
   10460:	00078513          	mv	a0,a5
   10464:	cf5ff0ef          	jal	ra,10158 <Int2Str>
   10468:	00050793          	mv	a5,a0
   1046c:	fef42623          	sw	a5,-20(s0)
   10470:	fd840793          	addi	a5,s0,-40
   10474:	fec42683          	lw	a3,-20(s0)
   10478:	00000713          	li	a4,0
   1047c:	00078613          	mv	a2,a5
   10480:	00100593          	li	a1,1
   10484:	04000513          	li	a0,64
   10488:	e75ff0ef          	jal	ra,102fc <my_syscall>
   1048c:	02c00793          	li	a5,44
   10490:	fcf40c23          	sb	a5,-40(s0)
   10494:	fd840793          	addi	a5,s0,-40
   10498:	00000713          	li	a4,0
   1049c:	00100693          	li	a3,1
   104a0:	00078613          	mv	a2,a5
   104a4:	00100593          	li	a1,1
   104a8:	04000513          	li	a0,64
   104ac:	e51ff0ef          	jal	ra,102fc <my_syscall>
   104b0:	fd840713          	addi	a4,s0,-40
   104b4:	fc842783          	lw	a5,-56(s0)
   104b8:	00070593          	mv	a1,a4
   104bc:	00078513          	mv	a0,a5
   104c0:	c99ff0ef          	jal	ra,10158 <Int2Str>
   104c4:	00050793          	mv	a5,a0
   104c8:	fef42623          	sw	a5,-20(s0)
   104cc:	fd840793          	addi	a5,s0,-40
   104d0:	fec42683          	lw	a3,-20(s0)
   104d4:	00000713          	li	a4,0
   104d8:	00078613          	mv	a2,a5
   104dc:	00100593          	li	a1,1
   104e0:	04000513          	li	a0,64
   104e4:	e19ff0ef          	jal	ra,102fc <my_syscall>
   104e8:	02900793          	li	a5,41
   104ec:	fcf40c23          	sb	a5,-40(s0)
   104f0:	03d00793          	li	a5,61
   104f4:	fcf40ca3          	sb	a5,-39(s0)
   104f8:	fd840793          	addi	a5,s0,-40
   104fc:	00000713          	li	a4,0
   10500:	00200693          	li	a3,2
   10504:	00078613          	mv	a2,a5
   10508:	00100593          	li	a1,1
   1050c:	04000513          	li	a0,64
   10510:	dedff0ef          	jal	ra,102fc <my_syscall>
   10514:	00000013          	nop
   10518:	03813083          	ld	ra,56(sp)
   1051c:	03013403          	ld	s0,48(sp)
   10520:	04010113          	addi	sp,sp,64
   10524:	00008067          	ret

0000000000010528 <main>:
   10528:	fd010113          	addi	sp,sp,-48
   1052c:	02113423          	sd	ra,40(sp)
   10530:	02813023          	sd	s0,32(sp)
   10534:	03010413          	addi	s0,sp,48
   10538:	fe042623          	sw	zero,-20(s0)
   1053c:	0a80006f          	j	105e4 <main+0xbc>
   10540:	fe042423          	sw	zero,-24(s0)
   10544:	0840006f          	j	105c8 <main+0xa0>
   10548:	fe842703          	lw	a4,-24(s0)
   1054c:	fec42783          	lw	a5,-20(s0)
   10550:	00070593          	mv	a1,a4
   10554:	00078513          	mv	a0,a5
   10558:	df1ff0ef          	jal	ra,10348 <ack>
   1055c:	00050793          	mv	a5,a0
   10560:	00078713          	mv	a4,a5
   10564:	fd040793          	addi	a5,s0,-48
   10568:	00078593          	mv	a1,a5
   1056c:	00070513          	mv	a0,a4
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
   10598:	00a00793          	li	a5,10
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
   105d0:	00300793          	li	a5,3
   105d4:	f6e7dae3          	bge	a5,a4,10548 <main+0x20>
   105d8:	fec42783          	lw	a5,-20(s0)
   105dc:	0017879b          	addiw	a5,a5,1
   105e0:	fef42623          	sw	a5,-20(s0)
   105e4:	fec42783          	lw	a5,-20(s0)
   105e8:	0007871b          	sext.w	a4,a5
   105ec:	00300793          	li	a5,3
   105f0:	f4e7d8e3          	bge	a5,a4,10540 <main+0x18>
   105f4:	00a00793          	li	a5,10
   105f8:	fcf40823          	sb	a5,-48(s0)
   105fc:	fd040793          	addi	a5,s0,-48
   10600:	00000713          	li	a4,0
   10604:	00100693          	li	a3,1
   10608:	00078613          	mv	a2,a5
   1060c:	00100593          	li	a1,1
   10610:	04000513          	li	a0,64
   10614:	ce9ff0ef          	jal	ra,102fc <my_syscall>
   10618:	00000793          	li	a5,0
   1061c:	00078513          	mv	a0,a5
   10620:	02813083          	ld	ra,40(sp)
   10624:	02013403          	ld	s0,32(sp)
   10628:	03010113          	addi	sp,sp,48
   1062c:	00008067          	ret

0000000000010630 <exit>:
   10630:	1141                	addi	sp,sp,-16
   10632:	4581                	li	a1,0
   10634:	e022                	sd	s0,0(sp)
   10636:	e406                	sd	ra,8(sp)
   10638:	842a                	mv	s0,a0
   1063a:	128000ef          	jal	ra,10762 <__call_exitprocs>
   1063e:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10642:	6d3c                	ld	a5,88(a0)
   10644:	c391                	beqz	a5,10648 <exit+0x18>
   10646:	9782                	jalr	a5
   10648:	8522                	mv	a0,s0
   1064a:	28e000ef          	jal	ra,108d8 <_exit>

000000000001064e <__libc_init_array>:
   1064e:	1101                	addi	sp,sp,-32
   10650:	e822                	sd	s0,16(sp)
   10652:	e04a                	sd	s2,0(sp)
   10654:	6445                	lui	s0,0x11
   10656:	6945                	lui	s2,0x11
   10658:	00440793          	addi	a5,s0,4 # 11004 <__preinit_array_end>
   1065c:	00490913          	addi	s2,s2,4 # 11004 <__preinit_array_end>
   10660:	40f90933          	sub	s2,s2,a5
   10664:	ec06                	sd	ra,24(sp)
   10666:	e426                	sd	s1,8(sp)
   10668:	40395913          	srai	s2,s2,0x3
   1066c:	00090b63          	beqz	s2,10682 <__libc_init_array+0x34>
   10670:	00440413          	addi	s0,s0,4
   10674:	4481                	li	s1,0
   10676:	601c                	ld	a5,0(s0)
   10678:	0485                	addi	s1,s1,1
   1067a:	0421                	addi	s0,s0,8
   1067c:	9782                	jalr	a5
   1067e:	fe991ce3          	bne	s2,s1,10676 <__libc_init_array+0x28>
   10682:	6445                	lui	s0,0x11
   10684:	6945                	lui	s2,0x11
   10686:	00840793          	addi	a5,s0,8 # 11008 <__init_array_start>
   1068a:	01890913          	addi	s2,s2,24 # 11018 <__init_array_end>
   1068e:	40f90933          	sub	s2,s2,a5
   10692:	40395913          	srai	s2,s2,0x3
   10696:	00090b63          	beqz	s2,106ac <__libc_init_array+0x5e>
   1069a:	00840413          	addi	s0,s0,8
   1069e:	4481                	li	s1,0
   106a0:	601c                	ld	a5,0(s0)
   106a2:	0485                	addi	s1,s1,1
   106a4:	0421                	addi	s0,s0,8
   106a6:	9782                	jalr	a5
   106a8:	fe991ce3          	bne	s2,s1,106a0 <__libc_init_array+0x52>
   106ac:	60e2                	ld	ra,24(sp)
   106ae:	6442                	ld	s0,16(sp)
   106b0:	64a2                	ld	s1,8(sp)
   106b2:	6902                	ld	s2,0(sp)
   106b4:	6105                	addi	sp,sp,32
   106b6:	8082                	ret

00000000000106b8 <memset>:
   106b8:	433d                	li	t1,15
   106ba:	872a                	mv	a4,a0
   106bc:	02c37163          	bgeu	t1,a2,106de <memset+0x26>
   106c0:	00f77793          	andi	a5,a4,15
   106c4:	e3c1                	bnez	a5,10744 <memset+0x8c>
   106c6:	e1bd                	bnez	a1,1072c <memset+0x74>
   106c8:	ff067693          	andi	a3,a2,-16
   106cc:	8a3d                	andi	a2,a2,15
   106ce:	96ba                	add	a3,a3,a4
   106d0:	e30c                	sd	a1,0(a4)
   106d2:	e70c                	sd	a1,8(a4)
   106d4:	0741                	addi	a4,a4,16
   106d6:	fed76de3          	bltu	a4,a3,106d0 <memset+0x18>
   106da:	e211                	bnez	a2,106de <memset+0x26>
   106dc:	8082                	ret
   106de:	40c306b3          	sub	a3,t1,a2
   106e2:	068a                	slli	a3,a3,0x2
   106e4:	00000297          	auipc	t0,0x0
   106e8:	9696                	add	a3,a3,t0
   106ea:	00a68067          	jr	10(a3)
   106ee:	00b70723          	sb	a1,14(a4)
   106f2:	00b706a3          	sb	a1,13(a4)
   106f6:	00b70623          	sb	a1,12(a4)
   106fa:	00b705a3          	sb	a1,11(a4)
   106fe:	00b70523          	sb	a1,10(a4)
   10702:	00b704a3          	sb	a1,9(a4)
   10706:	00b70423          	sb	a1,8(a4)
   1070a:	00b703a3          	sb	a1,7(a4)
   1070e:	00b70323          	sb	a1,6(a4)
   10712:	00b702a3          	sb	a1,5(a4)
   10716:	00b70223          	sb	a1,4(a4)
   1071a:	00b701a3          	sb	a1,3(a4)
   1071e:	00b70123          	sb	a1,2(a4)
   10722:	00b700a3          	sb	a1,1(a4)
   10726:	00b70023          	sb	a1,0(a4)
   1072a:	8082                	ret
   1072c:	0ff5f593          	andi	a1,a1,255
   10730:	00859693          	slli	a3,a1,0x8
   10734:	8dd5                	or	a1,a1,a3
   10736:	01059693          	slli	a3,a1,0x10
   1073a:	8dd5                	or	a1,a1,a3
   1073c:	02059693          	slli	a3,a1,0x20
   10740:	8dd5                	or	a1,a1,a3
   10742:	b759                	j	106c8 <memset+0x10>
   10744:	00279693          	slli	a3,a5,0x2
   10748:	00000297          	auipc	t0,0x0
   1074c:	9696                	add	a3,a3,t0
   1074e:	8286                	mv	t0,ra
   10750:	fa2680e7          	jalr	-94(a3)
   10754:	8096                	mv	ra,t0
   10756:	17c1                	addi	a5,a5,-16
   10758:	8f1d                	sub	a4,a4,a5
   1075a:	963e                	add	a2,a2,a5
   1075c:	f8c371e3          	bgeu	t1,a2,106de <memset+0x26>
   10760:	b79d                	j	106c6 <memset+0xe>

0000000000010762 <__call_exitprocs>:
   10762:	715d                	addi	sp,sp,-80
   10764:	f052                	sd	s4,32(sp)
   10766:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   1076a:	f84a                	sd	s2,48(sp)
   1076c:	e486                	sd	ra,72(sp)
   1076e:	1f8a3903          	ld	s2,504(s4)
   10772:	e0a2                	sd	s0,64(sp)
   10774:	fc26                	sd	s1,56(sp)
   10776:	f44e                	sd	s3,40(sp)
   10778:	ec56                	sd	s5,24(sp)
   1077a:	e85a                	sd	s6,16(sp)
   1077c:	e45e                	sd	s7,8(sp)
   1077e:	e062                	sd	s8,0(sp)
   10780:	02090863          	beqz	s2,107b0 <__call_exitprocs+0x4e>
   10784:	8b2a                	mv	s6,a0
   10786:	8bae                	mv	s7,a1
   10788:	4a85                	li	s5,1
   1078a:	59fd                	li	s3,-1
   1078c:	00892483          	lw	s1,8(s2)
   10790:	fff4841b          	addiw	s0,s1,-1
   10794:	00044e63          	bltz	s0,107b0 <__call_exitprocs+0x4e>
   10798:	048e                	slli	s1,s1,0x3
   1079a:	94ca                	add	s1,s1,s2
   1079c:	020b8663          	beqz	s7,107c8 <__call_exitprocs+0x66>
   107a0:	2084b783          	ld	a5,520(s1)
   107a4:	03778263          	beq	a5,s7,107c8 <__call_exitprocs+0x66>
   107a8:	347d                	addiw	s0,s0,-1
   107aa:	14e1                	addi	s1,s1,-8
   107ac:	ff3418e3          	bne	s0,s3,1079c <__call_exitprocs+0x3a>
   107b0:	60a6                	ld	ra,72(sp)
   107b2:	6406                	ld	s0,64(sp)
   107b4:	74e2                	ld	s1,56(sp)
   107b6:	7942                	ld	s2,48(sp)
   107b8:	79a2                	ld	s3,40(sp)
   107ba:	7a02                	ld	s4,32(sp)
   107bc:	6ae2                	ld	s5,24(sp)
   107be:	6b42                	ld	s6,16(sp)
   107c0:	6ba2                	ld	s7,8(sp)
   107c2:	6c02                	ld	s8,0(sp)
   107c4:	6161                	addi	sp,sp,80
   107c6:	8082                	ret
   107c8:	00892783          	lw	a5,8(s2)
   107cc:	6498                	ld	a4,8(s1)
   107ce:	37fd                	addiw	a5,a5,-1
   107d0:	04878463          	beq	a5,s0,10818 <__call_exitprocs+0xb6>
   107d4:	0004b423          	sd	zero,8(s1)
   107d8:	db61                	beqz	a4,107a8 <__call_exitprocs+0x46>
   107da:	31092783          	lw	a5,784(s2)
   107de:	008a96bb          	sllw	a3,s5,s0
   107e2:	00892c03          	lw	s8,8(s2)
   107e6:	8ff5                	and	a5,a5,a3
   107e8:	2781                	sext.w	a5,a5
   107ea:	ef89                	bnez	a5,10804 <__call_exitprocs+0xa2>
   107ec:	9702                	jalr	a4
   107ee:	00892703          	lw	a4,8(s2)
   107f2:	1f8a3783          	ld	a5,504(s4)
   107f6:	01871463          	bne	a4,s8,107fe <__call_exitprocs+0x9c>
   107fa:	faf907e3          	beq	s2,a5,107a8 <__call_exitprocs+0x46>
   107fe:	dbcd                	beqz	a5,107b0 <__call_exitprocs+0x4e>
   10800:	893e                	mv	s2,a5
   10802:	b769                	j	1078c <__call_exitprocs+0x2a>
   10804:	31492783          	lw	a5,788(s2)
   10808:	1084b583          	ld	a1,264(s1)
   1080c:	8ff5                	and	a5,a5,a3
   1080e:	2781                	sext.w	a5,a5
   10810:	e799                	bnez	a5,1081e <__call_exitprocs+0xbc>
   10812:	855a                	mv	a0,s6
   10814:	9702                	jalr	a4
   10816:	bfe1                	j	107ee <__call_exitprocs+0x8c>
   10818:	00892423          	sw	s0,8(s2)
   1081c:	bf75                	j	107d8 <__call_exitprocs+0x76>
   1081e:	852e                	mv	a0,a1
   10820:	9702                	jalr	a4
   10822:	b7f1                	j	107ee <__call_exitprocs+0x8c>

0000000000010824 <__libc_fini_array>:
   10824:	1101                	addi	sp,sp,-32
   10826:	e822                	sd	s0,16(sp)
   10828:	67c5                	lui	a5,0x11
   1082a:	6445                	lui	s0,0x11
   1082c:	01840413          	addi	s0,s0,24 # 11018 <__init_array_end>
   10830:	02078793          	addi	a5,a5,32 # 11020 <__fini_array_end>
   10834:	8f81                	sub	a5,a5,s0
   10836:	e426                	sd	s1,8(sp)
   10838:	ec06                	sd	ra,24(sp)
   1083a:	4037d493          	srai	s1,a5,0x3
   1083e:	c881                	beqz	s1,1084e <__libc_fini_array+0x2a>
   10840:	17e1                	addi	a5,a5,-8
   10842:	943e                	add	s0,s0,a5
   10844:	601c                	ld	a5,0(s0)
   10846:	14fd                	addi	s1,s1,-1
   10848:	1461                	addi	s0,s0,-8
   1084a:	9782                	jalr	a5
   1084c:	fce5                	bnez	s1,10844 <__libc_fini_array+0x20>
   1084e:	60e2                	ld	ra,24(sp)
   10850:	6442                	ld	s0,16(sp)
   10852:	64a2                	ld	s1,8(sp)
   10854:	6105                	addi	sp,sp,32
   10856:	8082                	ret

0000000000010858 <atexit>:
   10858:	85aa                	mv	a1,a0
   1085a:	4681                	li	a3,0
   1085c:	4601                	li	a2,0
   1085e:	4501                	li	a0,0
   10860:	a009                	j	10862 <__register_exitproc>

0000000000010862 <__register_exitproc>:
   10862:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   10866:	1f873783          	ld	a5,504(a4)
   1086a:	c3b1                	beqz	a5,108ae <__register_exitproc+0x4c>
   1086c:	4798                	lw	a4,8(a5)
   1086e:	487d                	li	a6,31
   10870:	06e84263          	blt	a6,a4,108d4 <__register_exitproc+0x72>
   10874:	c505                	beqz	a0,1089c <__register_exitproc+0x3a>
   10876:	00371813          	slli	a6,a4,0x3
   1087a:	983e                	add	a6,a6,a5
   1087c:	10c83823          	sd	a2,272(a6)
   10880:	3107a883          	lw	a7,784(a5)
   10884:	4605                	li	a2,1
   10886:	00e6163b          	sllw	a2,a2,a4
   1088a:	00c8e8b3          	or	a7,a7,a2
   1088e:	3117a823          	sw	a7,784(a5)
   10892:	20d83823          	sd	a3,528(a6)
   10896:	4689                	li	a3,2
   10898:	02d50063          	beq	a0,a3,108b8 <__register_exitproc+0x56>
   1089c:	00270693          	addi	a3,a4,2
   108a0:	068e                	slli	a3,a3,0x3
   108a2:	2705                	addiw	a4,a4,1
   108a4:	c798                	sw	a4,8(a5)
   108a6:	97b6                	add	a5,a5,a3
   108a8:	e38c                	sd	a1,0(a5)
   108aa:	4501                	li	a0,0
   108ac:	8082                	ret
   108ae:	20070793          	addi	a5,a4,512
   108b2:	1ef73c23          	sd	a5,504(a4)
   108b6:	bf5d                	j	1086c <__register_exitproc+0xa>
   108b8:	3147a683          	lw	a3,788(a5)
   108bc:	4501                	li	a0,0
   108be:	8e55                	or	a2,a2,a3
   108c0:	00270693          	addi	a3,a4,2
   108c4:	068e                	slli	a3,a3,0x3
   108c6:	2705                	addiw	a4,a4,1
   108c8:	30c7aa23          	sw	a2,788(a5)
   108cc:	c798                	sw	a4,8(a5)
   108ce:	97b6                	add	a5,a5,a3
   108d0:	e38c                	sd	a1,0(a5)
   108d2:	8082                	ret
   108d4:	557d                	li	a0,-1
   108d6:	8082                	ret

00000000000108d8 <_exit>:
   108d8:	4581                	li	a1,0
   108da:	4601                	li	a2,0
   108dc:	4681                	li	a3,0
   108de:	4701                	li	a4,0
   108e0:	4781                	li	a5,0
   108e2:	05d00893          	li	a7,93
   108e6:	00000073          	ecall
   108ea:	00054363          	bltz	a0,108f0 <_exit+0x18>
   108ee:	a001                	j	108ee <_exit+0x16>
   108f0:	1141                	addi	sp,sp,-16
   108f2:	e022                	sd	s0,0(sp)
   108f4:	842a                	mv	s0,a0
   108f6:	e406                	sd	ra,8(sp)
   108f8:	4080043b          	negw	s0,s0
   108fc:	008000ef          	jal	ra,10904 <__errno>
   10900:	c100                	sw	s0,0(a0)
   10902:	a001                	j	10902 <_exit+0x2a>

0000000000010904 <__errno>:
   10904:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   10908:	8082                	ret

Ackerman.elf:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100b0 <register_fini>:
   100b0:	000007b7          	lui	a5,0x0
   100b4:	00078793          	mv	a5,a5
   100b8:	c791                	beqz	a5,100c4 <register_fini+0x14>
   100ba:	6545                	lui	a0,0x11
   100bc:	83850513          	addi	a0,a0,-1992 # 10838 <__libc_fini_array>
   100c0:	7ac0006f          	j	1086c <atexit>
   100c4:	8082                	ret

00000000000100c6 <_start>:
   100c6:	00001197          	auipc	gp,0x1
   100ca:	75a18193          	addi	gp,gp,1882 # 11820 <__global_pointer$>
   100ce:	f6018513          	addi	a0,gp,-160 # 11780 <_edata>
   100d2:	f9818613          	addi	a2,gp,-104 # 117b8 <__BSS_END__>
   100d6:	8e09                	sub	a2,a2,a0
   100d8:	4581                	li	a1,0
   100da:	5f2000ef          	jal	ra,106cc <memset>
   100de:	00000517          	auipc	a0,0x0
   100e2:	78e50513          	addi	a0,a0,1934 # 1086c <atexit>
   100e6:	c519                	beqz	a0,100f4 <_start+0x2e>
   100e8:	00000517          	auipc	a0,0x0
   100ec:	75050513          	addi	a0,a0,1872 # 10838 <__libc_fini_array>
   100f0:	77c000ef          	jal	ra,1086c <atexit>
   100f4:	56e000ef          	jal	ra,10662 <__libc_init_array>
   100f8:	4502                	lw	a0,0(sp)
   100fa:	002c                	addi	a1,sp,8
   100fc:	4601                	li	a2,0
   100fe:	42a000ef          	jal	ra,10528 <main>
   10102:	a389                	j	10644 <exit>

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

0000000000010348 <ack>:
   10348:	fd010113          	addi	sp,sp,-48
   1034c:	02113423          	sd	ra,40(sp)
   10350:	02813023          	sd	s0,32(sp)
   10354:	00913c23          	sd	s1,24(sp)
   10358:	03010413          	addi	s0,sp,48
   1035c:	00050793          	mv	a5,a0
   10360:	00058713          	mv	a4,a1
   10364:	fcf42e23          	sw	a5,-36(s0)
   10368:	00070793          	mv	a5,a4
   1036c:	fcf42c23          	sw	a5,-40(s0)
   10370:	fdc42783          	lw	a5,-36(s0)
   10374:	0007879b          	sext.w	a5,a5
   10378:	00079a63          	bnez	a5,1038c <ack+0x44>
   1037c:	fd842783          	lw	a5,-40(s0)
   10380:	0017879b          	addiw	a5,a5,1
   10384:	0007879b          	sext.w	a5,a5
   10388:	06c0006f          	j	103f4 <ack+0xac>
   1038c:	fd842783          	lw	a5,-40(s0)
   10390:	0007879b          	sext.w	a5,a5
   10394:	02079263          	bnez	a5,103b8 <ack+0x70>
   10398:	fdc42783          	lw	a5,-36(s0)
   1039c:	fff7879b          	addiw	a5,a5,-1
   103a0:	0007879b          	sext.w	a5,a5
   103a4:	00100593          	li	a1,1
   103a8:	00078513          	mv	a0,a5
   103ac:	f9dff0ef          	jal	ra,10348 <ack>
   103b0:	00050793          	mv	a5,a0
   103b4:	0400006f          	j	103f4 <ack+0xac>
   103b8:	fdc42783          	lw	a5,-36(s0)
   103bc:	fff7879b          	addiw	a5,a5,-1
   103c0:	0007849b          	sext.w	s1,a5
   103c4:	fd842783          	lw	a5,-40(s0)
   103c8:	fff7879b          	addiw	a5,a5,-1
   103cc:	0007871b          	sext.w	a4,a5
   103d0:	fdc42783          	lw	a5,-36(s0)
   103d4:	00070593          	mv	a1,a4
   103d8:	00078513          	mv	a0,a5
   103dc:	f6dff0ef          	jal	ra,10348 <ack>
   103e0:	00050793          	mv	a5,a0
   103e4:	00078593          	mv	a1,a5
   103e8:	00048513          	mv	a0,s1
   103ec:	f5dff0ef          	jal	ra,10348 <ack>
   103f0:	00050793          	mv	a5,a0
   103f4:	00078513          	mv	a0,a5
   103f8:	02813083          	ld	ra,40(sp)
   103fc:	02013403          	ld	s0,32(sp)
   10400:	01813483          	ld	s1,24(sp)
   10404:	03010113          	addi	sp,sp,48
   10408:	00008067          	ret

000000000001040c <printleft>:
   1040c:	fc010113          	addi	sp,sp,-64
   10410:	02113c23          	sd	ra,56(sp)
   10414:	02813823          	sd	s0,48(sp)
   10418:	04010413          	addi	s0,sp,64
   1041c:	00050793          	mv	a5,a0
   10420:	00058713          	mv	a4,a1
   10424:	fcf42623          	sw	a5,-52(s0)
   10428:	00070793          	mv	a5,a4
   1042c:	fcf42423          	sw	a5,-56(s0)
   10430:	02800793          	li	a5,40
   10434:	fcf40c23          	sb	a5,-40(s0)
   10438:	fd840793          	addi	a5,s0,-40
   1043c:	00000713          	li	a4,0
   10440:	00100693          	li	a3,1
   10444:	00078613          	mv	a2,a5
   10448:	00100593          	li	a1,1
   1044c:	04000513          	li	a0,64
   10450:	eadff0ef          	jal	ra,102fc <my_syscall>
   10454:	fd840713          	addi	a4,s0,-40
   10458:	fcc42783          	lw	a5,-52(s0)
   1045c:	00070593          	mv	a1,a4
   10460:	00078513          	mv	a0,a5
   10464:	cf5ff0ef          	jal	ra,10158 <Int2Str>
   10468:	00050793          	mv	a5,a0
   1046c:	fef42623          	sw	a5,-20(s0)
   10470:	fd840793          	addi	a5,s0,-40
   10474:	fec42683          	lw	a3,-20(s0)
   10478:	00000713          	li	a4,0
   1047c:	00078613          	mv	a2,a5
   10480:	00100593          	li	a1,1
   10484:	04000513          	li	a0,64
   10488:	e75ff0ef          	jal	ra,102fc <my_syscall>
   1048c:	02c00793          	li	a5,44
   10490:	fcf40c23          	sb	a5,-40(s0)
   10494:	fd840793          	addi	a5,s0,-40
   10498:	00000713          	li	a4,0
   1049c:	00100693          	li	a3,1
   104a0:	00078613          	mv	a2,a5
   104a4:	00100593          	li	a1,1
   104a8:	04000513          	li	a0,64
   104ac:	e51ff0ef          	jal	ra,102fc <my_syscall>
   104b0:	fd840713          	addi	a4,s0,-40
   104b4:	fc842783          	lw	a5,-56(s0)
   104b8:	00070593          	mv	a1,a4
   104bc:	00078513          	mv	a0,a5
   104c0:	c99ff0ef          	jal	ra,10158 <Int2Str>
   104c4:	00050793          	mv	a5,a0
   104c8:	fef42623          	sw	a5,-20(s0)
   104cc:	fd840793          	addi	a5,s0,-40
   104d0:	fec42683          	lw	a3,-20(s0)
   104d4:	00000713          	li	a4,0
   104d8:	00078613          	mv	a2,a5
   104dc:	00100593          	li	a1,1
   104e0:	04000513          	li	a0,64
   104e4:	e19ff0ef          	jal	ra,102fc <my_syscall>
   104e8:	02900793          	li	a5,41
   104ec:	fcf40c23          	sb	a5,-40(s0)
   104f0:	03d00793          	li	a5,61
   104f4:	fcf40ca3          	sb	a5,-39(s0)
   104f8:	fd840793          	addi	a5,s0,-40
   104fc:	00000713          	li	a4,0
   10500:	00200693          	li	a3,2
   10504:	00078613          	mv	a2,a5
   10508:	00100593          	li	a1,1
   1050c:	04000513          	li	a0,64
   10510:	dedff0ef          	jal	ra,102fc <my_syscall>
   10514:	00000013          	nop
   10518:	03813083          	ld	ra,56(sp)
   1051c:	03013403          	ld	s0,48(sp)
   10520:	04010113          	addi	sp,sp,64
   10524:	00008067          	ret

0000000000010528 <main>:
   10528:	fd010113          	addi	sp,sp,-48
   1052c:	02113423          	sd	ra,40(sp)
   10530:	02813023          	sd	s0,32(sp)
   10534:	03010413          	addi	s0,sp,48
   10538:	fe042623          	sw	zero,-20(s0)
   1053c:	0bc0006f          	j	105f8 <main+0xd0>
   10540:	fe042423          	sw	zero,-24(s0)
   10544:	0980006f          	j	105dc <main+0xb4>
   10548:	fe842703          	lw	a4,-24(s0)
   1054c:	fec42783          	lw	a5,-20(s0)
   10550:	00070593          	mv	a1,a4
   10554:	00078513          	mv	a0,a5
   10558:	eb5ff0ef          	jal	ra,1040c <printleft>
   1055c:	fe842703          	lw	a4,-24(s0)
   10560:	fec42783          	lw	a5,-20(s0)
   10564:	00070593          	mv	a1,a4
   10568:	00078513          	mv	a0,a5
   1056c:	dddff0ef          	jal	ra,10348 <ack>
   10570:	00050793          	mv	a5,a0
   10574:	00078713          	mv	a4,a5
   10578:	fd040793          	addi	a5,s0,-48
   1057c:	00078593          	mv	a1,a5
   10580:	00070513          	mv	a0,a4
   10584:	bd5ff0ef          	jal	ra,10158 <Int2Str>
   10588:	00050793          	mv	a5,a0
   1058c:	fef42223          	sw	a5,-28(s0)
   10590:	fd040793          	addi	a5,s0,-48
   10594:	fe442683          	lw	a3,-28(s0)
   10598:	00000713          	li	a4,0
   1059c:	00078613          	mv	a2,a5
   105a0:	00100593          	li	a1,1
   105a4:	04000513          	li	a0,64
   105a8:	d55ff0ef          	jal	ra,102fc <my_syscall>
   105ac:	00a00793          	li	a5,10
   105b0:	fcf40823          	sb	a5,-48(s0)
   105b4:	fd040793          	addi	a5,s0,-48
   105b8:	00000713          	li	a4,0
   105bc:	00100693          	li	a3,1
   105c0:	00078613          	mv	a2,a5
   105c4:	00100593          	li	a1,1
   105c8:	04000513          	li	a0,64
   105cc:	d31ff0ef          	jal	ra,102fc <my_syscall>
   105d0:	fe842783          	lw	a5,-24(s0)
   105d4:	0017879b          	addiw	a5,a5,1
   105d8:	fef42423          	sw	a5,-24(s0)
   105dc:	fe842783          	lw	a5,-24(s0)
   105e0:	0007871b          	sext.w	a4,a5
   105e4:	00300793          	li	a5,3
   105e8:	f6e7d0e3          	bge	a5,a4,10548 <main+0x20>
   105ec:	fec42783          	lw	a5,-20(s0)
   105f0:	0017879b          	addiw	a5,a5,1
   105f4:	fef42623          	sw	a5,-20(s0)
   105f8:	fec42783          	lw	a5,-20(s0)
   105fc:	0007871b          	sext.w	a4,a5
   10600:	00300793          	li	a5,3
   10604:	f2e7dee3          	bge	a5,a4,10540 <main+0x18>
   10608:	00a00793          	li	a5,10
   1060c:	fcf40823          	sb	a5,-48(s0)
   10610:	fd040793          	addi	a5,s0,-48
   10614:	00000713          	li	a4,0
   10618:	00100693          	li	a3,1
   1061c:	00078613          	mv	a2,a5
   10620:	00100593          	li	a1,1
   10624:	04000513          	li	a0,64
   10628:	cd5ff0ef          	jal	ra,102fc <my_syscall>
   1062c:	00000793          	li	a5,0
   10630:	00078513          	mv	a0,a5
   10634:	02813083          	ld	ra,40(sp)
   10638:	02013403          	ld	s0,32(sp)
   1063c:	03010113          	addi	sp,sp,48
   10640:	00008067          	ret

0000000000010644 <exit>:
   10644:	1141                	addi	sp,sp,-16
   10646:	4581                	li	a1,0
   10648:	e022                	sd	s0,0(sp)
   1064a:	e406                	sd	ra,8(sp)
   1064c:	842a                	mv	s0,a0
   1064e:	128000ef          	jal	ra,10776 <__call_exitprocs>
   10652:	f481b503          	ld	a0,-184(gp) # 11768 <_global_impure_ptr>
   10656:	6d3c                	ld	a5,88(a0)
   10658:	c391                	beqz	a5,1065c <exit+0x18>
   1065a:	9782                	jalr	a5
   1065c:	8522                	mv	a0,s0
   1065e:	28e000ef          	jal	ra,108ec <_exit>

0000000000010662 <__libc_init_array>:
   10662:	1101                	addi	sp,sp,-32
   10664:	e822                	sd	s0,16(sp)
   10666:	e04a                	sd	s2,0(sp)
   10668:	6445                	lui	s0,0x11
   1066a:	6945                	lui	s2,0x11
   1066c:	00440793          	addi	a5,s0,4 # 11004 <__preinit_array_end>
   10670:	00490913          	addi	s2,s2,4 # 11004 <__preinit_array_end>
   10674:	40f90933          	sub	s2,s2,a5
   10678:	ec06                	sd	ra,24(sp)
   1067a:	e426                	sd	s1,8(sp)
   1067c:	40395913          	srai	s2,s2,0x3
   10680:	00090b63          	beqz	s2,10696 <__libc_init_array+0x34>
   10684:	00440413          	addi	s0,s0,4
   10688:	4481                	li	s1,0
   1068a:	601c                	ld	a5,0(s0)
   1068c:	0485                	addi	s1,s1,1
   1068e:	0421                	addi	s0,s0,8
   10690:	9782                	jalr	a5
   10692:	fe991ce3          	bne	s2,s1,1068a <__libc_init_array+0x28>
   10696:	6445                	lui	s0,0x11
   10698:	6945                	lui	s2,0x11
   1069a:	00840793          	addi	a5,s0,8 # 11008 <__init_array_start>
   1069e:	01890913          	addi	s2,s2,24 # 11018 <__init_array_end>
   106a2:	40f90933          	sub	s2,s2,a5
   106a6:	40395913          	srai	s2,s2,0x3
   106aa:	00090b63          	beqz	s2,106c0 <__libc_init_array+0x5e>
   106ae:	00840413          	addi	s0,s0,8
   106b2:	4481                	li	s1,0
   106b4:	601c                	ld	a5,0(s0)
   106b6:	0485                	addi	s1,s1,1
   106b8:	0421                	addi	s0,s0,8
   106ba:	9782                	jalr	a5
   106bc:	fe991ce3          	bne	s2,s1,106b4 <__libc_init_array+0x52>
   106c0:	60e2                	ld	ra,24(sp)
   106c2:	6442                	ld	s0,16(sp)
   106c4:	64a2                	ld	s1,8(sp)
   106c6:	6902                	ld	s2,0(sp)
   106c8:	6105                	addi	sp,sp,32
   106ca:	8082                	ret

00000000000106cc <memset>:
   106cc:	433d                	li	t1,15
   106ce:	872a                	mv	a4,a0
   106d0:	02c37163          	bgeu	t1,a2,106f2 <memset+0x26>
   106d4:	00f77793          	andi	a5,a4,15
   106d8:	e3c1                	bnez	a5,10758 <memset+0x8c>
   106da:	e1bd                	bnez	a1,10740 <memset+0x74>
   106dc:	ff067693          	andi	a3,a2,-16
   106e0:	8a3d                	andi	a2,a2,15
   106e2:	96ba                	add	a3,a3,a4
   106e4:	e30c                	sd	a1,0(a4)
   106e6:	e70c                	sd	a1,8(a4)
   106e8:	0741                	addi	a4,a4,16
   106ea:	fed76de3          	bltu	a4,a3,106e4 <memset+0x18>
   106ee:	e211                	bnez	a2,106f2 <memset+0x26>
   106f0:	8082                	ret
   106f2:	40c306b3          	sub	a3,t1,a2
   106f6:	068a                	slli	a3,a3,0x2
   106f8:	00000297          	auipc	t0,0x0
   106fc:	9696                	add	a3,a3,t0
   106fe:	00a68067          	jr	10(a3)
   10702:	00b70723          	sb	a1,14(a4)
   10706:	00b706a3          	sb	a1,13(a4)
   1070a:	00b70623          	sb	a1,12(a4)
   1070e:	00b705a3          	sb	a1,11(a4)
   10712:	00b70523          	sb	a1,10(a4)
   10716:	00b704a3          	sb	a1,9(a4)
   1071a:	00b70423          	sb	a1,8(a4)
   1071e:	00b703a3          	sb	a1,7(a4)
   10722:	00b70323          	sb	a1,6(a4)
   10726:	00b702a3          	sb	a1,5(a4)
   1072a:	00b70223          	sb	a1,4(a4)
   1072e:	00b701a3          	sb	a1,3(a4)
   10732:	00b70123          	sb	a1,2(a4)
   10736:	00b700a3          	sb	a1,1(a4)
   1073a:	00b70023          	sb	a1,0(a4)
   1073e:	8082                	ret
   10740:	0ff5f593          	andi	a1,a1,255
   10744:	00859693          	slli	a3,a1,0x8
   10748:	8dd5                	or	a1,a1,a3
   1074a:	01059693          	slli	a3,a1,0x10
   1074e:	8dd5                	or	a1,a1,a3
   10750:	02059693          	slli	a3,a1,0x20
   10754:	8dd5                	or	a1,a1,a3
   10756:	b759                	j	106dc <memset+0x10>
   10758:	00279693          	slli	a3,a5,0x2
   1075c:	00000297          	auipc	t0,0x0
   10760:	9696                	add	a3,a3,t0
   10762:	8286                	mv	t0,ra
   10764:	fa2680e7          	jalr	-94(a3)
   10768:	8096                	mv	ra,t0
   1076a:	17c1                	addi	a5,a5,-16
   1076c:	8f1d                	sub	a4,a4,a5
   1076e:	963e                	add	a2,a2,a5
   10770:	f8c371e3          	bgeu	t1,a2,106f2 <memset+0x26>
   10774:	b79d                	j	106da <memset+0xe>

0000000000010776 <__call_exitprocs>:
   10776:	715d                	addi	sp,sp,-80
   10778:	f052                	sd	s4,32(sp)
   1077a:	f481ba03          	ld	s4,-184(gp) # 11768 <_global_impure_ptr>
   1077e:	f84a                	sd	s2,48(sp)
   10780:	e486                	sd	ra,72(sp)
   10782:	1f8a3903          	ld	s2,504(s4)
   10786:	e0a2                	sd	s0,64(sp)
   10788:	fc26                	sd	s1,56(sp)
   1078a:	f44e                	sd	s3,40(sp)
   1078c:	ec56                	sd	s5,24(sp)
   1078e:	e85a                	sd	s6,16(sp)
   10790:	e45e                	sd	s7,8(sp)
   10792:	e062                	sd	s8,0(sp)
   10794:	02090863          	beqz	s2,107c4 <__call_exitprocs+0x4e>
   10798:	8b2a                	mv	s6,a0
   1079a:	8bae                	mv	s7,a1
   1079c:	4a85                	li	s5,1
   1079e:	59fd                	li	s3,-1
   107a0:	00892483          	lw	s1,8(s2)
   107a4:	fff4841b          	addiw	s0,s1,-1
   107a8:	00044e63          	bltz	s0,107c4 <__call_exitprocs+0x4e>
   107ac:	048e                	slli	s1,s1,0x3
   107ae:	94ca                	add	s1,s1,s2
   107b0:	020b8663          	beqz	s7,107dc <__call_exitprocs+0x66>
   107b4:	2084b783          	ld	a5,520(s1)
   107b8:	03778263          	beq	a5,s7,107dc <__call_exitprocs+0x66>
   107bc:	347d                	addiw	s0,s0,-1
   107be:	14e1                	addi	s1,s1,-8
   107c0:	ff3418e3          	bne	s0,s3,107b0 <__call_exitprocs+0x3a>
   107c4:	60a6                	ld	ra,72(sp)
   107c6:	6406                	ld	s0,64(sp)
   107c8:	74e2                	ld	s1,56(sp)
   107ca:	7942                	ld	s2,48(sp)
   107cc:	79a2                	ld	s3,40(sp)
   107ce:	7a02                	ld	s4,32(sp)
   107d0:	6ae2                	ld	s5,24(sp)
   107d2:	6b42                	ld	s6,16(sp)
   107d4:	6ba2                	ld	s7,8(sp)
   107d6:	6c02                	ld	s8,0(sp)
   107d8:	6161                	addi	sp,sp,80
   107da:	8082                	ret
   107dc:	00892783          	lw	a5,8(s2)
   107e0:	6498                	ld	a4,8(s1)
   107e2:	37fd                	addiw	a5,a5,-1
   107e4:	04878463          	beq	a5,s0,1082c <__call_exitprocs+0xb6>
   107e8:	0004b423          	sd	zero,8(s1)
   107ec:	db61                	beqz	a4,107bc <__call_exitprocs+0x46>
   107ee:	31092783          	lw	a5,784(s2)
   107f2:	008a96bb          	sllw	a3,s5,s0
   107f6:	00892c03          	lw	s8,8(s2)
   107fa:	8ff5                	and	a5,a5,a3
   107fc:	2781                	sext.w	a5,a5
   107fe:	ef89                	bnez	a5,10818 <__call_exitprocs+0xa2>
   10800:	9702                	jalr	a4
   10802:	00892703          	lw	a4,8(s2)
   10806:	1f8a3783          	ld	a5,504(s4)
   1080a:	01871463          	bne	a4,s8,10812 <__call_exitprocs+0x9c>
   1080e:	faf907e3          	beq	s2,a5,107bc <__call_exitprocs+0x46>
   10812:	dbcd                	beqz	a5,107c4 <__call_exitprocs+0x4e>
   10814:	893e                	mv	s2,a5
   10816:	b769                	j	107a0 <__call_exitprocs+0x2a>
   10818:	31492783          	lw	a5,788(s2)
   1081c:	1084b583          	ld	a1,264(s1)
   10820:	8ff5                	and	a5,a5,a3
   10822:	2781                	sext.w	a5,a5
   10824:	e799                	bnez	a5,10832 <__call_exitprocs+0xbc>
   10826:	855a                	mv	a0,s6
   10828:	9702                	jalr	a4
   1082a:	bfe1                	j	10802 <__call_exitprocs+0x8c>
   1082c:	00892423          	sw	s0,8(s2)
   10830:	bf75                	j	107ec <__call_exitprocs+0x76>
   10832:	852e                	mv	a0,a1
   10834:	9702                	jalr	a4
   10836:	b7f1                	j	10802 <__call_exitprocs+0x8c>

0000000000010838 <__libc_fini_array>:
   10838:	1101                	addi	sp,sp,-32
   1083a:	e822                	sd	s0,16(sp)
   1083c:	67c5                	lui	a5,0x11
   1083e:	6445                	lui	s0,0x11
   10840:	01840413          	addi	s0,s0,24 # 11018 <__init_array_end>
   10844:	02078793          	addi	a5,a5,32 # 11020 <__fini_array_end>
   10848:	8f81                	sub	a5,a5,s0
   1084a:	e426                	sd	s1,8(sp)
   1084c:	ec06                	sd	ra,24(sp)
   1084e:	4037d493          	srai	s1,a5,0x3
   10852:	c881                	beqz	s1,10862 <__libc_fini_array+0x2a>
   10854:	17e1                	addi	a5,a5,-8
   10856:	943e                	add	s0,s0,a5
   10858:	601c                	ld	a5,0(s0)
   1085a:	14fd                	addi	s1,s1,-1
   1085c:	1461                	addi	s0,s0,-8
   1085e:	9782                	jalr	a5
   10860:	fce5                	bnez	s1,10858 <__libc_fini_array+0x20>
   10862:	60e2                	ld	ra,24(sp)
   10864:	6442                	ld	s0,16(sp)
   10866:	64a2                	ld	s1,8(sp)
   10868:	6105                	addi	sp,sp,32
   1086a:	8082                	ret

000000000001086c <atexit>:
   1086c:	85aa                	mv	a1,a0
   1086e:	4681                	li	a3,0
   10870:	4601                	li	a2,0
   10872:	4501                	li	a0,0
   10874:	a009                	j	10876 <__register_exitproc>

0000000000010876 <__register_exitproc>:
   10876:	f481b703          	ld	a4,-184(gp) # 11768 <_global_impure_ptr>
   1087a:	1f873783          	ld	a5,504(a4)
   1087e:	c3b1                	beqz	a5,108c2 <__register_exitproc+0x4c>
   10880:	4798                	lw	a4,8(a5)
   10882:	487d                	li	a6,31
   10884:	06e84263          	blt	a6,a4,108e8 <__register_exitproc+0x72>
   10888:	c505                	beqz	a0,108b0 <__register_exitproc+0x3a>
   1088a:	00371813          	slli	a6,a4,0x3
   1088e:	983e                	add	a6,a6,a5
   10890:	10c83823          	sd	a2,272(a6)
   10894:	3107a883          	lw	a7,784(a5)
   10898:	4605                	li	a2,1
   1089a:	00e6163b          	sllw	a2,a2,a4
   1089e:	00c8e8b3          	or	a7,a7,a2
   108a2:	3117a823          	sw	a7,784(a5)
   108a6:	20d83823          	sd	a3,528(a6)
   108aa:	4689                	li	a3,2
   108ac:	02d50063          	beq	a0,a3,108cc <__register_exitproc+0x56>
   108b0:	00270693          	addi	a3,a4,2
   108b4:	068e                	slli	a3,a3,0x3
   108b6:	2705                	addiw	a4,a4,1
   108b8:	c798                	sw	a4,8(a5)
   108ba:	97b6                	add	a5,a5,a3
   108bc:	e38c                	sd	a1,0(a5)
   108be:	4501                	li	a0,0
   108c0:	8082                	ret
   108c2:	20070793          	addi	a5,a4,512
   108c6:	1ef73c23          	sd	a5,504(a4)
   108ca:	bf5d                	j	10880 <__register_exitproc+0xa>
   108cc:	3147a683          	lw	a3,788(a5)
   108d0:	4501                	li	a0,0
   108d2:	8e55                	or	a2,a2,a3
   108d4:	00270693          	addi	a3,a4,2
   108d8:	068e                	slli	a3,a3,0x3
   108da:	2705                	addiw	a4,a4,1
   108dc:	30c7aa23          	sw	a2,788(a5)
   108e0:	c798                	sw	a4,8(a5)
   108e2:	97b6                	add	a5,a5,a3
   108e4:	e38c                	sd	a1,0(a5)
   108e6:	8082                	ret
   108e8:	557d                	li	a0,-1
   108ea:	8082                	ret

00000000000108ec <_exit>:
   108ec:	4581                	li	a1,0
   108ee:	4601                	li	a2,0
   108f0:	4681                	li	a3,0
   108f2:	4701                	li	a4,0
   108f4:	4781                	li	a5,0
   108f6:	05d00893          	li	a7,93
   108fa:	00000073          	ecall
   108fe:	00054363          	bltz	a0,10904 <_exit+0x18>
   10902:	a001                	j	10902 <_exit+0x16>
   10904:	1141                	addi	sp,sp,-16
   10906:	e022                	sd	s0,0(sp)
   10908:	842a                	mv	s0,a0
   1090a:	e406                	sd	ra,8(sp)
   1090c:	4080043b          	negw	s0,s0
   10910:	008000ef          	jal	ra,10918 <__errno>
   10914:	c100                	sw	s0,0(a0)
   10916:	a001                	j	10916 <_exit+0x2a>

0000000000010918 <__errno>:
   10918:	f581b503          	ld	a0,-168(gp) # 11778 <_impure_ptr>
   1091c:	8082                	ret
