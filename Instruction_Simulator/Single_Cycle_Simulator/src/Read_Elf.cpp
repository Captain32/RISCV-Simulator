#include"Read_Elf.h"

Elf64_Ehdr elf64_hdr;

//Program headers
unsigned long long padr=0;
unsigned long long psize=0;
unsigned long long pnum=0;

//Section Headers
unsigned long long sadr=0;
unsigned long long ssize=0;
unsigned long long snum=0;
unsigned long long sstridx=0;

//Symbol table
unsigned long long symnum=0;
unsigned long long symadr=0;
unsigned long long symsize=0;

//String table
unsigned long long stradr=0;
unsigned long long strsize=0;

unsigned long long coff=0;
unsigned long long cadr=0;
unsigned long long csize=0;
unsigned long long doff=0;
unsigned long long dadr=0;
unsigned long long dsize=0;
unsigned long long sdoff=0;
unsigned long long sdadr=0;
unsigned long long sdsize=0;
unsigned long long rdoff=0;
unsigned long long rdadr=0;
unsigned long long rdsize=0;
unsigned long long gp=0;
unsigned long long madr=0;
unsigned long long msize=0;
unsigned long long endPC=0;
unsigned long long entry=0;

char *filename;
char *elfname;
FILE *file=NULL;
FILE *elf=stdout;

void read_elf()
{
	fprintf(elf,"ELF Header:\n");
	read_Elf_header();

	fprintf(elf,"\n\nSection Headers:\n");
	read_elf_sections();

	fprintf(elf,"\n\nProgram Headers:\n");
	read_Phdr();

	fprintf(elf,"\n\nSymbol table:\n");
	read_symtable();

	entry=madr;
	endPC=entry+msize;

	fclose(elf);
}

