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
extern unsigned long long bsadr;
extern unsigned long long bssize;

extern Var_info *var_list;
extern unsigned int var_num;

extern char *filename;
extern char *elfname;
extern FILE *file;
extern FILE *elf;

bool TFflag=false;

int CPU_Mode=SINGLE_CYCLE;

//指令运行数
long long inst_num=0;
//时钟周期数
long long cycle_num=0;
//数据冒险数目(流水线)
long long data_hazard=0;
//控制冒险数目(流水线)
long long branch_hazard=0;

//程序结束位置
unsigned long long endpos;

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
		if(strcmp(argv[i],"-S")==0){
            printf("Single Cycle Mode\n");
            CPU_Mode=SINGLE_CYCLE;
            continue;
		}
		if(strcmp(argv[i],"-M")==0){
            printf("Multi Cycle Mode\n");
            CPU_Mode=MULTI_CYCLE;
            continue;
		}
		if(strcmp(argv[i],"-P")==0){
            printf("Pipeline Mode\n");
            CPU_Mode=PIPELINE;
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

	endpos=(endPC/4)-1;

    if(CPU_Mode==SINGLE_CYCLE)
        SingleCycleMode();
    else if(CPU_Mode==MULTI_CYCLE)
        MultiCycleMode();
    else if(CPU_Mode==PIPELINE)
        PipelineMode();

    print_regs();
    print_stack();
    print_var();
    printf("Instruct Num: %lld\n",inst_num);
    printf("Cycle Num   : %lld\n",cycle_num);
    printf("CPI         : %f\n",cycle_num/(double)inst_num);
    if(CPU_Mode==PIPELINE){
        printf("Branch hazard num: %lld\n",branch_hazard);
        printf("Data hazard num  : %lld\n",data_hazard);
    }

	return 0;
}

//加载代码段
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

void SingleCycleMode()
{
    bool jumpflag=false;
    while(PC!=endpos)
	{
        if(TFflag){
            printf("[TF] Instruction:  %08x\n",memory[PC]);
            printf("PC              :  %016llX\n",PC<<2);
        }

        inst_num+=1;
        cycle_num+=1;

        fetch_inst();
        F_D_real=F_D;
	    decode_inst();
	    D_E_real=D_E;
        jumpflag=execute_inst();
        E_M_real=E_M;
        memory_access();
        M_W_real=M_W;
        write_back();

        if(jumpflag)
            PC=E_M.Jump_PC;
        if(exit_flag==1)
            break;
        reg[0]=0;//一直为零

        if(TFflag){
			print_regs();
			print_stack();
			print_var();
			getchar();
		}
	}
}

void MultiCycleMode()
{
    bool jumpflag=false;
    int tempstate;
    state=STATE_IF;
    while(PC!=endpos)
	{
        if(TFflag){
            printf("[TF] Instruction:  %08x\n",memory[PC]);
            printf("PC              :  %016llX\n",PC<<2);
            printf("State           :  %08d\n",state);
        }

        tempstate=state;
        cycle_num+=1;

        switch(state){
        case STATE_IF:
            fetch_inst();
            F_D_real=F_D;
            inst_num+=1;
            break;
        case STATE_ID:
            decode_inst();
            D_E_real=D_E;
            break;
        case STATE_EX_R:
        case STATE_EX_SB:
            jumpflag=execute_inst();
            if(jumpflag)
                PC=E_M.Jump_PC;
            break;
        case STATE_EX_I1:
        case STATE_EX_S:
            execute_inst();
            E_M_real=E_M;
            break;
        case STATE_MEM_I1:
        case STATE_MEM_S:
            memory_access();
            M_W_real=M_W;
            break;
        case STATE_WB_R:
        case STATE_WB_I1:
            write_back();
            break;
        }

        if(tempstate!=STATE_ID)
            state=state_map[tempstate];

        reg[0]=0;//一直为零

        if(TFflag){
			print_regs();
			print_stack();
			print_var();
			getchar();
		}
	}
}

bool endflag=false;

