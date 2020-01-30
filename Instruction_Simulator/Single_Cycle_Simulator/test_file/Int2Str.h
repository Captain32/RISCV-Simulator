
int Int2Str(int num,char *str)
{
    int len=0,neg=0;
    if(num<0){
        neg=1;
        num=(~num)+1;
    }
    if(num==0){
        str[len++]='0';
        return len;
    }
    while(num!=0){
        str[len++]=num%10+'0';
        num/=10;
    }
    if(neg) str[len++]='-';

    for(int i=0;i<len/2;i++){
        char tmp=str[i];
        str[i]=str[len-i-1];
        str[len-i-1]=tmp;
    }
    return len;
}