void read_Elf_header()
{
	//file should be relocated
	fread(&elf64_hdr,1,sizeof(elf64_hdr),file);

	fprintf(elf," magic number:  ");
	for (int i=EI_MAG0;i<=EI_MAG3;i++)
		fprintf(elf,"%.2x ",elf64_hdr.e_ident[i]);
	fprintf(elf,"\n");

	fprintf(elf," Class:  ");
    switch(elf64_hdr.e_ident[EI_CLASS]){
    case ELFCLASS64: fprintf(elf,"ELFCLASS64\n"); break;
    case ELFCLASS32: fprintf(elf,"ELFCLASS32\n"); break;
    default: fprintf(elf,"Invalid\n");
    }

	fprintf(elf," Data:  2's complement, ");
	switch(elf64_hdr.e_ident[EI_DATA]){
    case ELFDATALSB: fprintf(elf,"little endian\n"); break;
    case ELFDATAMSB: fprintf(elf,"big endian\n"); break;
    default: fprintf(elf,"Invalid\n");
    }

	fprintf(elf," Version:   ");
	switch(elf64_hdr.e_ident[EI_VERSION]){
    case EV_CURRENT: fprintf(elf,"1 (current)\n"); break;
    default: fprintf(elf,"Invalid\n");
    }

	fprintf(elf," OS/ABI:	 ");
    switch(elf64_hdr.e_ident[EI_OSABI])
	{
	case SYSTEMV: fprintf(elf,"System V\n"); break;
	case HPUX: fprintf(elf,"HP-UX\n"); break;
	case NETBSD: fprintf(elf,"NetBSD\n"); break;
	case LINUX: fprintf(elf,"Linux\n"); break;
	case GNUHURD: fprintf(elf,"GNU Hurd\n"); break;
	case SOLARIS: fprintf(elf,"Solaris\n"); break;
	case AIX: fprintf(elf,"AIX\n"); break;
	case IRIX: fprintf(elf,"IRIX\n"); break;
	case FREEBSD: fprintf(elf,"FreeBSD\n"); break;
	case TUR64: fprintf(elf,"Tru64\n"); break;
	case NOVELL: fprintf(elf,"Novell Modesto\n"); break;
	case OPENBSD: fprintf(elf,"OpenBSD\n"); break;
	case OPENVMS: fprintf(elf,"OpenVMS\n"); break;
	case NONSTOP: fprintf(elf,"NonStop Kernel\n"); break;
	case AROS: fprintf(elf,"AROS\n"); break;
	case FENIXOS: fprintf(elf,"Fenix OS\n"); break;
	case CLOUDABI: fprintf(elf,"CloudABI\n"); break;
	default: fprintf(elf,"Unknown 0x%x\n", elf64_hdr.e_ident[EI_OSABI]);
	}

	fprintf(elf," ABI Version:   0x%x\n",elf64_hdr.e_ident[EI_ABIVERSION]);


	fprintf(elf," Type:  ");
	switch(elf64_hdr.e_type){
	case ET_NONE: fprintf(elf,"Invalid\n"); break;
	case ET_REL: fprintf(elf,"Relocatable file\n"); break;
	case ET_EXEC: fprintf(elf,"Executable file\n"); break;
	case ET_DYN: fprintf(elf,"Shared object file\n"); break;
	case ET_CORE: fprintf(elf,"Core file\n"); break;
	default: fprintf(elf,"Unknown type 0x%x\n",elf64_hdr.e_type);
	}

	fprintf(elf," Machine:   ");
	switch(elf64_hdr.e_machine){
	case EM_NONE: fprintf(elf,"Invalid\n"); break;
	case EM_M32: fprintf(elf,"AT&T WE  32100\n"); break;
	case EM_SPARC: fprintf(elf,"SPARC\n"); break;
	case EM_X86: fprintf(elf,"x86\n"); break;
	case EM_MIPS: fprintf(elf,"MIPS\n"); break;
	case EM_POWERPC: fprintf(elf,"PowerPC\n"); break;
	case EM_S390: fprintf(elf,"S390\n"); break;
	case EM_ARM: fprintf(elf,"ARM\n"); break;
	case EM_SUPERH: fprintf(elf,"SuperH\n"); break;
	case EM_IA64: fprintf(elf,"IA-64\n"); break;
	case EM_X8664: fprintf(elf,"x86-64\n"); break;
	case EM_AARCH64: fprintf(elf,"AArch64\n"); break;
	case EM_RISCV: fprintf(elf,"RISC-V\n"); break;
	default: fprintf(elf, "Unknown 0x%x\n", elf64_hdr.e_machine);
	}

	fprintf(elf," Version:  0x%x\n",elf64_hdr.e_version);

	fprintf(elf," Entry point address:  0x%llx\n",elf64_hdr.e_entry);

	fprintf(elf," Start of program headers:   %lld (bytes into  file)\n",elf64_hdr.e_phoff);
	padr=elf64_hdr.e_phoff;

	fprintf(elf," Start of section headers:   %lld (bytes into  file)\n",elf64_hdr.e_shoff);
	sadr=elf64_hdr.e_shoff;

	fprintf(elf," Flags:  0x%x\n",elf64_hdr.e_flags);

	fprintf(elf," Size of this header:   %d Bytes\n",elf64_hdr.e_ehsize);

	fprintf(elf," Size of program headers:   %d Bytes\n",elf64_hdr.e_phentsize);
	psize=elf64_hdr.e_phentsize;

	fprintf(elf," Number of program headers:   %d\n",elf64_hdr.e_phnum);
	pnum=elf64_hdr.e_phnum;

	fprintf(elf," Size of section headers:    %d Bytes\n",elf64_hdr.e_shentsize);
	ssize=elf64_hdr.e_shentsize;

	fprintf(elf," Number of section headers:  %d\n",elf64_hdr.e_shnum);
	snum=elf64_hdr.e_shnum;

	fprintf(elf," Section header string table index:   %d\n",elf64_hdr.e_shstrndx);
	sstridx=elf64_hdr.e_shstrndx;
}