void PipelineMode()
{
    inst_num=-4;
    bool jumpflag=false;
    bool dataflag=false;
    unsigned long long temp_PC=0;

    while(M_W_real.PC!=endpos){
        if(TFflag){
            printf("[TF] Instruction:  %08x\n",memory[PC]);
            printf("PC_IF           :  %016llX\n",PC<<2);
            printf("PC_ID           :  %016llX\n",F_D_real.PC<<2);
            printf("PC_EX           :  %016llX\n",D_E_real.PC<<2);
            printf("PC_MEM          :  %016llX\n",E_M_real.PC<<2);
            printf("PC_WB           :  %016llX\n",M_W_real.PC<<2);
        }

        cycle_num+=1;
        if(!M_W_real.isNop)
            inst_num+=1;
        temp_PC=PC;

        fetch_inst();
	    dataflag=decode_inst();
        jumpflag=execute_inst();
        memory_access();
        write_back();

        if(jumpflag){
            PC=E_M.Jump_PC;
            F_D.isNop=1;
            D_E.isNop=1;
            branch_hazard+=1;
        }
        else if(dataflag){
            PC=F_D_real.PC;
            F_D.isNop=1;
            D_E.isNop=1;
            data_hazard+=1;
        }

        F_D_real=F_D;
        D_E_real=D_E;
        E_M_real=E_M;
        M_W_real=M_W;

        reg[0]=0;

        if(TFflag){
			print_regs();
			print_stack();
			print_var();
			getchar();
		}
    }
}

void fetch_inst()
{
    if(PC==endpos) endflag=true;
    F_D.inst=memory[PC];
    F_D.PC=PC;
    F_D.isNop=endflag;
    PC+=1;
}

