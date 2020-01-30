typedef unsigned long long REG;

//取指与译码之间的寄存器
struct FD
{
	// inst means the instruction which is going to execute.
	unsigned int inst;
	// PC means the index of the instruction.
	unsigned long long PC;
	// isNop = 1 means is a Nop instruction.
	int isNop;

}F_D,F_D_real;

//译码与执行之间的寄存器
struct DE
{
	unsigned long long PC;  // The PC of this instruction.
	int Rd;
	REG Reg_Rs1,Reg_Rs2;
	int Imm;
	int isNop;
	// Whether this instruction has pushe Rd into RdQueue or not.
	// havePushedRd = 1 means have pushed.
	int havePushedRd;
	int EX_ALUSrcA;
	int EX_ALUSrcB;
	int EX_ALUOp;

	int M_Branch;
	int M_MemWrite;
	int M_MemRead;

	int WB_RegWrite;

}D_E,D_E_real;

//执行与访存之间的寄存器
struct EM
{
	unsigned long long PC;  // The PC of this instruction.
	unsigned long long Jump_PC;
	int Rd;
	REG ALU_out;
	REG Reg_Rs2;  // In S type, write it into memory.
	int isNop;
	int havePushedRd;

	int M_Branch;
	int M_MemWrite;
	int M_MemRead;

	int WB_RegWrite;

}E_M,E_M_real;

//执行与写回之间的寄存器
struct EW
{
	unsigned long long PC;  // The PC of this instruction.
	unsigned long long Jump_PC;
	REG ALU_out;
	int Rd;
	int isNop;
	int havePushedRd;

	int WB_RegWrite;

}E_W,E_W_real;

//访存与写回之间的寄存器
struct MW
{
	unsigned long long PC;  // The PC of this instruction.
	unsigned long long Mem_read;  // The data from the memory.
	REG ALU_out;
	int Rd;
	int isNop;
	int havePushedRd;

	int WB_RegWrite;

}M_W,M_W_real;
