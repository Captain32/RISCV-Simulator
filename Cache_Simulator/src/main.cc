#include "stdio.h"
#include "cache.h"
#include "memory.h"
#include<string.h>

char *filename;
FILE *file;
Memory m;
Cache l1;
StorageLatency ml,ll;
CacheConfig cc;
StorageStats s;

void init()
{
    l1.SetLower(&m);
    cc.e=3;  //8-way
    cc.b=6;  //64bytes
    cc.c=15; //32KB
    cc.write_through=0;
    cc.write_allocate=1;
    ll.bus_latency=3;
    ll.hit_latency=10;
    ml.bus_latency=6;
    ml.hit_latency=100;

	s.access_counter = 0;
	s.access_time = 0;
	s.fetch_num = 0;
	s.miss_num = 0;
	s.prefetch_num = 0;
	s.replace_num = 0;

	m.SetStats(s);
	l1.SetStats(s);
}

int main(int argc,char *argv[]) {
    init();
    for(int i=1;i<argc;i++)
	{
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
		if(strcmp(argv[i],"-CS") == 0)
		{
			if(i+1>=argc){
				printf("No Cache Size parameter\n");
				return -1;
			}
			cc.c=atoi(argv[i+1]);
            i+=1;
			continue;
		}
		if(strcmp(argv[i],"-BS") == 0)
		{
			if(i+1>=argc){
				printf("No Block Size parameter\n");
				return -1;
			}
			cc.b=atoi(argv[i+1]);
            i+=1;
			continue;
		}
		if(strcmp(argv[i],"-A") == 0)
		{
			if(i+1>=argc){
				printf("No Block Associativity parameter\n");
				return -1;
			}
			cc.e=atoi(argv[i+1]);
            i+=1;
			continue;
		}
		if(strcmp(argv[i],"-WT") == 0)
		{
			if(i+1>=argc){
				printf("No Block Write Through parameter\n");
				return -1;
			}
			cc.write_through=atoi(argv[i+1]);
            i+=1;
			continue;
		}
		if(strcmp(argv[i],"-WA") == 0)
		{
			if(i+1>=argc){
				printf("No Block Write Allocate parameter\n");
				return -1;
			}
			cc.write_allocate=atoi(argv[i+1]);
            i+=1;
			continue;
		}
		if(strcmp(argv[i],"-CHL") == 0)
		{
			if(i+1>=argc){
				printf("No Block Cache Hit Latency parameter\n");
				return -1;
			}
			ll.hit_latency=atoi(argv[i+1]);
            i+=1;
			continue;
		}
		if(strcmp(argv[i],"-CBL") == 0)
		{
			if(i+1>=argc){
				printf("No Block Cache Bus Latency parameter\n");
				return -1;
			}
			ll.bus_latency=atoi(argv[i+1]);
            i+=1;
			continue;
		}
		if(strcmp(argv[i],"-MHL") == 0)
		{
			if(i+1>=argc){
				printf("No Block Memory Hit Latency parameter\n");
				return -1;
			}
			ml.hit_latency=atoi(argv[i+1]);
            i+=1;
			continue;
		}
		if(strcmp(argv[i],"-MBL") == 0)
		{
			if(i+1>=argc){
				printf("No Block Memory Bus Latency parameter\n");
				return -1;
			}
			ml.bus_latency=atoi(argv[i+1]);
            i+=1;
			continue;
		}
		printf("Unknown option: %s\n",argv[i]);
		return -2;
	}

    m.SetStats(s);
    l1.SetStats(s);

    m.SetLatency(ml);
    l1.SetLatency(ll);

    l1.SetConfig(cc);
    l1.BuildCache();

    int hit, time;
    char content[64];

    char line[100];
    int linenum=0;
    while(!feof(file))
	{
        char type;
        int addr,read;
        memset(line,0,sizeof(line));
		fgets(line,100,file);
		if(strlen(line)==0) break;
		sscanf(line,"%c %x",&type,&addr);
		if(type=='r') read=1;
		else if(type=='w') read=0;
		else break;
		l1.HandleRequest(addr,8,read,content,hit,time);
	}
	l1.GetStats(s);
	printf("Total L1 access counter:%d\n",s.access_counter);
	printf("Total L1 access cycle:%d\n",s.access_time);
	printf("Total L1 miss num:%d\n",s.miss_num);
	printf("Total L1 replace num:%d\n",s.replace_num);
	printf("Total L1 miss rate:%f\n",(double)s.miss_num/(double)s.access_counter);

	m.GetStats(s);
	printf("Total Mem access counter:%d\n",s.access_counter);
	printf("Total Mem access cycle:%d\n",s.access_time);

  return 0;
}
