#include<iostream>
#include<stdio.h>
#include<math.h>
#include <io.h>
//#include <process.h>
#include<time.h>
#include<stdlib.h>


//R type
#define OP_R 0x33
#define F3_ADD 0
#define F7_ADD 0
#define F3_MUL 0
#define F7_MUL 0x01
#define F3_SUB 0
#define F7_SUB 0x20
#define F3_SLL 0x1
#define F7_SLL 0
#define F3_MULH 0x1
#define F7_MULH 0x1
#define F3_SLT 0x2
#define F7_SLT 0
#define F3_XOR 0x4
#define F7_XOR 0
#define F3_DIV 0x4
#define F7_DIV 0x1
#define F3_SRL 0x5
#define F7_SRL 0
#define F3_SRA 0x5
#define F7_SRA 0x20
#define F3_OR 0x6
#define F7_OR 0
#define F3_REM 0x6
#define F7_REM 0x1
#define F3_AND 0x7
#define F7_AND 0

// RW Type
#define OP_RW 0x3B
#define F3_ADDW 0
#define F7_ADDW 0
#define F3_SUBW 0
#define F7_SUBW 0x20
#define F3_MULW 0
#define F7_MULW 0x1
#define F3_DIVW 0x4
#define F7_DIVW 0x1
#define F3_REMW 0x6
#define F7_REMW 0x1

//I type 1
#define OP_I1 3
#define F3_LB 0
#define F3_LH 1
#define F3_LW 2
#define F3_LD 3
#define F3_LBU 4

//I type 2
#define OP_I2 0x13
#define F3_ADDI 0
#define F3_SLLI 1
#define F7_SLLI 0
#define F3_SLTI 0x2
#define F3_XORI 0x4
#define F3_SRLI 0x5
#define F7_SRLI 0
#define F3_SRAI 0x5
#define F7_SRAI 0x10
#define F3_ORI 0x6
#define F3_ANDI 0x7

//I type 3
#define OP_I3 0x1B
#define F3_ADDIW 0
#define F3_SLLIW 1
#define F3_SRLIW 5
#define F7_SRLIW 0
#define F3_SRAIW 5
#define F7_SRAIW 32

//I type 4
#define OP_I4 0x67
#define F3_JALR 0

//I type 5
#define OP_I5 0x73
#define F3_ECALL 0
#define F7_ECALL 0


//S type
#define OP_S 0x23
#define F3_SB 0
#define F3_SH 1
#define F3_SW 2
#define F3_SD 3

//SB type
#define OP_SB 0x63
#define F3_BEQ 0
#define F3_BNE 1
#define F3_BLT 4
#define F3_BGE 5

//U type
#define OP_AUIPC 0x17
#define OP_LUI 0x37

//UJ type
#define OP_JAL 0x6f

#define MAX 100000000

typedef unsigned long long REG;

//主存
unsigned int memory[MAX]={0};
//寄存器堆
REG reg[32]={0};
//PC
unsigned long long PC=0;

//指令寄存器
unsigned int inst=0;

//各个指令解析段
unsigned int OP=0;
unsigned int fuc3=0,fuc7=0;
int shamt=0;
int rs1=0,rs2=0,rd=0;
unsigned int immI=0;
unsigned int immS=0;
unsigned int immSB=0;
unsigned int immU=0;
unsigned int immUJ=0;

//加载内存
void load_memory();

//译码
void translate_inst();

//执行
void execute_inst();

//符号扩展
long long ext_signed(unsigned int src,int bit);

//打印寄存器
void print_regs();

//打印栈
void print_stack();

//获取指定位
unsigned int getbit(unsigned int instruction,int s,int e);

unsigned int getbit(unsigned int instruction,int s,int e)
{
    unsigned int mask=0;
	for(int i=s;i<=e;i++)
		mask+=(1<<i);
	instruction=instruction&mask;
	instruction=instruction>>s;
	return instruction;
}

long long ext_signed(unsigned int src,int bit)
{
    long long int result=src;
    long long int mask=1<<(bit-1);
    long long int sign=mask&result;
    if(sign==0) return result;
    for(int i=bit;i<=64;i++){
        result|=sign;
        sign<<=1;
    }
    return result;
}

char RegName[32][3] = {
	"0", "ra", "sp", "gp", "tp", "t0", "t1", "t2",
	"s0", "s1", "a0", "a1", "a2", "a3", "a4", "a5",
	"a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7",
	"s8", "s9", "sa", "sb", "t3", "t4", "t5", "t6"
};