void read_elf_sections()
{

	Elf64_Shdr elf64_shdr;

	//找到放节名称表的节头条目
	fseek(file,sadr+sstridx*sizeof(Elf64_Shdr),0);
	fread(&elf64_shdr,1,sizeof(elf64_shdr),file);
    //找到放节名称表的节
	fseek(file,elf64_shdr.sh_offset,0);
	unsigned char sectionname[10000];
	//读入整个节名称表
	fread(sectionname,1,elf64_shdr.sh_size,file);
	//回到节头部表
	fseek(file,sadr,0);

	for(int c=0;c<snum;c++)
	{
		fprintf(elf," [%3d]\n",c);

		//file should be relocated
		fread(&elf64_shdr,1,sizeof(elf64_shdr),file);

		fprintf(elf," Name: ");
		const char *sec_name=(const char*)(sectionname+elf64_shdr.sh_name);
        fprintf(elf,"%-15s",sec_name);
		if(!strcmp(sec_name,".text")){
            coff=elf64_shdr.sh_offset;
			cadr=elf64_shdr.sh_addr;
			csize=elf64_shdr.sh_size;
		}
		else if(!strcmp(sec_name,".data")){
            doff=elf64_shdr.sh_offset;
			dadr=elf64_shdr.sh_addr;
			dsize=elf64_shdr.sh_size;
		}
		else if(!strcmp(sec_name,".sdata")){
            sdoff=elf64_shdr.sh_offset;
			sdadr=elf64_shdr.sh_addr;
			sdsize=elf64_shdr.sh_size;
		}
		else if(!strcmp(sec_name,".rodata")){
            rdoff=elf64_shdr.sh_offset;
			rdadr=elf64_shdr.sh_addr;
			rdsize=elf64_shdr.sh_size;
		}
		else if(!strcmp(sec_name,".strtab")){
			stradr=elf64_shdr.sh_offset;
			strsize=elf64_shdr.sh_size;
		}
		else if(!strcmp(sec_name,".symtab")){
			symadr=elf64_shdr.sh_offset;
			symsize=elf64_shdr.sh_size;
		}

		fprintf(elf," Type: ");
        switch(elf64_shdr.sh_type){
		case SHT_NULL: fprintf(elf,"%-9s","NULL"); break;
		case SHT_PROGBITS: fprintf(elf,"%-9s","PROGBITS"); break;
		case SHT_SYMTAB: fprintf(elf,"%-9s","SYMTAB"); break;
		case SHT_STRTAB: fprintf(elf,"%-9s","STRTAB"); break;
		case SHT_RELA: fprintf(elf,"%-9s","RELA"); break;
		case SHT_HASH: fprintf(elf,"%-9s","HASH"); break;
		case SHT_DYNAMIC: fprintf(elf,"%-9s","DYNAMIC"); break;
		case SHT_NOTE: fprintf(elf,"%-9s","NOTE"); break;
		case SHT_NOBITS: fprintf(elf,"%-9s","NOBITS"); break;
		case SHT_REL: fprintf(elf,"%-9s","REL"); break;
		case SHT_SHLIB: fprintf(elf,"%-9s","SHLIB"); break;
		case SHT_DYNSYM: fprintf(elf,"%-9s","DYNSYM"); break;
		case SHT_LOPROC: fprintf(elf,"%-9s","LOPROC"); break;
		case SHT_HIPROC: fprintf(elf,"%-9s","HIPROC"); break;
		case SHT_LOUSER: fprintf(elf,"%-9s","LOUSER"); break;
		case SHT_HIUSER: fprintf(elf,"%-9s","HIUSER"); break;
		default: fprintf(elf,"%-9s","Unknown");
		}

		fprintf(elf," Address:  %08llx",elf64_shdr.sh_addr);

		fprintf(elf," Offest:  %08llx\n",elf64_shdr.sh_offset);

		fprintf(elf," Size:  %08llx",elf64_shdr.sh_size);

		fprintf(elf," Entsize:  %08llx",elf64_shdr.sh_entsize);

		fprintf(elf," Flags:   ");
		switch(elf64_shdr.sh_flags){
		case SHF_WRITE: fprintf(elf,"%-5s"," W "); break;
		case SHF_ALLOC: fprintf(elf,"%-5s"," A "); break;
		case SHF_EXECINSTR: fprintf(elf,"%-5s"," E "); break;
		case SHF_MASKPROC: fprintf(elf,"%-5s"," M "); break;
		case SHF_WRITE|SHF_ALLOC: fprintf(elf,"%-5s"," WA "); break;
		case SHF_WRITE|SHF_EXECINSTR: fprintf(elf,"%-5s"," WE"); break;
		case SHF_ALLOC|SHF_EXECINSTR: fprintf(elf,"%-5s"," AE"); break;
		case SHF_WRITE|SHF_ALLOC|SHF_EXECINSTR: fprintf(elf,"%-5s"," WAE"); break;
		default: fprintf(elf,"%-5s"," U ");
		}

		fprintf(elf," Link:  %3d",elf64_shdr.sh_link);

		fprintf(elf," Info:  %3d",elf64_shdr.sh_info);

		fprintf(elf," Align: %3llx\n",elf64_shdr.sh_addralign);

 	}
}

