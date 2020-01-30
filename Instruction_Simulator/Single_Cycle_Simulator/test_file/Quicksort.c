#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include "Int2Str.h"
#include "syscall_riscv.h"

void quicksort(int *a,int s,int e)
{
    if(s>=e) return;
    int pilot=a[s],l=s,r=e,temp=a[s];
    while(l<r){
        while(l<r&&a[r]>=temp) r--;
        a[l]=a[r];
        while(l<r&&a[l]<=temp) l++;
        a[r]=a[l];
    }
    a[l]=pilot;
    quicksort(a,s,l-1);
    quicksort(a,l+1,e);
}

int main()
{
    char buf[20];
    int len;
    int a[10]={5,23,-5,6,7,13,23422,5,67880,1};
    quicksort(a,0,9);
    for(int i=0;i<10;i++){
        len=Int2Str(a[i],buf);
        my_syscall(64,STDOUT_FILENO,(long long)buf,len,0);
        buf[0]=' ';
        my_syscall(64,STDOUT_FILENO,(long long)buf,1,0);
    }
    buf[0]='\n';
    my_syscall(64,STDOUT_FILENO,(long long)buf,1,0);
}
