#include<iostream>
#include<stdio.h>
#include<math.h>
#include <io.h>
//#include <process.h>
#include<time.h>
#include<stdlib.h>
#include "Register.h"


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

//processor mode
#define SINGLE_CYCLE 0
#define MULTI_CYCLE 1
#define PIPELINE 2

//Multi Cycle mode state
#define STATE_IF 0
#define STATE_ID 1
#define STATE_EX_R 2
#define STATE_EX_I1 3
#define STATE_EX_S 4
#define STATE_EX_SB 5
#define STATE_MEM_I1 6
#define STATE_MEM_S 7
#define STATE_WB_R 8
#define STATE_WB_I1 9

int state_map[10]={
STATE_ID,
-1,
STATE_WB_R,
STATE_MEM_I1,
STATE_MEM_S,
STATE_IF,
STATE_WB_I1,
STATE_IF,
STATE_IF,
STATE_IF
};

//ALU OP
#define ALUOP_ADD 0
#define ALUOP_MUL 1
#define ALUOP_SUB 2
#define ALUOP_SLL 3
#define ALUOP_MULH 4
#define ALUOP_SLT 5
#define ALUOP_XOR 6
#define ALUOP_DIV 7
#define ALUOP_SRL 8
#define ALUOP_SRA 9
#define ALUOP_OR 10
#define ALUOP_REM 11
#define ALUOP_AND 12

//ALU SRC A
#define ALUSRCA_REG 0 //A操作数为rs1
#define ALUSRCA_REGW 1 //A操作数为rs1[31:0]
#define ALUSRCA_PC 2  //A操作数为PC

//ALU SRC B
#define ALUSRCB_REG 0 //B操作数为rs2
#define ALUSRCB_REGW 1 //B操作数为rs2[31:0]
#define ALUSRCB_EXT 2 //B操作数为扩展立即数

//Branch type
#define BRANCH_NO 0 //无跳转
#define BRANCH_JAL 1 //JAL
#define BRANCH_BEQ 2 //BEQ
#define BRANCH_BNE 3 //BNE
#define BRANCH_BLT 4 //BLT
#define BRANCH_BGE 5 //BGE
#define BRANCH_JALR 6 //JALR

//Memread type
#define MEMREAD_NO 0 //无读内存
#define MEMREAD_LB 1 //LB
#define MEMREAD_LH 2 //LH
#define MEMREAD_LW 3 //LW
#define MEMREAD_LD 4 //LD
#define MEMREAD_LBU 5//LBU

//Memwrite type
#define MEMWRITE_NO 0 //无写内存
#define MEMWRITE_SB 1 //SB
#define MEMWRITE_SH 2 //SH
#define MEMWRITE_SW 3 //SW
#define MEMWRITE_SD 4 //SD

//Regwrite type
#define REGWRITE_NO 0 //无写寄存器
#define REGWRITE_ALU 1 //将ALU输出写入寄存器
#define REGWRITE_MEM 2 //将访存结果写入寄存器
#define REGWRITE_PC 3 //将PC+4写入寄存器(JAL与JALR)
#define REGWRITE_ALUEXT 4 //将ALU输出32位扩展写入寄存器

#define MAX 100000000

typedef unsigned long long REG;

//主存
unsigned int memory[MAX]={0};
//寄存器堆
REG reg[32]={0};
//PC
unsigned long long PC=0;
//Multi Cycle状态
int state;

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

//取指
void fetch_inst();

//译码
bool decode_inst();

//执行
bool execute_inst();

//访存
void memory_access();

//写回
void write_back();

//符号扩展
long long ext_signed(unsigned int src,int bit);

//打印寄存器
void print_regs();

//打印栈
void print_stack();

//打印变量
void print_var();

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

void SingleCycleMode();
void MultiCycleMode();
void PipelineMode();