bool decode_inst()
{
    unsigned int inst=F_D_real.inst;
    unsigned long long inst_PC=F_D_real.PC;
    int isNop=F_D_real.isNop;

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

	D_E.PC=inst_PC;
	D_E.Rd=rd;
	D_E.Reg_Rs1=reg[rs1];
	D_E.Reg_Rs2=reg[rs2];
	D_E.isNop=isNop;

    if(OP==OP_R)
	{
        state=STATE_EX_R;
        D_E.Imm=0;
        D_E.EX_ALUSrcA=ALUSRCA_REG;
        D_E.EX_ALUSrcB=ALUSRCB_REG;
        D_E.M_Branch=BRANCH_NO;
        D_E.M_MemRead=MEMREAD_NO;
        D_E.M_MemWrite=MEMWRITE_NO;
        D_E.WB_RegWrite=REGWRITE_ALU;

		if(fuc3==F3_ADD&&fuc7==F7_ADD)
		{
            D_E.EX_ALUOp=ALUOP_ADD;
		}
		else if(fuc3==F3_MUL&&fuc7==F7_MUL)
        {
            D_E.EX_ALUOp=ALUOP_MUL;
        }
		else if(fuc3==F3_SUB&&fuc7==F7_SUB)
        {
            D_E.EX_ALUOp=ALUOP_SUB;
        }
        else if(fuc3==F3_SLL&&fuc7==F7_SLL)
        {
            D_E.EX_ALUOp=ALUOP_SLL;
        }
        else if(fuc3==F3_MULH&&fuc7==F7_MULH)
        {
            D_E.EX_ALUOp=ALUOP_MULH;
        }
        else if(fuc3==F3_SLT&&fuc7==F7_SLT)
        {
            D_E.EX_ALUOp=ALUOP_SLT;
        }
        else if(fuc3==F3_XOR&&fuc7==F7_XOR)
        {
            D_E.EX_ALUOp=ALUOP_XOR;
        }
        else if(fuc3==F3_DIV&&fuc7==F7_DIV)
        {
            D_E.EX_ALUOp=ALUOP_DIV;
        }
        else if(fuc3==F3_SRL&&fuc7==F7_SRL)
        {
            D_E.EX_ALUOp=ALUOP_SRL;
        }
        else if(fuc3==F3_SRA&&fuc7==F7_SRA)
        {
            D_E.EX_ALUOp=ALUOP_SRA;
        }
        else if(fuc3==F3_OR&&fuc7==F7_OR)
        {
            D_E.EX_ALUOp=ALUOP_OR;
        }
        else if(fuc3==F3_REM&&fuc7==F7_REM)
        {
            D_E.EX_ALUOp=ALUOP_REM;
        }
        else if(fuc3==F3_AND&&fuc7==F7_AND)
        {
            D_E.EX_ALUOp=ALUOP_AND;
        }
	}
	else if(OP==OP_RW)
	{
        state=STATE_EX_R;
        D_E.Imm=0;
        D_E.EX_ALUSrcA=ALUSRCA_REGW;
        D_E.EX_ALUSrcB=ALUSRCB_REGW;
        D_E.M_Branch=BRANCH_NO;
        D_E.M_MemRead=MEMREAD_NO;
        D_E.M_MemWrite=MEMWRITE_NO;
        D_E.WB_RegWrite=REGWRITE_ALU;

        if(fuc3==F3_ADDW&&fuc7==F7_ADDW)
		{
            D_E.EX_ALUOp=ALUOP_ADD;
		}
		else if(fuc3==F3_MULW&&fuc7==F7_MULW)
        {
            D_E.EX_ALUOp=ALUOP_MUL;
        }
		else if(fuc3==F3_SUBW&&fuc7==F7_SUBW)
        {
            D_E.EX_ALUOp=ALUOP_SUB;
        }
        else if(fuc3==F3_DIVW&&fuc7==F7_DIVW)
        {
            D_E.EX_ALUOp=ALUOP_DIV;
        }
        else if(fuc3==F3_REMW&&fuc7==F7_REMW)
        {
            D_E.EX_ALUOp=ALUOP_REM;
        }
	}
	else if(OP==OP_I1)
	{
        state=STATE_EX_I1;
        D_E.Imm=ext_signed(immI,12);
        D_E.EX_ALUOp=ALUOP_ADD;
        D_E.EX_ALUSrcA=ALUSRCA_REG;
        D_E.EX_ALUSrcB=ALUSRCB_EXT;
        D_E.M_Branch=BRANCH_NO;
        D_E.M_MemWrite=MEMWRITE_NO;
        D_E.WB_RegWrite=REGWRITE_MEM;

        if(fuc3==F3_LB)
		{
            D_E.M_MemRead=MEMREAD_LB;
		}
		else if(fuc3==F3_LH)
        {
            D_E.M_MemRead=MEMREAD_LH;
        }
		else if(fuc3==F3_LW)
        {
            D_E.M_MemRead=MEMREAD_LW;
        }
        else if(fuc3==F3_LD)
        {
            D_E.M_MemRead=MEMREAD_LD;
        }
        else if(fuc3==F3_LBU)
		{
            D_E.M_MemRead=MEMREAD_LBU;
		}
	}
	else if(OP==OP_I2)
    {
        state=STATE_EX_R;
        D_E.Imm=ext_signed(immI,12);
        D_E.EX_ALUSrcA=ALUSRCA_REG;
        D_E.EX_ALUSrcB=ALUSRCB_EXT;
        D_E.M_Branch=BRANCH_NO;
        D_E.M_MemRead=MEMREAD_NO;
        D_E.M_MemWrite=MEMWRITE_NO;
        D_E.WB_RegWrite=REGWRITE_ALU;

        if(fuc3==F3_ADDI)
        {
            D_E.EX_ALUOp=ALUOP_ADD;
        }
        else if(fuc3==F3_SLLI&&fuc7==F7_SLLI)
        {
            D_E.Imm=immI&0x1f;
            D_E.EX_ALUOp=ALUOP_SLL;
        }
        else if(fuc3==F3_SLTI)
        {
            D_E.EX_ALUOp=ALUOP_SLT;
        }
        else if(fuc3==F3_XORI)
        {
            D_E.EX_ALUOp=ALUOP_XOR;
        }
        else if(fuc3==F3_SRLI&&fuc7==F7_SRLI)
        {
            D_E.Imm=immI&0x1f;
            D_E.EX_ALUOp=ALUOP_SRL;
        }
        else if(fuc3==F3_SRAI&&fuc7==F7_SRAI)
        {
            D_E.Imm=immI&0x1f;
            D_E.EX_ALUOp=ALUOP_SRA;
        }
        else if(fuc3==F3_ORI)
        {
            D_E.EX_ALUOp=ALUOP_OR;
        }
        else if(fuc3==F3_ANDI)
        {
            D_E.EX_ALUOp=ALUOP_AND;
        }
    }
    else if(OP==OP_I3)
    {
        state=STATE_EX_R;
        D_E.Imm=ext_signed(immI,12);
        D_E.EX_ALUSrcA=ALUSRCA_REGW;
        D_E.EX_ALUSrcB=ALUSRCB_EXT;
        D_E.M_Branch=BRANCH_NO;
        D_E.M_MemRead=MEMREAD_NO;
        D_E.M_MemWrite=MEMWRITE_NO;
        D_E.WB_RegWrite=REGWRITE_ALU;

        if(fuc3==F3_ADDIW)
        {
            D_E.EX_ALUOp=ALUOP_ADD;
        }
        else if(fuc3==F3_SLLIW)
        {
            D_E.Imm=immI&0x1f;
            D_E.EX_ALUOp=ALUOP_SLL;
        }
        else if(fuc3==F3_SRLIW&&fuc7==F7_SRLIW)
        {
            D_E.Imm=immI&0x1f;
            D_E.EX_ALUOp=ALUOP_SRL;
        }
        else if(fuc3==F3_SRAIW&&fuc7==F7_SRAIW)
        {
            D_E.Imm=immI&0x1f;
            D_E.EX_ALUOp=ALUOP_SRA;
        }
    }
    else if(OP==OP_I4)
    {
        state=STATE_EX_R;

        if(fuc3==F3_JALR)
        {
            D_E.Imm=ext_signed(immI,12);
            D_E.EX_ALUOp=ALUOP_ADD;
            D_E.EX_ALUSrcA=ALUSRCA_REG;
            D_E.EX_ALUSrcB=ALUSRCB_EXT;
            D_E.M_Branch=BRANCH_JALR;
            D_E.M_MemRead=MEMREAD_NO;
            D_E.M_MemWrite=MEMWRITE_NO;
            D_E.WB_RegWrite=REGWRITE_PC;
        }
    }
    else if(OP==OP_I5)
    {
        state=STATE_EX_R;

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
        state=STATE_EX_S;
        D_E.Imm=ext_signed(immS,12);
        D_E.EX_ALUOp=ALUOP_ADD;
        D_E.EX_ALUSrcA=ALUSRCA_REG;
        D_E.EX_ALUSrcB=ALUSRCB_EXT;
        D_E.M_Branch=BRANCH_NO;
        D_E.M_MemRead=MEMREAD_NO;
        D_E.WB_RegWrite=REGWRITE_NO;

        if(fuc3==F3_SB)
        {
            D_E.M_MemWrite=MEMWRITE_SB;
        }
        else if(fuc3==F3_SH)
        {
            D_E.M_MemWrite=MEMWRITE_SH;
        }
        else if(fuc3==F3_SW)
        {
            D_E.M_MemWrite=MEMWRITE_SW;
        }
        else if(fuc3==F3_SD)
        {
            D_E.M_MemWrite=MEMWRITE_SD;
        }
    }
    else if(OP==OP_SB)
    {
        state=STATE_EX_SB;
        D_E.Imm=ext_signed(immSB,13);
        D_E.EX_ALUOp=ALUOP_SUB;
        D_E.EX_ALUSrcA=ALUSRCA_REG;
        D_E.EX_ALUSrcB=ALUSRCB_REG;
        D_E.M_MemRead=MEMREAD_NO;
        D_E.M_MemWrite=MEMWRITE_NO;
        D_E.WB_RegWrite=REGWRITE_NO;

        if(fuc3==F3_BEQ)
        {
            D_E.M_Branch=BRANCH_BEQ;
        }
        else if(fuc3==F3_BNE)
        {
            D_E.M_Branch=BRANCH_BNE;
        }
        else if(fuc3==F3_BLT)
        {
            D_E.M_Branch=BRANCH_BLT;
        }
        else if(fuc3==F3_BGE)
        {
            D_E.M_Branch=BRANCH_BGE;
        }
    }
    else if(OP==OP_AUIPC)
    {
        state=STATE_EX_R;
        D_E.Imm=immU;
        D_E.EX_ALUOp=ALUOP_ADD;
        D_E.EX_ALUSrcA=ALUSRCA_PC;
        D_E.EX_ALUSrcB=ALUSRCB_EXT;
        D_E.M_Branch=BRANCH_NO;
        D_E.M_MemRead=MEMREAD_NO;
        D_E.M_MemWrite=MEMWRITE_NO;
        D_E.WB_RegWrite=REGWRITE_ALU;
    }
    else if(OP==OP_LUI)
    {
        state=STATE_EX_R;
        D_E.Imm=immU;
        D_E.EX_ALUOp=ALUOP_ADD;
        D_E.EX_ALUSrcA=ALUSRCA_REG;
        D_E.EX_ALUSrcB=ALUSRCB_EXT;
        D_E.M_Branch=BRANCH_NO;
        D_E.M_MemRead=MEMREAD_NO;
        D_E.M_MemWrite=MEMWRITE_NO;
        D_E.WB_RegWrite=REGWRITE_ALU;
        D_E.Reg_Rs1=0;
    }
    else if(OP==OP_JAL)
    {
        state=STATE_EX_R;
        D_E.Imm=ext_signed(immUJ,21);
        D_E.EX_ALUOp=ALUOP_ADD;
        D_E.EX_ALUSrcA=ALUSRCA_REG;
        D_E.EX_ALUSrcB=ALUSRCB_EXT;
        D_E.M_Branch=BRANCH_JAL;
        D_E.M_MemRead=MEMREAD_NO;
        D_E.M_MemWrite=MEMWRITE_NO;
        D_E.WB_RegWrite=REGWRITE_PC;
        D_E.Reg_Rs1=0;
    }
    else
    {
        //printf("+++\n");
    }

    if(CPU_Mode==PIPELINE&&isNop)
        return false;

    if(CPU_Mode==PIPELINE){
        bool rs1flag=false;
        bool rs2flag=false;

        if(D_E_real.WB_RegWrite&&!D_E_real.isNop){
            rs1flag|=(D_E_real.Rd==rs1);
            rs2flag|=(D_E_real.Rd==rs2);
        }
        if(E_M_real.WB_RegWrite&&!E_M_real.isNop){
            rs1flag|=(E_M_real.Rd==rs1);
            rs2flag|=(E_M_real.Rd==rs2);
        }
        if(M_W_real.WB_RegWrite&&!M_W_real.isNop){
            rs1flag|=(M_W_real.Rd==rs1);
            rs2flag|=(M_W_real.Rd==rs2);
        }

        if(rs1flag&&(D_E.EX_ALUSrcA==ALUSRCA_REG||D_E.EX_ALUSrcA==ALUSRCA_REGW))
            return true;
        if(rs2flag&&(D_E.EX_ALUSrcB==ALUSRCB_REG||D_E.EX_ALUSrcB==ALUSRCB_REGW||OP==OP_S))
            return true;
    }

    return false;
}

