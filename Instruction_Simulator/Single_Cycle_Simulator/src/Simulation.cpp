#include<unistd.h>
#include "Simulation.h"
#include "Read_Elf.h"
using namespace std;

extern unsigned long long coff;
extern unsigned long long cadr;
extern unsigned long long csize;
extern unsigned long long doff;
extern unsigned long long dadr;
extern unsigned long long dsize;
extern unsigned long long sdoff;
extern unsigned long long sdadr;
extern unsigned long long sdsize;
extern unsigned long long rdoff;
extern unsigned long long rdadr;
extern unsigned long long rdsize;
extern unsigned long long gp;
extern unsigned long long madr;
extern unsigned long long msize;
extern unsigned long long endPC;
extern unsigned long long entry;

extern char *filename;
extern char *elfname;
extern FILE *file;
extern FILE *elf;

bool TFflag=false;
bool jumpflag=false;

//指令运行数
long long inst_num=0;

//系统调用退出指示
int exit_flag=0;

int main(int argc,char* argv[])
{
    for(int i=1;i<argc;i++)
	{
		if(strcmp(argv[i],"-TF")==0){
            printf("TF Mode\n");
            TFflag=true;
            continue;
		}
		if(strcmp(argv[i],"-I")==0){
			if (i+1>=argc){
				printf("No input file\n");
				return -1;
			}
			file=fopen(argv[i+1],"r+");
			if(file==NULL){
				printf("Cannot open file: %s\nPlease check if it is valid\n",argv[i+1]);
				return -1;
			}
			i++;
			filename=argv[i];
			continue;
		}
		if(strcmp(argv[i],"-E") == 0)
		{
			if(i+1>=argc){
				printf("No output ELF file\n");
				return -1;
			}
			elf=fopen(argv[i+1],"w");
			if(file==NULL){
				printf("Cannot open file: %s\nPlease check if it is valid\n",argv[i+1]);
				return -1;
			}
			i++;
			elfname=argv[i];
			continue;
		}
		printf("Unknown option: %s\n",argv[i]);
		return -2;
	}
	if(file==NULL){
        printf("No input file\n");
        return -1;
	}

	//解析elf文件
	read_elf();

	//加载内存
	load_memory();

	//设置入口地址
	PC=entry>>2;

	//设置全局数据段地址寄存器
	reg[3]=gp;

	reg[2]=MAX/2;//栈基址 （sp寄存器）

	//结束PC的设置
	int endpos=(int)endPC/4-1;

	while(PC!=endpos)
	{
        jumpflag=false;

	    translate_inst();

        execute_inst();

        if(exit_flag==1)
            break;
        if(!jumpflag) PC+=1;
        reg[0]=0;//一直为零

        if(TFflag){
			print_regs();
			print_stack();
			getchar();
		}
	}
    print_regs();
    print_stack();
    printf("Instruct Num: %lld\n",inst_num);

	return 0;
}

void translate_inst()
{
	inst=memory[PC];
	if(TFflag){
        printf("[TF] Instruction:  %08x\n",inst);
        printf("PC              :  %016llX\n",PC<<2);
    }

    OP=getbit(inst,0,6);
    fuc3=getbit(inst,12,14);
	fuc7=getbit(inst,25,31);
	shamt=getbit(inst,20,25);
	rs1=getbit(inst,15,19);
	rs2=getbit(inst,20,24);
	rd=getbit(inst,7,11);

	immI=getbit(inst,20,31);
	immS=getbit(inst,7,11)+(getbit(inst,25,31)<<5);
	immSB=(getbit(inst,8,11)<<1)+(getbit(inst,25,30)<<5)+(getbit(inst,7,7)<<11)+(getbit(inst,31,31)<<12);
	immU=getbit(inst,12,31)<<12;
	immUJ=(getbit(inst,21,30)<<1)+(getbit(inst,20,20)<<11)+(getbit(inst,12,19)<<12)+(getbit(inst,31,31)<<20);

    inst_num+=1;
}

