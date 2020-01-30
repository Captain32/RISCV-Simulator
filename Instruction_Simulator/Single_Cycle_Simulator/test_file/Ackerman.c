#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include "Int2Str.h"
#include "syscall_riscv.h"

int ack(int m,int n)
{
	if(m==0)
		return n+1;
	else if(n==0)
		return ack(m-1,1);
	else
		return ack(m-1,ack(m,n-1));
}

void printleft(int i,int j)
{
    char buf[20];
    int len;
    buf[0]='(';
    my_syscall(64,STDOUT_FILENO,(long long)buf,1,0);
    len=Int2Str(i,buf);
    my_syscall(64,STDOUT_FILENO,(long long)buf,len,0);
    buf[0]=',';
    my_syscall(64,STDOUT_FILENO,(long long)buf,1,0);
    len=Int2Str(j,buf);
    my_syscall(64,STDOUT_FILENO,(long long)buf,len,0);
    buf[0]=')'; buf[1]='=';
    my_syscall(64,STDOUT_FILENO,(long long)buf,2,0);
}

int main()
{
    char buf[20];
    int len;
    for(int i=0;i<4;i++)
        for(int j=0;j<4;j++){
            printleft(i,j);
            len=Int2Str(ack(i,j),buf);
            my_syscall(64,STDOUT_FILENO,(long long)buf,len,0);
            buf[0]='\n';
            my_syscall(64,STDOUT_FILENO,(long long)buf,1,0);
        }
    buf[0]='\n';
    my_syscall(64,STDOUT_FILENO,(long long)buf,1,0);
}