bool execute_inst()
{
    unsigned long long jump_PC=D_E_real.PC;
    bool jumpflag=false;

    switch(D_E_real.M_Branch){
    case BRANCH_JAL:
        jumpflag=true;
    case BRANCH_BEQ:
    case BRANCH_BNE:
    case BRANCH_BLT:
    case BRANCH_BGE:
        jump_PC=((long long)jump_PC*4+D_E_real.Imm)/4;
        break;
    case BRANCH_JALR:
        jumpflag=true;
        break;
    }

    long long ALU_A,ALU_B,ALU_OUT;
    switch(D_E_real.EX_ALUSrcA){
    case ALUSRCA_REG:
        ALU_A=D_E_real.Reg_Rs1;
        break;
    case ALUSRCA_REGW:
        ALU_A=(int)D_E_real.Reg_Rs1;
        break;
    case ALUSRCA_PC:
        ALU_A=D_E_real.PC*4;
        break;
    }

    switch(D_E_real.EX_ALUSrcB){
    case ALUSRCB_REG:
        ALU_B=D_E_real.Reg_Rs2;
        break;
    case ALUSRCB_REGW:
        ALU_B=(int)D_E_real.Reg_Rs2;
        break;
    case ALUSRCB_EXT:
        ALU_B=D_E_real.Imm;
        break;
    }

    switch(D_E_real.EX_ALUOp){
    case ALUOP_ADD:
        ALU_OUT=ALU_A+ALU_B;
        break;
    case ALUOP_MUL:
        ALU_OUT=ALU_A*ALU_B;
        if(CPU_Mode==MULTI_CYCLE||(!D_E_real.isNop&&CPU_Mode==PIPELINE))
            cycle_num+=1;
        break;
    case ALUOP_SUB:
        ALU_OUT=ALU_A-ALU_B;
        if(ALU_OUT==0&&D_E_real.M_Branch==BRANCH_BEQ)
            jumpflag=true;
        if(ALU_OUT!=0&&D_E_real.M_Branch==BRANCH_BNE)
            jumpflag=true;
        if(ALU_OUT<0&&D_E_real.M_Branch==BRANCH_BLT)
            jumpflag=true;
        if(ALU_OUT>=0&&D_E_real.M_Branch==BRANCH_BGE)
            jumpflag=true;
        break;
    case ALUOP_SLL:
        ALU_OUT=ALU_A<<ALU_B;
        break;
    case ALUOP_MULH:
        long long high1,high2,low1,low2;
        high1=(ALU_A>>16)>>16;
        high2=(ALU_B>>16)>>16;
        low1=ALU_A&0xffffffff;
        low2=ALU_B&0xffffffff;
        ALU_OUT=high1*high2+high1*low2+high2*low1;
        if(CPU_Mode==MULTI_CYCLE||(!D_E_real.isNop&&CPU_Mode==PIPELINE))
            cycle_num+=1;
        break;
    case ALUOP_SLT:
        ALU_OUT=(ALU_A<ALU_B)?1:0;
        break;
    case ALUOP_XOR:
        ALU_OUT=ALU_A^ALU_B;
        break;
    case ALUOP_DIV:
        ALU_OUT=ALU_A/ALU_B;
        if(CPU_Mode==MULTI_CYCLE||(!D_E_real.isNop&&CPU_Mode==PIPELINE))
            cycle_num+=39;
        break;
    case ALUOP_SRL:
        ALU_OUT=(unsigned long long)ALU_A>>(unsigned long long)ALU_B;
        break;
    case ALUOP_SRA:
        ALU_OUT=ALU_A>>ALU_B;
        break;
    case ALUOP_OR:
        ALU_OUT=ALU_A|ALU_B;
        break;
    case ALUOP_REM:
        ALU_OUT=ALU_A%ALU_B;
        if(CPU_Mode==MULTI_CYCLE||(!D_E_real.isNop&&CPU_Mode==PIPELINE))
            cycle_num+=39;
        break;
    case ALUOP_AND:
        ALU_OUT=ALU_A&ALU_B;
        break;
    default:
        ALU_OUT=0;
    }

    if(D_E_real.M_Branch==BRANCH_JALR)
        jump_PC=ALU_OUT/4;

    E_M.PC=D_E_real.PC;
    E_M.Jump_PC=jump_PC;
    E_M.Rd=D_E_real.Rd;
    E_M.ALU_out=ALU_OUT;
    E_M.Reg_Rs2=D_E_real.Reg_Rs2;
    E_M.isNop=D_E_real.isNop;
    E_M.havePushedRd=D_E_real.havePushedRd;
    E_M.M_Branch=D_E_real.M_Branch;
    E_M.M_MemRead=D_E_real.M_MemRead;
    E_M.M_MemWrite=D_E_real.M_MemWrite;
    E_M.WB_RegWrite=D_E_real.WB_RegWrite;

    E_W.PC=D_E_real.PC;
    E_W.Jump_PC=jump_PC;
    E_W.Rd=D_E_real.Rd;
    E_W.ALU_out=ALU_OUT;
    E_W.isNop=D_E_real.isNop;
    E_W.havePushedRd=D_E_real.havePushedRd;
    E_W.WB_RegWrite=D_E_real.WB_RegWrite;

    if(CPU_Mode==PIPELINE&&D_E_real.isNop)
        return false;

    return jumpflag;
}