//加载代码段
//初始化PC
void load_memory()
{
	fseek(file,coff,0);
	fread(&memory[cadr>>2],1,csize,file);

    fseek(file,doff,0);
    fread(&memory[dadr>>2],1,dsize,file);

    fseek(file,sdoff,0);
    fread(&memory[sdadr>>2],1,sdsize,file);

    fseek(file,rdoff,0);
    fread(&memory[rdadr>>2],1,rdsize,file);

	fclose(file);
}

void execute_inst()
{
	if(OP==OP_R)
	{
		if(fuc3==F3_ADD&&fuc7==F7_ADD)
		{
            reg[rd]=(long long)reg[rs1]+(long long)reg[rs2];
		}
		else if(fuc3==F3_MUL&&fuc7==F7_MUL)
        {
            reg[rd]=(long long)reg[rs1]*(long long)reg[rs2];
        }
		else if(fuc3==F3_SUB&&fuc7==F7_SUB)
        {
            reg[rd]=(long long)reg[rs1]-(long long)reg[rs2];
        }
        else if(fuc3==F3_SLL&&fuc7==F7_SLL)
        {
            reg[rd]=(long long)reg[rs1]<<(long long)reg[rs2];
        }
        else if(fuc3==F3_MULH&&fuc7==F7_MULH)
        {
            long long high1,high2,low1,low2;
            high1=((long long)reg[rs1]>>16)>>16;
            high2=((long long)reg[rs2]>>16)>>16;
            low1=(long long)reg[rs1]&0xffffffff;
            low2=(long long)reg[rs2]&0xffffffff;
            reg[rd]=high1*high2+high1*low2+high2*low1;
        }
        else if(fuc3==F3_SLT&&fuc7==F7_SLT)
        {
            reg[rd]=((long long)reg[rs1]<(long long)reg[rs2])?1:0;
        }
        else if(fuc3==F3_XOR&&fuc7==F7_XOR)
        {
            reg[rd]=reg[rs1]^reg[rs2];
        }
        else if(fuc3==F3_DIV&&fuc7==F7_DIV)
        {
            reg[rd]=(long long)reg[rs1]/(long long)reg[rs2];
        }
        else if(fuc3==F3_SRL&&fuc7==F7_SRL)
        {
            reg[rd]=reg[rs1]>>reg[rs2];
        }
        else if(fuc3==F3_SRA&&fuc7==F7_SRA)
        {
            reg[rd]=(long long)reg[rs1]>>(long long)reg[rs2];
        }
        else if(fuc3==F3_OR&&fuc7==F7_OR)
        {
            reg[rd]=reg[rs1]|reg[rs2];
        }
        else if(fuc3==F3_REM&&fuc7==F7_REM)
        {
            reg[rd]=(long long)reg[rs1]%(long long)reg[rs2];
        }
        else if(fuc3==F3_AND&&fuc7==F7_AND)
        {
            reg[rd]=reg[rs1]&reg[rs2];
        }
	}
	else if(OP==OP_RW)
	{
        if(fuc3==F3_ADDW&&fuc7==F7_ADDW)
		{
            reg[rd]=ext_signed((int)reg[rs1]+(int)reg[rs2],32);
		}
		else if(fuc3==F3_MULW&&fuc7==F7_MULW)
        {
            reg[rd]=ext_signed((int)reg[rs1]*(int)reg[rs2],32);
        }
		else if(fuc3==F3_SUBW&&fuc7==F7_SUBW)
        {
            reg[rd]=ext_signed((int)reg[rs1]-(int)reg[rs2],32);
        }
        else if(fuc3==F3_DIVW&&fuc7==F7_DIVW)
        {
            reg[rd]=ext_signed((int)reg[rs1]/(int)reg[rs2],32);
        }
        else if(fuc3==F3_REMW&&fuc7==F7_REMW)
        {
            reg[rd]=ext_signed((int)reg[rs1]%(int)reg[rs2],32);
        }
	}
	else if(OP==OP_I1)
	{
        if(fuc3==F3_LB)
		{
            long long pos=(long long)reg[rs1]+ext_signed(immI,12);
            unsigned int content=*((char*)memory+pos);
            reg[rd]=ext_signed(content,8);
		}
		else if(fuc3==F3_LH)
        {
            long long pos=(long long)reg[rs1]+ext_signed(immI,12);
            unsigned int content=*((unsigned short*)((char*)memory+pos));
            reg[rd]=ext_signed(content,16);
        }
		else if(fuc3==F3_LW)
        {
            long long pos=(long long)reg[rs1]+ext_signed(immI,12);
            unsigned int content=*((unsigned int*)((char*)memory+pos));
            reg[rd]=ext_signed(content,32);
        }
        else if(fuc3==F3_LD)
        {
            long long pos=(long long)reg[rs1]+ext_signed(immI,12);
            unsigned long long content=*((unsigned long long*)((char*)memory+pos));
            reg[rd]=content;
        }
        if(fuc3==F3_LBU)
		{
            long long pos=(long long)reg[rs1]+ext_signed(immI,12);
            unsigned int content=*((char*)memory+pos);
            reg[rd]=content;
		}
	}
	else if(OP==OP_I2)
    {
        if(fuc3==F3_ADDI)
        {
            reg[rd]=(long long)reg[rs1]+ext_signed(immI,12);
        }
        else if(fuc3==F3_SLLI&&fuc7==F7_SLLI)
        {
            reg[rd]=reg[rs1]<<(immI&0x1f);
        }
        else if(fuc3==F3_SLTI)
        {
            reg[rd]=((long long)reg[rs1]<(long long)immI)?1:0;
        }
        else if(fuc3==F3_XORI)
        {
            reg[rd]=reg[rs1]^immI;
        }
        else if(fuc3==F3_SRLI&&fuc7==F7_SRLI)
        {
            reg[rd]=reg[rs1]>>(immI&0x1f);
        }
        else if(fuc3==F3_SRAI&&fuc7==F7_SRAI)
        {
            reg[rd]=(long long)reg[rs1]>>(int)(immI&0x1f);
        }
        else if(fuc3==F3_ORI)
        {
            reg[rd]=reg[rs1]|immI;
        }
        else if(fuc3==F3_ANDI)
        {
            reg[rd]=reg[rs1]&immI;
        }
    }
    else if(OP==OP_I3)
    {
        if(fuc3==F3_ADDIW)
        {
            reg[rd]=ext_signed((int)reg[rs1]+(int)ext_signed(immI,12),32);
        }
        else if(fuc3==F3_SLLIW)
        {
            reg[rd]=ext_signed((unsigned int)reg[rs1]<<(immI&0x1f),32);
        }
        else if(fuc3==F3_SRLIW&&fuc7==F7_SRLIW)
        {
            reg[rd]=ext_signed((unsigned int)reg[rs1]>>(immI&0x1f),32);
        }
        else if(fuc3==F3_SRAIW&&fuc7==F7_SRAIW)
        {
            reg[rd]=ext_signed((int)reg[rs1]>>(int)(immI&0x1f),32);
        }
    }
    else if(OP==OP_I4)
    {
        if(fuc3==F3_JALR)
        {
            reg[rd]=(PC<<2)+4;
            PC=((long long)reg[rs1]+(ext_signed(immI,12))>>2);
            jumpflag=true;
        }
    }
    else if(OP==OP_I5)
    {
        if(fuc3==F3_ECALL&&fuc7==F7_ECALL)
        {
            unsigned long long a7=reg[17];
            if(a7==64)////printf
			{
				char *t=(char *)memory+reg[11];
				reg[10]=write((unsigned int)reg[10],t,(unsigned int)reg[12]);
			}
			else if(a7==63)//scanf
			{
                char *t=(char *)memory+reg[11];
				reg[10]=read((unsigned int)reg[10],t,(unsigned int)reg[12]);
			}
			else if(a7==169)//time
			{
                reg[10]=time(NULL);
			}
			else if(a7==93)//exit
			{
				exit_flag=1;
			}
        }
    }
    else if(OP==OP_S)
    {
        if(fuc3==F3_SB)
        {
            long long pos=(long long)reg[rs1]+ext_signed(immS,12);
            *((char*)memory+pos)=reg[rs2]&0xff;
        }
        else if(fuc3==F3_SH)
        {
            long long pos=(long long)reg[rs1]+ext_signed(immS,12);
            *((unsigned short*)((char*)memory+pos))=reg[rs2]&0xffff;
        }
        else if(fuc3==F3_SW)
        {
            long long pos=(long long)reg[rs1]+ext_signed(immS,12);
            *((unsigned int*)((char*)memory+pos))=reg[rs2]&0xffffffff;
        }
        else if(fuc3==F3_SD)
        {
            long long pos=(long long)reg[rs1]+ext_signed(immS,12);
            *((unsigned long long*)((char*)memory+pos))=reg[rs2];
        }
    }
    else if(OP==OP_SB)
    {
        if(fuc3==F3_BEQ)
        {
            if(reg[rs1]==reg[rs2]){
                PC=(long long)PC+(ext_signed(immSB,13)>>2);
                jumpflag=true;
            }
        }
        else if(fuc3==F3_BNE)
        {
            if(reg[rs1]!=reg[rs2]){
                PC=(long long)PC+(ext_signed(immSB,13)>>2);
                jumpflag=true;
            }
        }
        else if(fuc3==F3_BLT)
        {
            if((long long)reg[rs1]<(long long)reg[rs2]){
                PC=(long long)PC+(ext_signed(immSB,13)>>2);
                jumpflag=true;
            }
        }
        else if(fuc3==F3_BGE)
        {
            if((long long)reg[rs1]>=(long long)reg[rs2]){
                PC=(long long)PC+(ext_signed(immSB,13)>>2);
                jumpflag=true;
            }
        }
    }
    else if(OP==OP_AUIPC)
    {
        reg[rd]=((long long)PC<<2)+ext_signed(immU,32);
    }
    else if(OP==OP_LUI)
    {
        reg[rd]=immU;
    }
    else if(OP==OP_JAL)
    {
        reg[rd]=(PC<<2)+4;
        PC=(long long)PC+(ext_signed(immUJ,21)>>2);
        jumpflag=true;
    }
    else
    {
        //printf("+++\n");
    }
}

void print_regs()
{
	printf("Register:\n");
	for (int i=0;i<32;i++)
	{
		printf("[%2d][%2s]0x%16llx  ",i,RegName[i],reg[i]);
		++i;
		printf("[%2d][%2s]0x%16llx  ",i,RegName[i],reg[i]);
		++i;
		printf("[%2d][%2s]0x%16llx  ",i,RegName[i],reg[i]);
		++i;
		printf("[%2d][%2s]0x%16llx\n",i,RegName[i],reg[i]);
	}
	printf("\n");
}

void print_stack()
{
	printf("Highest 32 Stack: \n");
	for (int i=0;i<32*4;i+=4)
	{
		printf("[%08x] %08x ",MAX/2-i,memory[(MAX/2-i)>>2]);
		i+=4;
		printf("[%08x] %08x ",MAX/2-i,memory[(MAX/2-i)>>2]);
		i+=4;
		printf("[%08x] %08x ",MAX/2-i,memory[(MAX/2-i)>>2]);
		i+=4;
		printf("[%08x] %08x\n",MAX/2-i,memory[(MAX/2-i)>>2]);
	}
	printf("\n");
}
