#include "stdio.h"
#include "cache.h"
#include "memory.h"
#include<string.h>

char *filename;
FILE *file;
Memory m;
Cache l1,l2;
StorageStats s;
CacheConfig cc1,cc2;

void init_cache()
{
	cc1.c = 15;
	cc1.e = 3;
	cc1.b = 6;
	cc1.write_through = 0;
	cc1.write_allocate = 1;
	cc1.replace_type=RP_LRU;
	cc1.prefetch_num=0;

	cc2.c = 18;
	cc2.e = 3;
	cc2.b = 6;
	cc2.write_through = 0;
	cc2.write_allocate = 1;
	cc2.replace_type=RP_LRU;
	cc2.prefetch_num=0;

	l1.SetLower(&l2);
	l2.SetLower(&m);

	s.access_counter = 0;
	s.access_time = 0;
	s.fetch_num = 0;
	s.miss_num = 0;
	s.prefetch_num = 0;
	s.replace_num = 0;

	m.SetStats(s);
	l1.SetStats(s);
	l2.SetStats(s);

	StorageLatency ml;
	ml.bus_latency = 0;
	ml.hit_latency = 100;  // 100 cycles
	m.SetLatency(ml);

	StorageLatency ll1,ll2;
	ll1.bus_latency = 0;
	ll1.hit_latency = 3;  // 1 cycle.
	l1.SetLatency(ll1);
	ll2.bus_latency = 6;
	ll2.hit_latency = 4;
	l2.SetLatency(ll2);
}

int main(int argc,char *argv[]) {
    init_cache();
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
		if(strcmp(argv[i],"-LIRS")==0){
            if (i+1>=argc){
				printf("No cache name\n");
				return -1;
			}
			if(strcmp(argv[i+1],"l1")==0)
                cc1.replace_type=RP_LIRS;
            else if(strcmp(argv[i+1],"l2")==0)
                cc2.replace_type=RP_LIRS;
            else{
                printf("Invalid cache name\n");
                return -1;
            }
            i++;
			continue;
		}
		if(strcmp(argv[i],"-PNUM")==0){
            if (i+1>=argc){
				printf("No cache name\n");
				return -1;
			}
			if(strcmp(argv[i+1],"l1")==0){
                if(i+2>=argc){
                    printf("No prefetch num\n");
                    return -1;
                }
                cc1.prefetch_num=atoi(argv[i+2]);
            }
            else if(strcmp(argv[i+1],"l2")==0){
                if(i+2>=argc){
                    printf("No prefetch num\n");
                    return -1;
                }
                cc2.prefetch_num=atoi(argv[i+2]);
            }
            else{
                printf("Invalid cache name\n");
                return -1;
            }
            i+=2;
			continue;
		}
		printf("Unknown option: %s\n",argv[i]);
		return -2;
	}
    l1.SetConfig(cc1);
	l2.SetConfig(cc2);
	l1.BuildCache();
	l2.BuildCache();

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
		//getchar();
	}
	double l1_missrate,l2_missrate;

	l1.GetStats(s);
	printf("Total L1 access counter:%d\n",s.access_counter);
	printf("Total L1 access cycle:%d\n",s.access_time);
	printf("Total L1 miss num:%d\n",s.miss_num);
	printf("Total L1 replace num:%d\n",s.replace_num);
	printf("Total L1 miss rate:%f\n",(double)s.miss_num/(double)s.access_counter);
    l1_missrate=(double)s.miss_num/(double)s.access_counter;

	l2.GetStats(s);
	printf("Total L2 access counter:%d\n",s.access_counter);
	printf("Total L2 access cycle:%d\n",s.access_time);
	printf("Total L2 miss num:%d\n",s.miss_num);
	printf("Total L2 replace num:%d\n",s.replace_num);
	printf("Total L2 miss rate:%f\n",(double)s.miss_num/(double)s.access_counter);
	l2_missrate=(double)s.miss_num/(double)s.access_counter;

	m.GetStats(s);
	printf("Total Mem access counter:%d\n",s.access_counter);
	printf("Total Mem access cycle:%d\n",s.access_time);

	double AMAT=l1.latency_.bus_latency+l1.latency_.hit_latency
               +l1_missrate*(l2.latency_.bus_latency+l2.latency_.hit_latency
               +l2_missrate*(m.latency_.bus_latency+m.latency_.hit_latency));
    printf("AMAT:%f\n",AMAT);

  return 0;
}