void memory_access()
{
    unsigned long long mem_read;
    unsigned long long pos=E_M_real.ALU_out;

    if(E_M_real.M_MemRead==MEMREAD_LB){
        unsigned int content=*((char*)memory+pos);
        mem_read=ext_signed(content,8);
    }
    else if(E_M_real.M_MemRead==MEMREAD_LH){
        unsigned int content=*((unsigned short*)((char*)memory+pos));
        mem_read=ext_signed(content,16);
    }
    else if(E_M_real.M_MemRead==MEMREAD_LW){
        unsigned int content=*((unsigned int*)((char*)memory+pos));
        mem_read=ext_signed(content,32);
    }
    else if(E_M_real.M_MemRead==MEMREAD_LD){
        unsigned long long content=*((unsigned long long*)((char*)memory+pos));
        mem_read=content;
    }
    else if(E_M_real.M_MemRead==MEMREAD_LBU){
        unsigned int content=*((char*)memory+pos);
        mem_read=content;
    }

    if(E_M_real.M_MemWrite==MEMWRITE_SB&&!E_M_real.isNop){
        *((char*)memory+pos)=E_M_real.Reg_Rs2&0xff;
    }
    else if(E_M_real.M_MemWrite==MEMWRITE_SH&&!E_M_real.isNop){
        *((unsigned short*)((char*)memory+pos))=E_M_real.Reg_Rs2&0xffff;
    }
    else if(E_M_real.M_MemWrite==MEMWRITE_SW&&!E_M_real.isNop){
        *((unsigned int*)((char*)memory+pos))=E_M_real.Reg_Rs2&0xffffffff;
    }
    else if(E_M_real.M_MemWrite==MEMWRITE_SD&&!E_M_real.isNop){
        *((unsigned long long*)((char*)memory+pos))=E_M_real.Reg_Rs2;
    }

    M_W.PC=E_M_real.PC;
    M_W.Mem_read=mem_read;
    M_W.ALU_out=E_M_real.ALU_out;
    M_W.Rd=E_M_real.Rd;
    M_W.isNop=E_M_real.isNop;
    M_W.havePushedRd=E_M_real.havePushedRd;
    M_W.WB_RegWrite=E_M_real.WB_RegWrite;
}

