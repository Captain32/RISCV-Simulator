#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include "Int2Str.h"
#include "syscall_riscv.h"

void matrixmul(int a[5][5],int b[5][5],int c[5][5],int m,int n,int k) //c=a*b，a为m行n列，b为n行k列，c为m行k列
{
    int i,j,l;
    for(i=0;i<m;i++){
        for(j=0;j<k;j++){
            c[i][j]=0;
            for(l=0;l<n;l++)
                c[i][j]+=(a[i][l]*b[l][j]);
        }
    }
}

void printmatrix(int c[5][5])
{
    char buf[20];
    int len;
    for(int i=0;i<5;i++){
        for(int j=0;j<5;j++){
            len=Int2Str(c[i][j],buf);
            my_syscall(64,STDOUT_FILENO,(long long)buf,len,0);
            buf[0]=' ';
            my_syscall(64,STDOUT_FILENO,(long long)buf,1,0);
        }
        buf[0]='\n';
        my_syscall(64,STDOUT_FILENO,(long long)buf,1,0);
    }
    buf[0]='\n';
    my_syscall(64,STDOUT_FILENO,(long long)buf,1,0);
}

int main()
{
    int a[5][5],b[5][5],c[5][5];
    for(int i=0;i<5;i++)
        for(int j=0;j<5;j++){
            a[i][j]=i%2+j%3;
            b[i][j]=i%3+j%2;
        }
    matrixmul(a,b,c,5,5,5);
    printmatrix(a);
    printmatrix(b);
    printmatrix(c);
}
