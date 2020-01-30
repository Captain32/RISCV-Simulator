
static inline long my_syscall(long n,long _a0,long _a1,long _a2,long _a3)
{
    register long a0 asm("a0")=_a0;
    register long a1 asm("a1")=_a1;
    register long a2 asm("a2")=_a2;
    register long a3 asm("a3")=_a3;
    register long a7 asm("a7")=n;

    asm volatile("scall\n"
                :"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a7));
    return a0;
}