void write_back()
{
    unsigned long long inst_PC;
    unsigned long long mem_read;
    unsigned long long ALUout;
    int Rd;
    int isNop;
    int havePushedRd;
    int RegWrite;

    if(CPU_Mode==PIPELINE&&M_W_real.isNop)
        return;

    if(state==STATE_WB_R&&CPU_Mode==MULTI_CYCLE){
        inst_PC=E_W.PC;
        ALUout=E_W.ALU_out;
        Rd=E_W.Rd;
        isNop=E_W.isNop;
        havePushedRd=E_W.havePushedRd;
        RegWrite=E_W.WB_RegWrite;
    }
    else{
        inst_PC=M_W_real.PC;
        mem_read=M_W_real.Mem_read;
        ALUout=M_W_real.ALU_out;
        Rd=M_W_real.Rd;
        isNop=M_W_real.isNop;
        havePushedRd=M_W_real.havePushedRd;
        RegWrite=M_W_real.WB_RegWrite;
    }

    if(RegWrite==REGWRITE_ALU)
        reg[Rd]=ALUout;
    else if(RegWrite==REGWRITE_MEM)
        reg[Rd]=mem_read;
    else if(RegWrite==REGWRITE_PC)
        reg[Rd]=inst_PC*4+4;
    else if(RegWrite==REGWRITE_ALUEXT)
        reg[Rd]=ext_signed(ALUout,32);
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

void print_var()
{
    printf("Variable: \n");
    for (int i=0;i<var_num;i++)
	{
        printf("[%s]: ",var_list[i].varname);
        for(int j=0;j<var_list[i].varsize;j+=4){
            printf("%08x ",memory[(j+var_list[i].varaddr)>>2]);
        }
		printf("\n");
	}
	printf("\n");
}