void read_Phdr()
{
	Elf64_Phdr elf64_phdr;
	fseek(file,padr,0);

	for(int c=0;c<pnum;c++)
	{
		fprintf(elf," [%3d]\n",c);

		//file should be relocated
		fread(&elf64_phdr,1,sizeof(elf64_phdr),file);

		fprintf(elf," Type:   ");
		switch(elf64_phdr.p_type){
		case PT_NULL: fprintf(elf,"%-9s","Invalid"); break;
		case PT_LOAD: fprintf(elf,"%-9s","Loadable"); break;
		default: fprintf(elf,"%-9s","Unknown");
		}

		fprintf(elf," Flags:   %08x",elf64_phdr.p_flags);

		fprintf(elf," Offset:   %08llx",elf64_phdr.p_offset);

		fprintf(elf," VirtAddr:  %08llx",elf64_phdr.p_vaddr);

		fprintf(elf," PhysAddr:   %08llx",elf64_phdr.p_paddr);

		fprintf(elf," FileSiz:   %08llx",elf64_phdr.p_filesz);

		fprintf(elf," MemSiz:   %08llx",elf64_phdr.p_memsz);

		fprintf(elf," Align:   %08llx\n",elf64_phdr.p_align);
	}
}


void read_symtable()
{
	Elf64_Sym elf64_sym;
    unsigned char symbolname[10000];

	//读.strtab
	fseek(file,stradr,0);
	fread(symbolname,1,strsize,file);

	//找到.symtab
	fseek(file,symadr,0);
	symnum=symsize/sizeof(Elf64_Sym);

	for(int c=0;c<symnum;c++)
	{
		fprintf(elf," [%3d]   ",c);

		//file should be relocated
		fread(&elf64_sym,1,sizeof(elf64_sym),file);

        const char *sym_name=(const char*)(symbolname+elf64_sym.st_name);
		fprintf(elf," Name:  %40s   ",sym_name);
		if(!strcmp(sym_name,"main")){
			madr=elf64_sym.st_value;
			msize=elf64_sym.st_size;
		}
		else if(!strcmp(sym_name,"__global_pointer$"))
			gp=elf64_sym.st_value;

		fprintf(elf," Bind:   ");
		switch(ELF32_ST_BIND(elf64_sym.st_info)){
		case STB_LOCAL: fprintf(elf,"%-9s","LOCAL"); break;
		case STB_GLOBAL: fprintf(elf,"%-9s","GLOBAL"); break;
		case STB_WEAK: fprintf(elf,"%-9s","WEAK"); break;
		case STB_LOPROC: fprintf(elf,"%-9s","OBJECT"); break;
		case STB_HIPROC: fprintf(elf,"%-9s","HIPROC"); break;
		default: fprintf(elf,"%-9s","Unknown");
		}

		fprintf(elf," Type:   ");
		switch(ELF32_ST_TYPE(elf64_sym.st_info)){
		case STT_NOTYPE: fprintf(elf,"%-9s","NOTYPE");  break;
		case STT_OBJECT: fprintf(elf,"%-9s","OBJECT");  break;
		case STT_FUNC: fprintf(elf,"%-9s","FUNC");  break;
		case STT_SECTION: fprintf(elf,"%-9s","SECTION");  break;
		case STT_FILE: fprintf(elf,"%-9s","FILE");  break;
		case STT_LOPROC: fprintf(elf,"%-9s","OBJECT");  break;
		case STT_HIPROC: fprintf(elf,"%-9s","HIPROC");  break;
		default: fprintf(elf,"%-9s","Unknown");
		}

		fprintf(elf," NDX:   %8d",elf64_sym.st_shndx);

		fprintf(elf," Size:   %8lld",elf64_sym.st_size);

		fprintf(elf," Value:   %16llx\n",elf64_sym.st_value);

	}

}


